"use client";
import { FontFamily, FontSize, SCREEN } from "@/enum/setting";
import Divide from "@/lib/divide";
import Typography from "@/lib/typography";
import VisibilityIcon from "@mui/icons-material/Visibility";
import { useDispatch, useSelector } from "react-redux";
import { closeModal, openModal } from "@/redux/slice/modalSlice";
import DeleteIcon from "@mui/icons-material/Delete";
import { closeConfirm, openConfirm } from "@/redux/slice/confirmSlice";
import AssignmentTurnedInIcon from "@mui/icons-material/AssignmentTurnedIn";
import ViewWhiteListRecord, {
  WhiteListRecordProp,
} from "./modals/view-whitelist-record";
import EditIcon from "@mui/icons-material/Edit";
import UpdateWhiteListRecord from "./modals/update-whitelist-record";
import {
  APPROVE_WHITELIST_RECORD,
  DELETE_WHITELIST_RECORD,
  REJECT_WHITELIST_RECORD,
  RETURN_WHITELIST_RECORD,
  SUBMIT_FOR_DELETION_WHITELIST_RECORD,
} from "@/redux/actions/action";
import { fDate } from "@/utils/function";
import { renderStatus } from "@/utils/render-status";
import { useMutation, useQuery } from "@apollo/client";
import {
  DELETE_REPORT_WHITE_LIST,
  GET_ALL_WHITE_LIST,
  UPDATE_WHITE_LIST_CHECKER,
  UPDATE_WHITE_LIST_MAKER,
} from "@/services/white-list";
import { openAlert } from "@/redux/slice/alertSlice";
import {
  Page,
  ROLES,
  SortField,
  SortOrder,
  productStatus,
  rowsPerPage,
} from "@/enum/constants";
import RemoveCircleOutlineIcon from "@mui/icons-material/RemoveCircleOutline";
import AssignmentReturnIcon from "@mui/icons-material/AssignmentReturn";
import storage from "@/services/storage";
import { useEffect, useState } from "react";
import { RootState } from "@/redux/store";
import { Pagingation } from "@/lib/pagingation";
import { SkeletonTable } from "@/lib/skeleton";
import { Tooltip } from "@mui/material";

