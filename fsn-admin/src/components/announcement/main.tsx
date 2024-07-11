"use client";
import { FontFamily, FontSize, SCREEN, TextColor } from "@/enum/setting";
import Button from "@/lib/button";
import Divide from "@/lib/divide";
import TextField from "@/lib/text-field";
import Typography from "@/lib/typography";
import AddCircleOutlineIcon from "@mui/icons-material/AddCircleOutline";
import FilterListIcon from "@mui/icons-material/FilterList";
import {
  Page,
  ROLES,
  SortField,
  SortOrder,
  rowsPerPage,
} from "@/enum/constants";
import { useEffect, useState } from "react";
import { useDispatch, useSelector } from "react-redux";
import storage from "../../services/storage";
import Select from "../../lib/select";
import DeleteIcon from "@mui/icons-material/Delete";
import AssignmentTurnedInIcon from "@mui/icons-material/AssignmentTurnedIn";
import ConfirmationNumberIcon from "@mui/icons-material/ConfirmationNumber";
import EditIcon from "@mui/icons-material/Edit";
import VisibilityIcon from "@mui/icons-material/Visibility";
import SettingsBackupRestoreOutlinedIcon from "@mui/icons-material/SettingsBackupRestoreOutlined";
import RemoveCircleOutlineIcon from "@mui/icons-material/RemoveCircleOutline";
import { RootState } from "../../redux/store";
import { Pagingation } from "../../lib/pagingation";
import SwitchButton from "../../lib/switch-button";
import { Tooltip } from "@mui/material";
import AddAnnouncement from "./modal/add-announcement";
import { openModal } from "../../redux/slice/modalSlice";
import ViewAnnouncement from "./modal/view-announcement";
import EditAnnouncement from "./modal/edit-announcement";
import { openConfirm } from "../../redux/slice/confirmSlice";
import { closeLoading, openLoading } from "../../redux/slice/loadingSlice";
import { refetchComponent } from "../../redux/slice/refetchSlice";
import { openAlert } from "../../redux/slice/alertSlice";
import moment from "moment";
import { SkeletonTable } from "@/lib/skeleton";
import CancelIcon from "@mui/icons-material/Cancel";
import SearchIcon from "@mui/icons-material/Search";
import api from "../../services/api";

const initialFilter: AnnouncementFilterProps = {
  title: "",
};

