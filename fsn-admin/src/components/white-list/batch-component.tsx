"use client";
import Button from "@/lib/button";
import Divide from "@/lib/divide";
import Typography from "@/lib/typography";
import React, { useEffect, useState } from "react";
import AddIcon from "@mui/icons-material/Add";
import SaveAltIcon from "@mui/icons-material/SaveAlt";
import { useDispatch } from "react-redux";
import { openModal } from "@/redux/slice/modalSlice";
import FlagCircleIcon from "@mui/icons-material/FlagCircle";
import RemoveCircleOutlineIcon from "@mui/icons-material/RemoveCircleOutline";
import AssignmentReturnIcon from "@mui/icons-material/AssignmentReturn";
import { closeConfirm, openConfirm } from "@/redux/slice/confirmSlice";
import DeleteIcon from "@mui/icons-material/Delete";
import UploadWhiteListBatchFile from "./modals/update-whitelist-batch-file";
import AssignmentTurnedInIcon from "@mui/icons-material/AssignmentTurnedIn";
import ViewDuplicateReport from "./modals/view-duplicate-report";
import {
  APPROVE_WHITELIST_BATCH_FILE,
  CONFIRM_FOR_DELETE_WHITELIST_BATCH_FILE,
  REJECT_REQUEST_WHITELIST_BATCH_FILE,
  RETURN_WHITELIST_BATCH_FILE,
  SUBMIT_FOR_APPROVE_WHITELIST_BATCH_FILE,
} from "@/redux/actions/action";
import storage from "@/services/storage";
import {
  ROLES,
  SortField,
  SortOrder,
  rowsPerPage,
  Page,
} from "@/enum/constants";
import { fDateTime } from "@/utils/function";

import { openAlert } from "@/redux/slice/alertSlice";
import { Pagingation } from "@/lib/pagingation";
import { SkeletonTable } from "@/lib/skeleton";
import { Tooltip } from "@mui/material";
import { FontFamily, FontSize } from "@/enum/setting";

