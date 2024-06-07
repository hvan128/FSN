"use client";
import { Page, rowsPerPage } from "@/enum/constants";
import { FontFamily, FontSize, SCREEN, TextColor } from "@/enum/setting";
import Divide from "@/lib/divide";
import { Pagingation } from "@/lib/pagingation";
import Typography from "@/lib/typography";
import FilterListIcon from "@mui/icons-material/FilterList";
import { Form, Formik } from "formik";
import { useEffect, useRef, useState } from "react";
import FiltersUser from "./filter-user";
import { fDateTime } from "@/utils/function";
import { PhonelinkSetup } from "@mui/icons-material";
import AssignmentTurnedInIcon from "@mui/icons-material/AssignmentTurnedIn";
import BlockIcon from "@mui/icons-material/Block";
import RestartAltIcon from "@mui/icons-material/RestartAlt";
import ViewTimelineOutlinedIcon from "@mui/icons-material/ViewTimelineOutlined";
import { Tooltip } from "@mui/material";
import { openModal } from "@/redux/slice/modalSlice";
import { useDispatch } from "react-redux";
import { openAlert } from "@/redux/slice/alertSlice";
import UpdatePhoneCustomerModal from "./modals/update-phone-customer";
import OnboadingCustomerModal from "./modals/document-customer";
import Button from "@/lib/button";
import {
  CONFIRM_RESET_CUSTOMER_PASSWORD,
  CONFIRM_SUPEND_CUSTOMER,
} from "@/redux/actions/action";
import { openConfirm } from "@/redux/slice/confirmSlice";
import { SkeletonTable } from "@/lib/skeleton";
import { closeLoading, openLoading } from "@/redux/slice/loadingSlice";

const initialValues = {
  customerName: "",
  cid: null,
  phone: null,
  clientNumber: null,
};