export default function Main() {
  const [rowsPage, setRowsPage] = useState(rowsPerPage);
  const [page, setPage] = useState(Page);
  const [order, setOrder] = useState(SortOrder);
  const [orderBy, setOrderBy] = useState(SortField);
  const [count, setCount] = useState(0);
  const [openFilter, setOpenFilter] = useState(false);
  const [filter, setFilter] = useState<AnnouncementFilterProps>(initialFilter);
  const [announcements, setAnnouncements] = useState([]);
  const dispatch = useDispatch();
  const refetchQueries = useSelector((state: RootState) => state.refetch.time);

  const onFilter = () => {};

  // Cancel filter
  const onCancel = () => {};


  const onResentNotification = async (title: string, summary: string, detail: string) => {
    let confirm: ConfirmState = {
      isOpen: true,
      title: `Confirm to resent announcement`,
      message: `Are you sure you want to resent the announcement?`,
      feature: "",
      onConfirm: async () => {
        try {
          const variables = {
            title: title,
            summary: summary,
            detail: detail,
            type: 'admin',
          }
          api.post('/send-notification', variables).then((res) => {
            console.log(res);
            if (res.status === 200) {
              let alert: any = {
                isOpen: true,
                title: "RESEND ANNOUNCEMENT",
                message: `You've successfully created an announcement. An notification is sent to all users`,
                type: "success",
              };
              dispatch(openAlert(alert));
              dispatch(refetchComponent());
            } else {
              let alert: any = {
                isOpen: true,
                title: "CREATE ANNOUNCEMENT",
                message: res.data.message,
                type: "error",
              };
              dispatch(openAlert(alert));
            }
          });
          dispatch(openLoading());
          dispatch(refetchComponent());
        } catch (e: any) {
        } finally {
          dispatch(closeLoading());
        }
      },
    };
    dispatch(openConfirm(confirm));
  };

  const onDeleteAnnouncement = async (id: number) => {
    let confirm: ConfirmState = {
      isOpen: true,
      title: `Confirm to delete announcement`,
      message: `Are you sure you want to delete the announcement?`,
      feature: "",
      onConfirm: async () => {
        try {
          api.delete(`/notification/${id}`).then((res) => {
            console.log(res);
            if (res.status === 200) {
              let alert: any = {
                isOpen: true,
                title: "DELETE ANNOUNCEMENT",
                message: `You've successfully deleted an announcement`,
                type: "success",
              };  
              dispatch(openAlert(alert));
              dispatch(refetchComponent());
            } else {
              let alert: any = {
                isOpen: true,
                title: "DELETE ANNOUNCEMENT",
                message: res.data.message,
                type: "error",
              };
              dispatch(openAlert(alert));
            }
          });
          dispatch(openLoading());
          dispatch(refetchComponent());
        } catch (e: any) {
        } finally {
          dispatch(closeLoading());
        }
      },
    };
    dispatch(openConfirm(confirm));
  };


  useEffect(() => {
    fetchData();
  }, [page, rowsPage, refetchQueries]);

  const fetchData = async () => {
    const params = {
      ...filter,
      page: page + 1,
      perPage: rowsPage,
      sortOrder: order,
      sortField: orderBy,
    };
    try {
      await api
        .get("/notification/admin", {
          params: params,
        })
        .then((res) => {
          setAnnouncements(res.data.data.data);
          setCount(res.data.data.total);
          console.log(res.data.data);
        });
    } catch (error) {}
  };

  const renderFilter = () => {
    return (
      <div className="flex flex-col gap-3">
        {/* Search option */}
        <div className="justify-end items-end grid xl:grid-cols-3 lg:grid-cols-3 xs:grid-cols-1 px-4 gap-4">
          <div>
            <TextField
              placeholder="Search by title"
              label="Title"
              className={`${FontSize.BASE}`}
              value={filter?.title}
              onChange={(e) => {
                setFilter((pre) => ({
                  ...pre,
                  title: e.target.value,
                }));
                dispatch(refetchComponent());
              }}
            />
          </div>
        </div>
        {/* Search button group */}
        <div className="pb-4 px-4 gap-2 flex-row flex">
          <Button
            color="primary"
            endIcon={<SearchIcon></SearchIcon>}
            onClick={onFilter}
          >
            Search
          </Button>
          <Button
            color="error"
            endIcon={<CancelIcon></CancelIcon>}
            onClick={onCancel}
          >
            Cancel
          </Button>
        </div>
      </div>
    );
  };

  const announcementList = announcements?.map((item: any, index: number) => {
    return (
      <tr className="hover:bg-primary-c50 hover:text-grey-c700" key={index}>
        <td className="pl-3 py-4">{rowsPage * page + index + 1}</td>
        <td className="px-1 py-4">{item.title}</td>
        <td className="px-1 py-4">{item.summary}</td>
        <td className="px-1 py-4">{item.detail}</td>
        <td className="px-1 py-4">
          {moment(item.createdAt).format("DD/MM/YYYY hh:mm a")}
        </td>
        <td className="px-1 py-4 flex items-center justify-center">
          {/* Action Button */}
          <div className="flex flex-row gap-2 justify-start items-center">
            {/* <Tooltip title="View">
              <VisibilityIcon
                sx={{ cursor: "pointer" }}
                id={item?.id}
                color="success"
                onClick={() => {
                  handleOpenView(item?.id);
                }}
              />
            </Tooltip>
            <Tooltip title="Edit">
              <EditIcon
                sx={{ cursor: "pointer" }}
                id={item?.id}
                color="success"
                onClick={() => {
                  handleOpenEdit(item?.id);
                }}
              />
            </Tooltip> */}
            

            <Tooltip title="Resend">
              <SettingsBackupRestoreOutlinedIcon
                color="success"
                sx={{ cursor: "pointer" }}
                onClick={() => {
                  onResentNotification(item?.title, item?.summary, item?.detail);
                }}
              />
            </Tooltip>
            <Tooltip title="Delete announcement">
              <DeleteIcon
                color="error"
                sx={{ cursor: "pointer" }}
                onClick={() => {
                  onDeleteAnnouncement(item?.id);
                }}
              />
            </Tooltip>
          </div>
        </td>
      </tr>
    );
  });

  const handlePageChange = (page: number) => {
    setPage(page);
  };
  const handleRowPerPageChange = (e: any) => {
    setRowsPage(parseInt(e.target.value));
  };

  // Open add announcement modal
  const handleOpenAdd = () => {
    const modal = {
      isOpen: true,
      title: "Add announcement",
      content: <AddAnnouncement />,
      screen: SCREEN.BASE,
    };
    dispatch(openModal(modal));
  };

  // Open view announcement modal
  const handleOpenView = (id: string | number) => {
    const modal = {
      isOpen: true,
      title: "View announcement",
      content: <ViewAnnouncement id={id} />,
      screen: SCREEN.BASE,
    };
    dispatch(openModal(modal));
  };

  // Open edit announcement modal
  const handleOpenEdit = (id: string | number) => {
    const modal = {
      isOpen: true,
      title: "Edit announcement",
      content: <EditAnnouncement id={id} />,
      screen: SCREEN.BASE,
    };
    dispatch(openModal(modal));
  };

  return (
    <div className="flex flex-col grow bg-white rounded-2xl px-4 py-4 min-h-[800px]">
      {/* Header */}
      <div className="justify-between items-center flex flex-row py-2">
        <div>
          <Typography
            textColor={TextColor.GREY_700}
            fontSize={FontSize.XL}
            fontFamily={FontFamily.BOLD}
          >
            {" "}
            Announcement{" "}
          </Typography>
        </div>
        {
          <div>
            <Button
              color="primary"
              endIcon={<AddCircleOutlineIcon></AddCircleOutlineIcon>}
              onClick={handleOpenAdd}
            >
              Add announcement
            </Button>
          </div>
        }
      </div>
      {/* Divider */}
      <Divide></Divide>
      {/* Filter icon */}
      <div className="justify-end items-end flex flex-col py-4 px-4 cursor-pointer">
        <Button
          color="secondary"
          endIcon={<FilterListIcon></FilterListIcon>}
          onClick={() => setOpenFilter(!openFilter)}
        >
          Filter
        </Button>
      </div>
      {/* Search */}
      {openFilter && renderFilter()}
      {/* Divider */}
      <Divide></Divide>
      {/* Table */}
      <SkeletonTable loading={false}>
        <div className="max-w-[100%] rounded-[10px] overflow-hidden mt-6">
          <div className="overflow-x-auto">
            <table className="table-auto w-full text-base text-left">
              <thead
                className={`text-grey-c700 uppercase bg-primary-c100 ${FontFamily.BOLD} ${FontSize.BASE}`}
              >
                <tr className="hover:bg-secondary-c100 hover:text-grey-c700">
                  <th className="pl-3 py-4">No</th>
                  <th className="px-1 py-4">Title</th>
                  <th className="px-1 py-4">Message Summary</th>
                  <th className="px-1 py-4">Message Detail</th>
                  <th className="px-1 py-4">Create at</th>
                  <th className="px-1 py-4 text-center">Action</th>
                </tr>
              </thead>
              <tbody>{announcementList}</tbody>
            </table>
          </div>
        </div>
        <Pagingation
          page={page}
          handlePageChange={handlePageChange}
          handleRowPerPageChange={handleRowPerPageChange}
          total={count}
          rowsPerPage={rowsPage}
        />
        {/* Divider */}
        <Divide></Divide>
      </SkeletonTable>
    </div>
  );
}