export default function BatchComponent() {
  const [rowsPage, setRowsPage] = useState(rowsPerPage);
  const [page, setPage] = useState(Page);
  const [order, setOrder] = useState(SortOrder);
  const [orderBy, setOrderBy] = useState(SortField);
  const [listBatch, setListBatch] = useState([]);
  const [count, setCount] = useState(0);
  const [batchFileTemplate, setBatchFileTemplate] = useState(null);
  const userRole = storage.getUserInforFromLocalStorage();
  const dispatch = useDispatch();
  
  const handlePageChange = (page: number) => {
    setPage(page);
  };
  const handleRowPerPageChange = (e: any) => {
    setRowsPage(parseInt(e.target.value));
  };

  // useEffect(() => {
  //   setListBatch(dataBatchWhitelist?.ListWhiteListBatch?.items ?? []);
  //   setCount(dataBatchWhitelist?.ListWhiteListBatch?.total);
  //   setBatchFileTemplate(
  //     dataBatchWhitelist?.ListWhiteListBatch?.templateDownloadUrl
  //   );
  // }, [dataBatchWhitelist]);

 
  const onClickImport = () => {
    const modal = {
      isOpen: true,
      title: "Upload whitelist file",
      content: (
        <UploadWhiteListBatchFile refetch={() => {}}></UploadWhiteListBatchFile>
      ),
    };
    dispatch(openModal(modal));
  };
  const handleClickViewDuplicateReport = (data: any) => {
    const modal = {
      isOpen: true,
      title: "View duplicated record",
      content: <ViewDuplicateReport data={data}></ViewDuplicateReport>,
    };
    dispatch(openModal(modal));
  };

  const updateBatchWhitelistChecker = async (values: any, action: string) => {
    try {
      const variables = {
        updateWhiteListBatchCheckerId: Number(values.id),
        updateWhiteListBatchDto: {
          status: action,
        },
      };
      // await updateBatchWhiteChecker({ variables });
      dispatch(
        openAlert({
          isOpen: true,
          title: "UPDATE BATCH WHITELIST",
          message: `You've returned the whitelist record`,
          type: "success",
        })
      );
      // refetch();
    } catch (error) { }
  };
  const handleRejectRequest = (values: any, action: string) => {
    const confirm = {
      isOpen: true,
      title: "Confirm to reject batch file",
      message: "Are you sure you want to reject the batch file?",
      feature: REJECT_REQUEST_WHITELIST_BATCH_FILE,
      onConfirm: () => {
        dispatch(closeConfirm());
        updateBatchWhitelistChecker(values, action);
      },
    };
    dispatch(openConfirm(confirm));
  };
  const handleApproveRequest = (values: any, action: string) => {
    const confirm = {
      isOpen: true,
      title: "Confirm to submit for approval batch file",
      message: "Are you sure you want to submit for approval the batch file?",
      feature: APPROVE_WHITELIST_BATCH_FILE,
      onConfirm: () => {
        dispatch(closeConfirm());
        updateBatchWhitelistChecker(values, action);
      },
    };
    dispatch(openConfirm(confirm));
  };
  const handleReturn = (values: any, action: string) => {
    const confirm = {
      isOpen: true,
      title: "Confirm to return batch file",
      message: "Are you sure you want to return the batch file?",
      feature: RETURN_WHITELIST_BATCH_FILE,
      onConfirm: () => {
        dispatch(closeConfirm());
        updateBatchWhitelistChecker(values, action);
      },
    };
    dispatch(openConfirm(confirm));
  };
  const handleDeleteBatchFile = async (id: string) => {
    try {
      // await deleteBatchWhitelist({
      //   variables: {
      //     deleteWhiteListBatchCheckerId: Number(id),
      //   },
      // });
      dispatch(
        openAlert({
          title: "DELETE BATCH WHITELIST",
          message: `You've deleted the whitelist file`,
          type: "success",
        })
      );
      // refetch();
      dispatch(closeConfirm());
    } catch (error) { }
  };
  const handleConfirmForDelete = (id: string) => {
    const confirm = {
      isOpen: true,
      title: "Confirm delete batch file",
      message: "Are you sure you want to delete the batch file?",
      feature: SUBMIT_FOR_APPROVE_WHITELIST_BATCH_FILE,
      onConfirm: () => {
        dispatch(closeConfirm());
        handleDeleteBatchFile(id);
      },
    };
    dispatch(openConfirm(confirm));
  };
  const updateWhitelistBatch = async (values: any, action: string) => {
    try {
      const variables = {
        updateWhiteListBatchId: Number(values.id),
        updateWhiteListBatchDto: {
          status: action,
        },
      };
      // await updateBatchWhiteList({ variables });
      dispatch(
        openAlert({
          title: "UPDATE BATCH WHITELIST",
          message: "The request is forwarded to checker for approval.",
          type: "success",
        })
      );
      // refetch();
    } catch (error) { }
  };
  const handleSubmitForDelete = (values: any, action: string) => {
    const confirm = {
      isOpen: true,
      title: "CONFIRM TO DO NEXT STEP",
      message: "Are you sure you want to delete the whitelist batch file?",
      feature: CONFIRM_FOR_DELETE_WHITELIST_BATCH_FILE,
      onConfirm: () => {
        dispatch(closeConfirm());
        updateWhitelistBatch(values, action);
      },
    };
    dispatch(openConfirm(confirm));
  };
  const handleSubmitForApproval = (values: any, action: string) => {
    const confirm = {
      isOpen: true,
      title: "Confirm to submit for approval batch file",
      message: "Are you sure you want to submit for approval the batch file?",
      feature: SUBMIT_FOR_APPROVE_WHITELIST_BATCH_FILE,
      onConfirm: () => {
        dispatch(closeConfirm());
        updateWhitelistBatch(values, action);
      },
    };
    dispatch(openConfirm(confirm));
  };
  return (
    <div className="flex flex-col grow bg-white rounded-2xl">
      {/*Header Button */}
      {userRole?.adminRole?.code !== ROLES.OPERATION_MANAGER.CODE &&
        userRole?.adminRole?.code !== ROLES.SUPER_ADMIN.CODE && (
          <div className="flex justify-end">
            <Button
              title="Upload whitelist batch file"
              color="primary"
              startIcon={<AddIcon></AddIcon>}
              className="mr-4"
              onClick={onClickImport}
            >
              Import
            </Button>
            <Button
              title="Download templete whitelist batch file"
              color="secondary"
              startIcon={<SaveAltIcon></SaveAltIcon>}
              onClick={() => {
                window.location.href = batchFileTemplate as never;
              }}
            >
              Template
            </Button>
          </div>
        )}

      {/* Divider */}
      <div className="pt-4 pb-6">
        <Divide></Divide>
      </div>

      {/* Table */}
      <SkeletonTable loading={loading}>
        <div className="max-w-[100%] rounded-[10px] overflow-hidden" >
          <div className="overflow-x-auto">
            <table className="table-auto w-full text-base text-left">
              <thead className={`text-grey-c700 uppercase bg-primary-c100 ${FontFamily.BOLD} ${FontSize.BASE}`}>
                <tr className="hover:bg-secondary-c100 hover:text-grey-c700">
                  <th className="pl-3 py-4">No</th>
                  <th className="px-1 py-4">Batch file</th>
                  <th className="px-1 py-4">Status</th>
                  <th className="px-1 py-4">Upload by</th>
                  <th className="px-1 py-4">Upload At</th>
                  <th className="px-1 py-4 text-center">Actions</th>
                </tr>
              </thead>
              <tbody>
                {listBatch?.map((row: any, index: number) => {
                  return (
                    <tr
                      className="hover:bg-primary-c50 hover:text-grey-c700"
                      key={row.id}
                    >
                      <td className="pl-3 py-4">{index + 1}</td>
                      <td className="px-1 py-4">{row.fileName}</td>
                      {/* <td className="px-1 py-4">
                        {renderStatus(
                          row?.status?.toLowerCase(),
                          userRole?.adminRole?.code
                        )}
                      </td> */}
                      <td className="px-1 py-4">{row?.maker?.fullName}</td>
                      <td className="px-1 py-4">
                        {row.createdAt ? fDateTime(row.createdAt) : ""}
                      </td>
                      <td className="px-1 py-4 w-[150px]">
                        {/* Actions Button */}
                        <div className="flex flex-row gap-2 justify-center">
                          {row.status.toLowerCase() === "approved" && (
                            <FlagCircleIcon
                              titleAccess="View duplicate report"
                              color="success"
                              className="hover:cursor-pointer"
                              onClick={() =>
                                handleClickViewDuplicateReport(row.duplicateItems)
                              }
                            ></FlagCircleIcon>
                          )}
                          {(userRole?.adminRole?.code ===
                            ROLES.OPERATION_MANAGER.CODE ||
                            userRole?.adminRole?.code === ROLES.ROOT_ROLE.CODE ||
                            userRole?.adminRole?.code ===
                              ROLES.SUPER_ADMIN.CODE) &&
                            row?.status?.toLowerCase() !== "approved" &&
                            row?.status?.toLowerCase() !== "rejected" &&
                            row?.status?.toLowerCase() !== "in_progress" &&
                            row?.status?.toLowerCase() !== "returned" && (
                              <>
                                <RemoveCircleOutlineIcon
                                  titleAccess="Reject request"
                                  color="error"
                                  className="hover:cursor-pointer"
                                  onClick={() => {
                                    // handleRejectRequest(
                                    //   row,
                                    //   productStatus.REJECTED
                                    // );
                                  }}
                                />
                                {row?.status?.toLowerCase() ===
                                  "submit_for_approval" && (
                                  <AssignmentTurnedInIcon
                                    titleAccess="Approve request"
                                    color="primary"
                                    onClick={() => {}
                                      // handleApproveRequest(
                                      //   row,
                                      //   productStatus.APPROVED
                                      // )
                                    }
                                    className="hover:cursor-pointer"
                                  ></AssignmentTurnedInIcon>
                                )}
                                {row?.status?.toLowerCase() ===
                                  "submit_for_deletion" && (
                                  <AssignmentTurnedInIcon
                                    titleAccess="Approve request"
                                    color="primary"
                                    className="hover:cursor-pointer"
                                    onClick={() => handleDeleteBatchFile(row.id)}
                                  ></AssignmentTurnedInIcon>
                                )}
                                <AssignmentReturnIcon
                                  titleAccess="Return request"
                                  color="error"
                                  className="hover:cursor-pointer"
                                  onClick={() => {}
                                    // handleReturn(row, productStatus.RETURNED)
                                  }
                                />
                              </>
                            )}
                          { (
                              <>
                                {row?.status?.toLowerCase() !== "approved" && (
                                  <AssignmentTurnedInIcon
                                    titleAccess="Submit for approval"
                                    color="primary"
                                    className="hover:cursor-pointer"
                                    onClick={() => {}
                                      // handleSubmitForApproval(
                                      //   row,
                                      //   productStatus.SUBMIT_FOR_APPROVAL
                                      // )
                                    }
                                  ></AssignmentTurnedInIcon>
                                )}
                                {row?.status?.toLowerCase() !==
                                "submit_for_deletion" && (

                                  <Tooltip title="Submit for deletion">
                                    <DeleteIcon
                                      color="error"
                                      className="hover:cursor-pointer"
                                      onClick={() => {}
                                        // handleSubmitForDelete(
                                        //   row,
                                        //   productStatus.SUBMIT_FOR_DELETION
                                        // )
                                      }
                                    ></DeleteIcon>
                                  </Tooltip>

                                )}
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
        </div>
        {listBatch.length === 0 && (
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
      </SkeletonTable>
    </div>
  );
}
