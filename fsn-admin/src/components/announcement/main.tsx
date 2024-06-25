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

const initialFilter: AnnouncementFilterProps = {
  title: "",
  status: null,
};

const liveTickerOptions = [
  {
    value: true,
    label: "Yes",
  },
  {
    value: false,
    label: "No",
  },
];

const statusOptions = [
  { label: "Approved", value: "APPROVED" },
  { label: "In-Progress", value: "IN_PROGRESS" },
  { label: "Submit for Approval", value: "SUBMIT_FOR_APPROVAL" },
  { label: "Submit for Termination", value: "SUBMIT_FOR_TERMINATION" },
  { label: "Returned", value: "RETURNED" },
  { label: "Rejected", value: "REJECTED" },
];

const ListStatusAnnouncement = [
  {
    value: "IN_PROGRESS",
    title: "In-progress",
  },
  {
    value: "SUBMIT_FOR_APPROVAL",
    title: "Submit for Approval",
  },
  {
    value: "SUBMIT_FOR_TERMINATION",
    title: "Submit for Termination",
  },
  {
    value: "APPROVED",
    title: "Approve",
  },
  {
    value: "REJECTED",
    title: "Reject",
  },
  {
    value: "RETURNED",
    title: "Return",
  },
  {
    value: "TERMINATED",
    title: "Terminate",
  },
];