export default function Main() {
  const dispatch = useDispatch();
  const [page, setPage] = useState(Page);
  const [perPage, setRowsPerPage] = useState(rowsPerPage);
  const [allCustomers, setAllCustomers] = useState([]);
  const [count, setCount] = useState(0);

  const ref = useRef<any>(null);
  const [isFiltering, setIsFiltering] = useState(false);
  const handlePageChange = (page: number) => {
    setPage(page);
  };
  const handleRowPerPageChange = (e: any) => {
    setRowsPerPage(parseInt(e.target.value));
  };
  const [updateStatus, setUpdateStatus] = useState(false);
  const [openFilter, setOpenFilter] = useState(false);

  // const onFilter = async (values: any) => {
  //   try {
  //     const variables = {
  //       filter: {
  //         cid: values?.cid ?? null,
  //         customerName: values?.customerName ?? null,
  //         phone: values?.phone ?? null,
  //         clientNumber: values?.clientNumber ?? null,
  //       },
  //       options: {
  //         page: page + 1,
  //         perPage: perPage,
  //         // sortField: '',
  //         // sortOrder: null,
  //       },
  //     };
  //     // const data: any = await getCustomers({ variables });
  //     setAllCustomers(data?.data.AllCustomers?.items || []);
  //     setCount(data?.data.AllCustomers?.total || 0);
  //   } catch (error) {
  //   }
  // };

  const handleUpdate = () => {
    setUpdateStatus((prev) => !prev);
  };

  // const handleOpenModalConfirmSuspend = (item: any, action: any) => {
  //   const confirm: any = {
  //     isOpen: true,
  //     title: `Confirm ${action === customerStatus.active ? "Suspend" : "Active"
  //       } this user`,
  //     message: `Are you sure you want to ${action === customerStatus.active ? "suspend" : "active"
  //       } this user?`,
  //     feature: CONFIRM_SUPEND_CUSTOMER,
  //     onConfirm: async () => {
  //       try {
  //         const variables = {
  //           updateCustomerId: Number(item?.id),
  //           updateCustomerDto: {
  //             status:
  //               action === customerStatus.suspend
  //                 ? customerStatus.active
  //                 : customerStatus.suspend,
  //           },
  //         };
  //         dispatch(openLoading());
  //         // await UpdateCustomer({ variables });
  //         let alert: AlertState = {
  //           isOpen: true,
  //           title: "UPDATE CUSTOMER",
  //           message: "Update customer success!",
  //           type: "success",
  //         };
  //         dispatch(openAlert(alert));
  //         handleUpdate();
  //       } catch (error) {
  //       }finally{
  //         dispatch(closeLoading());
  //       }
  //     },
  //   };
  //   dispatch(openConfirm(confirm));
  // };

  const handleOpenModalResetPassword = (item: any) => {
    const confirm: any = {
      isOpen: true,
      title: `Confirm to reset user’s password`,
      message: " Are you sure you want to reset user’s password?",
      feature: CONFIRM_RESET_CUSTOMER_PASSWORD,
      onConfirm: async () => {
        try {
          const variables = {
            adminResetMpinId: Number(item?.id),
          };
          dispatch(openLoading());
          // await ResetPasswordForCustomer({ variables });
          // refetchAllCustomers();
          let alert: AlertState = {
            isOpen: true,
            title: "RESET PASSWORD CUSTOMER",
            message: "Please check your phone to get new MPIN!",
            type: "success",
          };
          dispatch(openAlert(alert));
        } catch (error) {
        } finally {
          dispatch(closeLoading());
        }
      },
    };
    dispatch(openConfirm(confirm));
  };

  const handleOpenModalUpdatePhoneCustomer = (item: any) => {
    const modal = {
      isOpen: true,
      title: `Update phone`,
      content: (
        <UpdatePhoneCustomerModal
          customerId={item?.id}
          refetchAllCustomers={handleUpdate}
        ></UpdatePhoneCustomerModal>
      ),
      screen: SCREEN.XS,
    };
    dispatch(openModal(modal));
  };

  const handleOpenModalOnboadingCustomer = (item: any) => {
    const modal = {
      isOpen: true,
      title: `Customer documentation`,
      content: (
        <OnboadingCustomerModal customer={item}></OnboadingCustomerModal>
      ),
      screen: SCREEN.LG,
    };
    dispatch(openModal(modal));
  };

  return (
    <div className="flex flex-col grow bg-white rounded-2xl px-4 py-4 min-h-[800px]">
      {/* Header */}
      <div className="justify-between items-center flex flex-row py-2">
        <Typography
          textColor={TextColor.GREY_700}
          fontSize={FontSize.XL}
          fontFamily={FontFamily.BOLD}
        >
          {" "}
          Customer{" "}
        </Typography>
      </div>
      {/* Divider */}
      <Divide></Divide>
      <Formik initialValues={initialValues} onSubmit={() => {}} innerRef={ref}>
        {(formik) => (
          <Form>
            {/* Filter icon */}
            <div className="py-2">
              <div className="justify-end items-end flex flex-col py-2 px-4 cursor-pointer">
                <Button
                  color="secondary"
                  endIcon={<FilterListIcon></FilterListIcon>}
                  onClick={() => setOpenFilter(!openFilter)}
                >
                  Filter
                </Button>
              </div>
              {/* {openFilter && (
                <FiltersUser
                  onChangePage={handlePageChange}
                  onFiltering={handleFiltering}
                />
              )} */}
            </div>

            {/* Search */}
            {/* Divider */}
            <Divide></Divide>
            {/* Table */}
            <SkeletonTable loading={false}>
              <div className="max-w-[100%] rounded-[10px] overflow-hidden mt-6">
                <div className="overflow-x-auto">
                  <table className="table-auto w-full text-base text-left text-grey-c700 over">
                    <thead
                      className={`text-grey-c700 uppercase bg-primary-c100 ${FontFamily.BOLD} ${FontSize.BASE}`}
                    >
                      <tr className="hover:bg-secondary-c100 hover:text-grey-c700">
                        <th className="pl-3 py-4">No</th>
                        <th className="px-1 py-4">Name</th>
                        <th className="px-1 py-4">CIF No</th>
                        <th className="px-1 py-4">CID/ID No</th>
                        <th className="px-1 py-4">Mobile number</th>
                        <th className="px-1 py-4">Registed on</th>
                        <th className="px-1 py-4">IOS status</th>
                        <th className="px-1 py-4">Status</th>
                        <th className="px-1 py-4 text-center">Action</th>
                      </tr>
                    </thead>
                    <tbody>
                      {allCustomers?.map((item: any, index) => (
                        <tr
                          className="hover:bg-primary-c50 hover:text-grey-c700"
                          key={item.id}
                        >
                          <td className="pl-3 py-4">
                            {page * perPage + index + 1}
                          </td>
                          <td className="px-1 py-4">{item.customerName}</td>
                          <td className="px-1 py-4">{item.clientNumber}</td>
                          <td className="px-1 py-4">{item.cid}</td>
                          <td className="px-1 py-4">{`+${item.phone}`}</td>
                          <td className="px-1 py-4">
                            {fDateTime(item.createdAt)}
                          </td>
                          {/* <td className="px-1 py-4">
                            {renderDeactivedStatus(
                              item?.iosStatus?.toLowerCase()
                            )}
                          </td>
                          <td className="px-1 py-4">
                            {renderStatus(item?.status?.toLowerCase())}
                          </td> */}
                          <td className="px-1 py-4 w-[150px]">
                            <div className="flex flex-row gap-2 justify-center">
                              <div>
                                {
                                  <Tooltip title="Suspend user">
                                    <BlockIcon
                                      color="error"
                                      sx={{ cursor: "pointer" }}
                                      onClick={() => {
                                        // handleOpenModalConfirmSuspend(
                                        //   item,
                                        //   customerStatus.active
                                        // );
                                      }}
                                    />
                                  </Tooltip>
                                }
                                {
                                  <Tooltip title="Active user">
                                    <AssignmentTurnedInIcon
                                      sx={{ cursor: "pointer" }}
                                      id={item?.id}
                                      color="success"
                                      onClick={() => {
                                        // handleOpenModalConfirmSuspend(
                                        //   item,
                                        //   customerStatus.suspend
                                        // );
                                      }}
                                    />
                                  </Tooltip>
                                }
                              </div>
                              <div>
                                <Tooltip title="View customer documentation">
                                  <ViewTimelineOutlinedIcon
                                    sx={{ cursor: "pointer" }}
                                    id={item?.id}
                                    color="secondary"
                                    onClick={() => {
                                      handleOpenModalOnboadingCustomer(item);
                                      formik.setFieldValue("data", item);
                                    }}
                                  />
                                </Tooltip>
                              </div>
                              <div>
                                <Tooltip title="Reset MPIN">
                                  <RestartAltIcon
                                    sx={{ cursor: "pointer" }}
                                    id={item?.id}
                                    color="warning"
                                    onClick={() => {
                                      handleOpenModalResetPassword(item);
                                    }}
                                  />
                                </Tooltip>
                              </div>
                              <div>
                                <Tooltip title="Change phone">
                                  <PhonelinkSetup
                                    sx={{ cursor: "pointer" }}
                                    color="info"
                                    onClick={() => {
                                      handleOpenModalUpdatePhoneCustomer(item);
                                    }}
                                  />
                                </Tooltip>
                              </div>
                            </div>
                          </td>
                        </tr>
                      ))}
                    </tbody>
                  </table>
                </div>
              </div>
            </SkeletonTable>
          </Form>
        )}
      </Formik>
      {/* Paginate */}
      <Pagingation
        page={page}
        handlePageChange={handlePageChange}
        handleRowPerPageChange={handleRowPerPageChange}
        total={count}
        rowsPerPage={perPage}
      />
      {/* Divider */}
      <Divide></Divide>
    </div>
  );
}
