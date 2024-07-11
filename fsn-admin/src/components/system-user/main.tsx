"use client";
import { FontFamily, FontSize, SCREEN, TextColor } from "@/enum/setting";
import Button from "@/lib/button";
import Divide from "@/lib/divide";
import TextField from "@/lib/text-field";
import Typography from "@/lib/typography";
import AddCircleOutlineIcon from "@mui/icons-material/AddCircleOutline";
import FilterListIcon from "@mui/icons-material/FilterList";
import { Page, SortField, SortOrder, rowsPerPage } from "@/enum/constants";

import { useEffect, useState } from "react";
import { replaceWordsWithAsterisks } from "@/utils/function";
import EditIcon from "@mui/icons-material/Edit";
import EditSystemUser, { SystemUserProp } from "./modals/edit-system-user";
import { openModal } from "@/redux/slice/modalSlice";
import { useDispatch, useSelector } from "react-redux";
import AddSystemUser from "./modals/add-system-user";
import DeleteIcon from "@mui/icons-material/Delete";
import {
  DELETE_SYSTEM_USER,
  RESET_PASSWORD_SYSTEM_USER,
} from "@/redux/actions/action";
import { openConfirm } from "@/redux/slice/confirmSlice";
import { openAlert } from "@/redux/slice/alertSlice";
import LockResetIcon from "@mui/icons-material/LockReset";
import ChangeCircleIcon from "@mui/icons-material/ChangeCircle";
import UpdateSystemUserStatus from "./modals/update-system-user-status";
import { Pagingation } from "@/lib/pagingation";
import { RootState } from "@/redux/store";
import storage from "@/services/storage";
import { SkeletonTable } from "@/lib/skeleton";
import CancelIcon from "@mui/icons-material/Cancel";
import SearchIcon from "@mui/icons-material/Search";
import api from "@/services/api";
import { refetchComponent } from "@/redux/slice/refetchSlice";