interface RecordComponentProps {
  filter: RecordWhitelistFilterProps;
}
export default function RecordComponent({ filter }: RecordComponentProps) {
  const dispatch = useDispatch();
  const refetchQueries = useSelector((state: RootState) => state.refetch.time);
  const userRole = storage.getUserInforFromLocalStorage();
  const [rowsPage, setRowsPage] = useState(rowsPerPage);
  const [page, setPage] = useState(Page);
  const [order, setOrder] = useState(SortOrder);
  const [count, setCount] = useState(0);
  const [listWhitelist, setListWhitelist] = useState<WhiteListRecordProp[]>([]);
  const [orderBy, setOrderBy] = useState(SortField);
  const [deleteReportWhitelist] = useMutation(
    DELETE_REPORT_WHITE_LIST
  );
  const [updateWhiteListMaker] = useMutation(
    UPDATE_WHITE_LIST_MAKER
  );
  const [updateWhiteListChecker] = useMutation(
    UPDATE_WHITE_LIST_CHECKER
  );
  const getFilterValue = () => {
    let data = {};

    if (filter.phone !== "") {
      data = { ...data, phone: filter?.phone };
    }

    if (filter.cid !== "") {
      data = { ...data, cid: filter?.cid };
    }

    if (filter.status !== "") {
      data = { ...data, status: filter?.status };
    }
    return data;
  };
  const {
    data: dataRecordWhitelist,
    loading,
    refetch,
  } = useQuery(GET_ALL_WHITE_LIST, {
    variables: {
      filter: getFilterValue(),
      options: {
        page: page + 1,
        perPage: rowsPage,
        sortOrder: order,
        sortField: orderBy,
      },
    },
  });
  useEffect(() => {
    setCount(dataRecordWhitelist?.ListWhiteList?.total);
    setListWhitelist(dataRecordWhitelist?.ListWhiteList?.items || []);
  }, [dataRecordWhitelist]);

  useEffect(() => {
    refetch();
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [page, rowsPage, refetchQueries]);

  const handlePageChange = (page: number) => {
    setPage(page);
  };
  const handleRowPerPageChange = (e: any) => {
    setRowsPage(parseInt(e.target.value));
  };

  //! HANDLE ACTIONS
  const handleClickViewExistingWhitelistRecord = (
    item: WhiteListRecordProp
  ) => {
    const modal = {
      isOpen: true,
      title: "View whitelist record",
      content: (
        <ViewWhiteListRecord
          fullName={item.fullName}
          countryCode={item.countryCode}
          phone={item.phone}
          dob={item.dob}
          gender={item.gender}
          email={item.email}
          cid={item.cid}
          referenceId={item.referenceId}
          instituteName={item.instituteName}
          courseName={item.courseName}
          yearOfCompletion={item.yearOfCompletion}
          approvedLoanAmount={item.approvedLoanAmount}
          productType={item.productType}
          status={item.status}
          prefix={item.prefix}
          id={item.id}
        ></ViewWhiteListRecord>
      ),
    };
    dispatch(openModal(modal));
  };
  const handleClickDelete = (id: string) => {
    const confirm = {
      isOpen: true,
      title: "PROCEED WITH THIS ACTION?",
      message:
        "Are you sure you want to submit for deleting the whitelist record?",
      feature: DELETE_WHITELIST_RECORD,
      onConfirm: async () => {
        dispatch(closeConfirm());
        try {
          const variables = {
            deleteWhiteListCheckerId: Number(id),
          };
          dispatch(closeModal());
          await deleteReportWhitelist({ variables });
          dispatch(
            openAlert({
              isOpen: true,
              title: "DELETE WHITELIST",
              message: `You've successfully deleted the whitelist record`,
              type: "success",
            })
          );
          refetch();
        } catch (error: any) {

        }
      },
    };
    dispatch(openConfirm(confirm));
  };
  //!Action for Maker
  const handleClickApproveMaker = (
    id: string,
    action: string,
    message: string
  ) => {
    const confirm = {
      isOpen: true,
      title: "PROCEED WITH THIS ACTION?",
      message: "Are you sure you want to submit for approval record?",
      feature: APPROVE_WHITELIST_RECORD,
      onConfirm: async () => {
        dispatch(closeConfirm());
        try {
          dispatch(closeModal());
          const variables = {
            updateWhiteListId: Number(id),
            updateWhitelistDto: {
              status: action,
            },
          };
          await updateWhiteListMaker({ variables });
          dispatch(
            openAlert({
              isOpen: true,
              title: "UPDATE WHITELIST",
              message: message,
              type: "success",
            })
          );
          refetch();
        } catch (error: any) {

        }
      },
    };
    dispatch(openConfirm(confirm));
  };
  const handleClickDeleteMaker = (
    id: string,
    action: string,
    message: string
  ) => {
    const confirm = {
      isOpen: true,
      title: "PROCEED WITH THIS ACTION?",
      message:
        "Are you sure you want to submit for deleting the whitelist record?",
      feature: SUBMIT_FOR_DELETION_WHITELIST_RECORD,
      onConfirm: async () => {
        dispatch(closeConfirm());
        try {
          dispatch(closeModal());
          const variables = {
            updateWhiteListId: Number(id),
            updateWhitelistDto: {
              status: action,
            },
          };
          await updateWhiteListMaker({ variables });
          dispatch(
            openAlert({
              isOpen: true,
              title: "UPDATE WHITELIST",
              message: message,
              type: "success",
            })
          );
          refetch();
        } catch (error: any) {

        }
      },
    };
    dispatch(openConfirm(confirm));
  };
  const handleClickEdit = (item: WhiteListRecordProp) => {
    const modal = {
      isOpen: true,
      title: "Update whitelist record",
      screen: SCREEN.SM,
      content: (
        <UpdateWhiteListRecord
          refetch={refetch}
          props={item}
        ></UpdateWhiteListRecord>
      ),
    };
    dispatch(openModal(modal));
  };
  //!Action for Checker
  const onChangeStatus = async (
    id: string,
    action: string,
    message: string
  ) => {
    try {
      const variables = {
        updateWhiteListCheckerId: Number(id),
        updateWhitelistDto: {
          status: action,
        },
      };
      await updateWhiteListChecker({ variables });
      dispatch(
        openAlert({
          isOpen: true,
          title: "UPDATE WHITELIST",
          message: message,
          type: "success",
        })
      );
      refetch();
    } catch (error: any) {
    }
  };
  const handleReject = (id: string, action: string, message: string) => {
    dispatch(
      openConfirm({
        isOpen: true,
        title: "PROCEED WITH THIS ACTION?",
        message: "Are you sure you want to submit for rejection record?",
        feature: REJECT_WHITELIST_RECORD,
        onConfirm: async () => {
          dispatch(closeConfirm());
          onChangeStatus(id, action, message);
        },
      })
    );
  };
  const handleReturn = (id: string, action: string, message: string) => {
    dispatch(
      openConfirm({
        isOpen: true,
        title: "PROCEED WITH THIS ACTION?",
        message: "Are you sure you want to submit for return record?",
        feature: RETURN_WHITELIST_RECORD,
        onConfirm: async () => {
          dispatch(closeConfirm());
          onChangeStatus(id, action, message);
        },
      })
    );
  };
  const handleClickApproveChecker = (
    id: string,
    action: string,
    message: string
  ) => {
    dispatch(
      openConfirm({
        isOpen: true,
        title: "PROCEED WITH THIS ACTION?",
        message:
          "Are you sure you want to approve request for adding the whitelist record?",
        feature: APPROVE_WHITELIST_RECORD,
        onConfirm: async () => {
          dispatch(closeConfirm());
          onChangeStatus(id, action, message);
        },
      })
    );
  };
  const handleClickDeleteChecker = (
    id: string,
    action: string,
    message: string
  ) => {
    dispatch(
      openConfirm({
        isOpen: true,
        title: "PROCEED WITH THIS ACTION?",
        message:
          "Are you sure you want to submit for deleting the whitelist record?",
        feature: SUBMIT_FOR_DELETION_WHITELIST_RECORD,
        onConfirm: async () => {
          dispatch(closeConfirm());
          onChangeStatus(id, action, message);
        },
      })
    );
  };

  return (
    <SkeletonTable loading={loading}>
      <div className="max-w-[100%] rounded-[10px] overflow-hidden">
        {/* Table */}
        <div className="overflow-x-auto">
          <table className="table-auto w-full text-base text-left text-grey-c700">
            <thead className={`text-grey-c700 uppercase bg-primary-c100 ${FontFamily.BOLD} ${FontSize.BASE}`}>
              <tr className="hover:bg-secondary-c100 hover:text-grey-c700">
                <th className="pl-3 py-4">No</th>
                <th className="pl-2 py-4">Reference Id</th>
                <th className="px-1 py-4">Product name</th>
                <th className="px-1 py-4">Document Id</th>
                <th className="px-1 py-4">Full name</th>
                <th className="px-1 py-4">DOB</th>
                <th className="px-1 py-4">Mobile Number</th>
                <th className="px-1 py-4">Status</th>
                <th className="px-1 py-4 text-center">Actions</th>
              </tr>
            </thead>
            <tbody>
              {listWhitelist.map((row: any, index: number) => {
                return (
                  <tr
                    key={row.id}
                    className="hover:bg-primary-c50 hover:text-grey-c700"
                  >
                    <td className="pl-3 py-4">{rowsPage * page + index + 1}</td>
                    <td className="pl-2 py-4">{row.referenceId}</td>
                    <td className="px-1 py-4">{row.productType}</td>
                    <td className="px-1 py-4">{row.cid}</td>
                    <td className="px-1 py-4">{row.fullName}</td>
                    <td className="px-1 py-4">
                      {row?.dob ? fDate(row?.dob) : ""}
                    </td>
                    <td className="px-1 py-4">
                      {row?.phone && "+" + row.phone}
                    </td>
                    <td className="px-1 py-4 w-[200px]">
                      {renderStatus(row.status.toLowerCase())}
                    </td>
                    <td className="px-1 py-4 w-[150px]">
                      <div className="flex flex-wrap gap-2 justify-center">
                        {/* Action Button */}
                        <Tooltip title="View existing whitelist record">
                          <VisibilityIcon
                            color="success"
                            onClick={() =>
                              handleClickViewExistingWhitelistRecord(row)
                            }
                            className="hover:cursor-pointer"
                          />
                        </Tooltip>
                        {(userRole.adminRole?.code ===
                          ROLES.OPERATION_EXEC.CODE ||
                          userRole.adminRole?.code ===
                          ROLES.ROOT_ROLE.CODE) && (
                            <>
                              {row?.status?.toLowerCase() !== "rejected" &&
                                row?.status?.toLowerCase() !== "approved" && (
                                  <>
                                    <Tooltip title="Edit existing whitelist record">
                                      <EditIcon
                                        color="success"
                                        onClick={() => handleClickEdit(row)}
                                        className="hover:cursor-pointer"
                                      ></EditIcon>
                                    </Tooltip>

                                    {row?.status?.toLowerCase() !==
                                      "submit_for_approval" && (
                                        <Tooltip title="Submit for approval">
                                          <AssignmentTurnedInIcon
                                            color="primary"
                                            onClick={() =>
                                              handleClickApproveMaker(
                                                row.id,
                                                productStatus.SUBMIT_FOR_APPROVAL,
                                                "The request is forwarded to checker for approval."
                                              )
                                            }
                                            className="hover:cursor-pointer"
                                          ></AssignmentTurnedInIcon>
                                        </Tooltip>
                                      )}
                                  </>
                                )}
                              {row?.status?.toLowerCase() === "approved" && (
                                <Tooltip title="Submit for deletion">
                                  <DeleteIcon
                                    color="error"
                                    onClick={() =>
                                      handleClickDeleteMaker(
                                        row.id,
                                        productStatus.SUBMIT_FOR_DELETION,
                                        "The request is forwarded to checker for approval."
                                      )
                                    }
                                    className="hover:cursor-pointer"
                                  />
                                </Tooltip>
                              )}
                            </>
                          )}
                        {(userRole.adminRole?.code ===
                          ROLES.OPERATION_MANAGER.CODE ||
                          userRole.adminRole?.code === ROLES.ROOT_ROLE.CODE ||
                          userRole.adminRole?.code ===
                          ROLES.SUPER_ADMIN.CODE) &&
                          row?.status?.toLowerCase() !== "approved" &&
                          row?.status?.toLowerCase() !== "rejected" && (
                            <>
                              {row?.status?.toLowerCase() ===
                                "submit_for_approval" && (
                                  <Tooltip title="Approve request">
                                    <AssignmentTurnedInIcon
                                      color="primary"
                                      onClick={() =>
                                        handleClickApproveChecker(
                                          row.id,
                                          productStatus.APPROVED,
                                          `You've successfully approved request for adding the whitelist record`
                                        )
                                      }
                                      className="hover:cursor-pointer"
                                    ></AssignmentTurnedInIcon>
                                  </Tooltip>
                                )}
                              {row?.status?.toLowerCase() ===
                                "submit_for_deletion" && (
                                  <Tooltip title="Approve request">
                                    <AssignmentTurnedInIcon
                                      color="primary"
                                      onClick={() =>
                                        handleClickDeleteChecker(
                                          row.id,
                                          productStatus.DELETED,
                                          `You've successfully approved request for deleting the whitelist record`
                                        )
                                      }
                                      className="hover:cursor-pointer"
                                    ></AssignmentTurnedInIcon>
                                  </Tooltip>
                                )}
                              {row?.status?.toLowerCase() !== "in_progress" &&
                                row?.status?.toLowerCase() !== "rejected" &&
                                row?.status?.toLowerCase() !== "returned" && (
                                  <>
                                    <Tooltip title="Reject request">
                                      <RemoveCircleOutlineIcon
                                        color="error"
                                        className="hover:cursor-pointer"
                                        onClick={() =>
                                          handleReject(
                                            row.id,
                                            productStatus.REJECTED,
                                            `You've rejected the whitelist record`
                                          )
                                        }
                                      />
                                    </Tooltip>
                                    {row?.status?.toLowerCase() !==
                                      "returned" && (
                                        <Tooltip title="Return whitelist record">
                                          <AssignmentReturnIcon
                                            color="warning"
                                            className="hover:cursor-pointer"
                                            onClick={() =>
                                              handleReturn(
                                                row.id,
                                                productStatus.RETURNED,
                                                `You've successfully returned the whitelist record`
                                              )
                                            }
                                          />
                                        </Tooltip>
                                      )}
                                  </>
                                )}
                              {/* <DeleteIcon
                              titleAccess="Approve request"
                              color="error"
                              onClick={() => handleClickDelete(row.id)}
                              className="hover:cursor-pointer"
                            /> */}
                            </>
                          )}
                      </div>
                    </td>
                  </tr>
                );
              })}
            </tbody>
          </table>
        </div>
        {listWhitelist.length === 0 && (
          <Typography className="pb-4 normal-case text-center text-primary-c700">
            No data
          </Typography>
        )}
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
      </div>
    </SkeletonTable>
  );
}