export default function Main() {
  const [rowsPage, setRowsPage] = useState(rowsPerPage);
  const [page, setPage] = useState(Page);
  const [order, setOrder] = useState(SortOrder);
  const [orderBy, setOrderBy] = useState(SortField);
  const [count, setCount] = useState(0);
  const [openFilter, setOpenFilter] = useState(false);
  const [filter, setFilter] = useState<AnnouncementFilterProps>(initialFilter);
  const [announcements, setAnnouncements] = useState([]);
  const userRole = storage.getUserInforFromLocalStorage()?.adminRole;
  const dispatch = useDispatch();
  const refetchQueries = useSelector((state: RootState) => state.refetch.time);

  const onFilter = () => {};

  // Cancel filter
  const onCancel = () => {};

  // Change announcement status
  const onChangeStatus = (status: string, id: string | number) => {
    const statusItem = ListStatusAnnouncement.find((it) => it.value === status);
    // Bật Confirm Modal
    let confirm: ConfirmState = {
      isOpen: true,
      title: `Confirm to ${statusItem?.title} announcement`,
      message: `Are you sure you want to ${statusItem?.title.toLowerCase()} the announcement?`,
      feature: "",
      onConfirm: async () => {
        try {
          let alert: AlertState = {
            isOpen: true,
            title: "UPDATE STATUS ANNOUNCEMENT",
            message: "Update status announcement successfully",
            type: "success",
          };

          dispatch(openLoading());
          dispatch(openAlert(alert));
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
    // setAnnouncements(data?.ListAnnouncement?.items || []);
    // setCount(data?.ListAnnouncement?.total ?? 0);
  }, []);

  useEffect(() => {
    // refetch({
    //   filter: filter,
    //   options: {
    //     page: page + 1,
    //     perPage: rowsPage,
    //     sortOrder: order,
    //     sortField: orderBy,
    //   },
    // });
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [page, rowsPage, refetchQueries]);

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
              onChange={(e) =>
                setFilter((pre) => ({
                  ...pre,
                  title: e.target.value,
                }))
              }
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

  const announcementList = announcements.map((item: any, index: number) => {
    return (
      <tr className="hover:bg-primary-c50 hover:text-grey-c700" key={index}>
        <td className="pl-3 py-4">{rowsPage * page + index + 1}</td>
        <td className="px-1 py-4">{item.title}</td>
        <td className="px-1 py-4">
          <SwitchButton
            checked={item.liveTicker}
            handleClickSwitchButton={() => null}
            disabled
          />
        </td>
        <td className="px-1 py-4">
          {/* {renderStatus(item.status.toLowerCase(), userRole?.code)} */}
        </td>
        <td className="px-1 py-4">
          {moment(item.createdAt).format("DD/MM/YYYY hh:mm a")}
        </td>
        <td className="px-1 py-4 flex items-center justify-center">
          {/* Action Button */}
          <div className="flex flex-row gap-2 justify-start items-center">
            <Tooltip title="View">
              <VisibilityIcon
                sx={{ cursor: "pointer" }}
                id={item?.id}
                color="success"
                onClick={() => {
                  handleOpenView(item?.id);
                }}
              />
            </Tooltip>
            {item?.status?.toLowerCase() !== "rejected" && (
              <>
                {item?.status?.toLowerCase() !== "approved" &&
                  item?.status?.toLowerCase() !== "submit_for_termination" && (
                    <Tooltip title="Edit">
                      <EditIcon
                        sx={{ cursor: "pointer" }}
                        id={item?.id}
                        color="success"
                        onClick={() => {
                          handleOpenEdit(item?.id);
                        }}
                      />
                    </Tooltip>
                  )}
                {item?.status?.toLowerCase() !== "submit_for_approval" &&
                  item?.status?.toLowerCase() !== "approved" && (
                    <Tooltip title="Submit for approval">
                      <ConfirmationNumberIcon
                        color="info"
                        sx={{ cursor: "pointer" }}
                        onClick={() => {
                          onChangeStatus("SUBMIT_FOR_APPROVAL", item?.id);
                        }}
                      />
                    </Tooltip>
                  )}
                {item?.status?.toLowerCase() === "approved" && (
                  <Tooltip title="Submit for termination">
                    <DeleteIcon
                      color="error"
                      sx={{ cursor: "pointer" }}
                      onClick={() => {
                        onChangeStatus("SUBMIT_FOR_TERMINATION", item?.id);
                      }}
                    />
                  </Tooltip>
                )}
              </>
            )}
            {item?.status?.toLowerCase() !== "approved" &&
              item?.status?.toLowerCase() !== "rejected" && (
                <>
                  {(item?.status?.toLowerCase() === "approved" ||
                    item?.status?.toLowerCase() === "submit_for_approval") && (
                    <Tooltip title="Approval request">
                      <AssignmentTurnedInIcon
                        color="info"
                        sx={{ cursor: "pointer" }}
                        onClick={(e) => {
                          onChangeStatus("APPROVED", item?.id);
                        }}
                      />
                    </Tooltip>
                  )}

                  {(item?.status?.toLowerCase() === "terminated" ||
                    item?.status?.toLowerCase() ===
                      "submit_for_termination") && (
                    <Tooltip title="Approval request">
                      <AssignmentTurnedInIcon
                        color="info"
                        sx={{ cursor: "pointer" }}
                        onClick={() => {
                          onChangeStatus("TERMINATED", item?.id);
                        }}
                      />
                    </Tooltip>
                  )}
                  {item?.status?.toLowerCase() !== "in_progress" &&
                    item?.status?.toLowerCase() !== "returned" && (
                      <Tooltip title="Reject request">
                        <RemoveCircleOutlineIcon
                          color="error"
                          sx={{ cursor: "pointer" }}
                          onClick={(e) => {
                            onChangeStatus("REJECTED", item?.id);
                          }}
                        />
                      </Tooltip>
                    )}
                  {item?.status?.toLowerCase() !== "in_progress" &&
                    item?.status?.toLowerCase() !== "returned" && (
                      <Tooltip title="Return">
                        <SettingsBackupRestoreOutlinedIcon
                          color="secondary"
                          sx={{ cursor: "pointer" }}
                          onClick={() => {
                            onChangeStatus("RETURNED", item?.id);
                          }}
                        />
                      </Tooltip>
                    )}
                </>
              )}
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
        { (
          <div>
            <Button
              color="primary"
              endIcon={<AddCircleOutlineIcon></AddCircleOutlineIcon>}
              onClick={handleOpenAdd}
            >
              Add announcement
            </Button>
          </div>
        )}
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
                  <th className="px-1 py-4">Live Ticker</th>
                  <th className="px-1 py-4">Status</th>
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