export default function Main() {
  const [openFilter, setOpenFilter] = useState(false);
  const [listSystemUser, setListSystemUser] = useState([]);
  const [rowsPage, setRowsPage] = useState(rowsPerPage);
  const [page, setPage] = useState(Page);
  const [order, setOrder] = useState(SortOrder);
  const [orderBy, setOrderBy] = useState(SortField);
  const [count, setCount] = useState(0);
  const [searchUser, setSearchUser] = useState("");
  const [phone, setPhone] = useState("");
  const [email, setEmail] = useState("");
  const [systemUserFilter, setSystemUserFilter] =
    useState<SystemUserFilterProps>({
      username: "",
      phone: "",
      email: "",
    });
  const dispatch = useDispatch();
  const refetchQueries = useSelector((state: RootState) => state.refetch.time);
  const adminData = storage.getUserInforFromLocalStorage();
  const handleClickSearch = () => {
    setSystemUserFilter({
      username: searchUser,
      phone: phone,
      email: email,
    });
    dispatch(refetchComponent());
  };
  const handleCancelFilter = () => {
    setSearchUser("");
    setPhone("");
    setEmail("");
    setSystemUserFilter({
      username: "",
      phone: "",
      email: "",
    });
    setOpenFilter(false);
    dispatch(refetchComponent());
  };
  const getFilterValue = () => {
    let data = {};
    if (systemUserFilter.username !== "") {
      data = { ...data, username: systemUserFilter.username };
    }
    if (systemUserFilter.phone !== "") {
      data = { ...data, phone: systemUserFilter.phone };
    }
    if (systemUserFilter.email !== "") {
      data = { ...data, email: systemUserFilter.email };
    }
    return data;
  };

  useEffect(() => {
    fetchData();
  }, [page, rowsPage, refetchQueries]);

  const fetchData = () => {
    api
      .post("admin/all-user", {
        page: page + 1,
        perPage: rowsPage,
        sortOrder: order,
        sortField: orderBy,
        ...getFilterValue(),
      })
      .then((res) => {
        setListSystemUser(res.data.data);
        setCount(res.data.total);
      });
  };

  const handlePageChange = (page: number) => {
    setPage(page);
  };
  const handleRowPerPageChange = (e: any) => {
    setRowsPage(parseInt(e.target.value));
  };

  const handleClickEdit = (user: SystemUserProp) => {
    const modal = {
      isOpen: true,
      title: "Update system user",
      content: <EditSystemUser {...user}></EditSystemUser>,
    };
    dispatch(openModal(modal));
  };
  const handleAddSystemUser = () => {
    const modal = {
      isOpen: true,
      title: "Add system user",
      content: <AddSystemUser refetch={() => {}}></AddSystemUser>,
    };
    dispatch(openModal(modal));
  };

  const handleDeleteSystemUser = (id: number) => {
    const confirm = {
      isOpen: true,
      title: "CONFIRM TO DO NEXT STEP",
      message: "Are you sure you want to delete this system user?",
      feature: DELETE_SYSTEM_USER,
      onConfirm: async () => {
        try {
          api.delete(`admin/user/${id}`).then((res) => {
          });
          dispatch(refetchComponent());
          dispatch(
            openAlert({
              isOpen: true,
              title: "DELETE SYSTEM USER",
              message: `You've deleted this system user successfully`,
              type: "success",
            })
          );
        } catch (error: any) {}
      },
    };
    dispatch(openConfirm(confirm));
  };
  const handleResetPassword = (id: number) => {
    const confirm = {
      isOpen: true,
      title: "CONFIRM TO DO NEXT STEP",
      message: "Are you sure you want to reset this system user password?",
      feature: RESET_PASSWORD_SYSTEM_USER,
      onConfirm: async () => {
        try {
          const variables = {
            userAdminGenerateEmailUserAdminUpdatePasswordId: Number(id),
          };

          // await resetPasswordUserAdmin({ variables });
          dispatch(
            openAlert({
              isOpen: true,
              title: "RESET USER ADMIN PASSWORD",
              message: "An email is sent to the user to reset the password",
              type: "success",
            })
          );
          // refetch();
        } catch (error: any) {}
      },
    };
    dispatch(openConfirm(confirm));
  };
  const handleChangeStatus = (id: number, status: string) => {
    const modal = {
      isOpen: true,
      screen: SCREEN.SM,
      title: "Update system user status",
      content: (
        <UpdateSystemUserStatus
          id={id}
          status={status}
          refetch={() => {}}
        ></UpdateSystemUserStatus>
      ),
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
            System user{" "}
          </Typography>
        </div>
        <div>
          <Button
            color="primary"
            endIcon={<AddCircleOutlineIcon></AddCircleOutlineIcon>}
            onClick={handleAddSystemUser}
          >
            Add system user
          </Button>
        </div>
      </div>
      {/* Divider */}
      <Divide></Divide>
      {/* Filter icon */}
      <div className="justify-end items-end flex flex-col py-2 px-4 cursor-pointer">
        <Button
          color="secondary"
          endIcon={<FilterListIcon></FilterListIcon>}
          onClick={() => setOpenFilter(!openFilter)}
        >
          Filter
        </Button>
      </div>
      {/* Search */}
      {openFilter && (
        <>
          <div className="flex flex-col gap-3">
            {/* Search option */}
            <div className="justify-end items-end flex flex-row px-4 gap-4">
              <div className="flex-1">
                <TextField
                  placeholder="Search by user name"
                  label="User name"
                  className={`${FontSize.BASE}`}
                  value={searchUser}
                  onChange={(e) => setSearchUser(e.target.value)}
                ></TextField>
              </div>
              <div className="flex-1">
                <TextField
                  placeholder="Search by phone number"
                  label="Phone number"
                  className={`${FontSize.BASE}`}
                  value={phone}
                  onChange={(e) => setPhone(e.target.value)}
                ></TextField>
              </div>
              <div className="flex-1">
                <TextField
                  placeholder="Search by email"
                  label="Email"
                  className={`${FontSize.BASE}`}
                  value={email}
                  onChange={(e) => setEmail(e.target.value)}
                ></TextField>
              </div>
            </div>
            {/* Search button group */}
            <div className="pb-4 px-4 gap-2 flex-row flex">
              <Button
                color="primary"
                endIcon={<SearchIcon></SearchIcon>}
                onClick={handleClickSearch}
              >
                Search
              </Button>
              <Button
                color="error"
                endIcon={<CancelIcon></CancelIcon>}
                onClick={handleCancelFilter}
              >
                Cancel
              </Button>
            </div>
          </div>
          {/* Divider */}
          <Divide></Divide>
        </>
      )}
      {/* Table */}
      <SkeletonTable loading={false}>
        <div className="max-w-[100%] rounded-[10px] overflow-hidden mt-6">
          <div className="overflow-x-auto">
            <table className="table-auto w-full text-base text-left text-grey-c700">
              <thead
                className={`text-grey-c700 uppercase bg-primary-c100 ${FontFamily.BOLD} ${FontSize.BASE}`}
              >
                <tr className="hover:bg-secondary-c100 hover:text-grey-c700">
                  <th className="pl-3 py-4">No</th>
                  <th className="px-1 py-4">Full name</th>
                  <th className="px-1 py-4">Masked name</th>
                  <th className="px-1 py-4">email</th>
                  <th className="px-1 py-4">Mobile number</th>
                  <th className="px-1 py-4">User role</th>
                  <th className="px-1 py-4">Status</th>
                  <th className="px-1 py-4 text-center">Action</th>
                </tr>
              </thead>
              <tbody>
                {listSystemUser.map((user: any, index) => (
                  <tr
                    className="hover:bg-primary-c50 hover:text-grey-c700"
                    key={index}
                  >
                    <td className="pl-3 py-4">{rowsPage * page + index + 1}</td>
                    <td className="px-1 py-4">{user.fullName}</td>
                    <td className="px-1 py-4">
                      {replaceWordsWithAsterisks(user.username)}
                    </td>
                    <td className="px-1 py-4">{user.email}</td>
                    <td className="px-1 py-4">
                      {user?.phone && "+" + user.phone}
                    </td>
                    <td className="px-1 py-4">{user.role}</td>
                    <td className="px-1 py-4">{user.status}</td>
                    <td className="px-1 py-4 w-[150px]">
                      {/* Actions Button */}
                      <div className="flex flex-row gap-2 justify-center">
                        <EditIcon
                          color="success"
                          titleAccess="Edit"
                          onClick={() =>
                            handleClickEdit({
                              id: user.id,
                              fullName: user.fullName,
                              username: user.username,
                              email: user.email,
                              phone: user?.phone,
                              adminRole: user.role,
                              status: user.status.toLowerCase(),
                              refetch: () => {},
                            })
                          }
                          className="hover:cursor-pointer"
                        />
                        {adminData.username !== user.username && (
                          <ChangeCircleIcon
                            titleAccess="Change status"
                            color="warning"
                            className="hover:cursor-pointer"
                            onClick={() =>
                              handleChangeStatus(user.id, user.status)
                            }
                          />
                        )}
                        {adminData.username !== user.username && (
                          <DeleteIcon
                            titleAccess="Delete"
                            color="error"
                            className="hover:cursor-pointer"
                            onClick={() => handleDeleteSystemUser(user.id)}
                          />
                        )}
                        <LockResetIcon
                          titleAccess="Reset password"
                          color="success"
                          className="hover:cursor-pointer"
                          onClick={() => handleResetPassword(user.id)}
                        />
                      </div>
                    </td>
                  </tr>
                ))}
              </tbody>
            </table>
          </div>
        </div>
        {/* Paginate */}
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
