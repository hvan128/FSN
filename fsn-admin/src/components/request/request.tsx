"use client";
import type { RootState } from "../../redux/store";
import { useDispatch, useSelector } from "react-redux";
import { Page, SortField, SortOrder, rowsPerPage } from "@/enum/constants";
import { useEffect, useState } from "react";
import { Pagingation } from "@/lib/pagingation";
import { Edit } from "@mui/icons-material";
import Image from "next/image";
import Label from "@/lib/label";
import { openModal } from "@/redux/slice/modalSlice";
import { FontFamily, FontSize, SCREEN } from "@/enum/setting";
import ChangeCircleIcon from "@mui/icons-material/ChangeCircle";
import CheckCircleIcon from "@mui/icons-material/CheckCircle";
import { CHANGE_PRODUCT_STATUS, DELETE_PRODUCT } from "@/redux/actions/action";
import { closeConfirm, openConfirm } from "@/redux/slice/confirmSlice";
import { openAlert } from "@/redux/slice/alertSlice";
import DeleteIcon from "@mui/icons-material/Delete";
import { openImageDetail } from "../../redux/slice/imageDetailSlice";
import { SkeletonTable } from "@/lib/skeleton";
import api from "@/services/api";
import { convertImageUrl, fDateTime } from "@/utils/function";
import AssignmentTurnedInIcon from "@mui/icons-material/AssignmentTurnedIn";
import RemoveCircleOutlineIcon from "@mui/icons-material/RemoveCircleOutline";
import { Tooltip } from "@mui/material";
import VisibilityIcon from "@mui/icons-material/Visibility";
import { refetchComponent } from "@/redux/slice/refetchSlice";
import ViewRequest from "./modals/view-request";

type Props = {
  filter: RequestFilterProps;
};

export default function Request({ filter }: Props) {
  const [rowsPage, setRowsPage] = useState(rowsPerPage);
  const [page, setPage] = useState(Page);
  const [order, setOrder] = useState(SortOrder);
  const [orderBy, setOrderBy] = useState(SortField);
  const [count, setCount] = useState(0);
  const [requests, setRequests] = useState<Array<RequestProps>>([]);

  const getFilterValue = () => {
    let data = {};

    if (filter.status !== "" && filter.status !== "all") {
      data = { ...data, status: filter.status };
    }
    return data;
  };

  const dispatch = useDispatch();
  const refetchQueries = useSelector((state: RootState) => state.refetch.time);

  const fetchData = async () => {
    const params = {
      ...getFilterValue(),
      page: page + 1,
      perPage: rowsPage,
      sortOrder: order,
      sortField: orderBy,
    };
    try {
      await api
        .get("/request", {
          params: params,
        })
        .then((res) => {
          setRequests(res.data.data);
          setCount(res.data.total);
        });
    } catch (error) {}
  };

  useEffect(() => {
    fetchData();
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [page, rowsPage, refetchQueries]);

  const handleReject = (id: string, action: string, message: string) => {
    dispatch(
      openConfirm({
        isOpen: true,
        title: "PROCEED WITH THIS ACTION?",
        message: "Are you sure you want to submit for rejection record?",
        feature: "",
        onConfirm: async () => {
          dispatch(closeConfirm());
          onChangeStatus(id, action, message);
        },
      })
    );
  };

  const handleApprove = (id: string, action: string, message: string) => {
    dispatch(
      openConfirm({
        isOpen: true,
        title: "PROCEED WITH THIS ACTION?",
        message: "Are you sure you want to submit for progress request?",
        feature: "",
        onConfirm: async () => {
          dispatch(closeConfirm());
          onChangeStatus(id, action, message);
        },
      })
    );
  };

  const handleFinish = (id: string, action: string, message: string) => {
    dispatch(
      openConfirm({
        isOpen: true,
        title: "PROCEED WITH THIS ACTION?",
        message: "Are you sure you want to submit for finish request?",
        feature: "",
        onConfirm: async () => {
          dispatch(closeConfirm());
          onChangeStatus(id, action, message);
        },
      })
    );
  };

  const onChangeStatus = async (
    id: string,
    action: string,
    message: string
  ) => {
    try {
      const variables = {
        status: action,
      };
      await api.put(`/request/${id}`, variables).then((res) => {
        dispatch(refetchComponent());
      });
      dispatch(
        openAlert({
          isOpen: true,
          title: "UPDATE WHITELIST",
          message: message,
          type: "success",
        })
      );
    } catch (error: any) {}
  };

  const getColorForRequestStatus = (value: string) => {
    switch (value) {
      case "IN-PROGRESS":
        return "success";
      case "PENDING":
        return "secondary";
      case "REJECTED":
        return "error";
      case "FINISHED":
        return "info";
      default:
        return "warning";
    }
  };

  // Truyền vào modal component Serivce table
  const handleClickView = (data: RequestProps) => {
    const modal = {
      isOpen: true,
      title: "View request",
      content: <ViewRequest item={data}></ViewRequest>,
      screen: SCREEN.BASE,
    };
    dispatch(openModal(modal));
  };

  const handleDeleteRequest = (item: RequestProps) => {
    const confirm = {
      isOpen: true,
      title: "CONFIRM TO DO NEXT STEP",
      message: "Are you sure you want to remove this request?",
      feature: DELETE_PRODUCT,
      onConfirm: async () => {
        try {
          await api.delete(`request/${item.id}`).then((res) => {
          });
          dispatch(refetchComponent());
          dispatch(
            openAlert({
              isOpen: true,
              title: "DELETE PRODUCT",
              message: `You've removed this request successfully`,
              type: "success",
            })
          );
          dispatch(closeConfirm());
        } catch (error: any) {}
      },
    };
    dispatch(openConfirm(confirm));
  };

  //Hiển thị các request
  const requestList = requests?.map((item, index) => {
    return (
      <tr className="hover:bg-primary-c50 hover:text-grey-c700" key={index}>
        <td className="pl-3 py-4">{rowsPage * page + index + 1}</td>
        <td className="px-1 py-4 w-[200px]">{item.name}</td>
        <td className="px-1 py-4 w-[250px]">{item.description}</td>
        <td className="px-1 py-4">{fDateTime(item.createdAt)}</td>
        <td className="px-1 py-4">{fDateTime(item.updatedAt)}</td>
        <td className="px-1 py-4">
          <Label color={getColorForRequestStatus(item.status)} variant="filled">
            {item.status}
          </Label>
        </td>

        <td className="px-1 py-4 w-[150px]">
          {/* Action Button */}
          <div className="flex flex-row gap-2 justify-center">
            <div>
              <Tooltip title="View request">
                <VisibilityIcon
                  color="success"
                  onClick={() => handleClickView(item)}
                  className="hover:cursor-pointer"
                />
              </Tooltip>
            </div>
            {item.status === "IN-PROGRESS" && (
              <div>
                <Tooltip title="Finish request">
                  <CheckCircleIcon
                    color="info"
                    onClick={() =>
                      handleFinish(
                        item.id,
                        "FINISHED",
                        "You've finished the request."
                      )
                    }
                    className="hover:cursor-pointer"
                  />
                </Tooltip>
              </div>
            )}
            {item.status === "PENDING" && (
              <div>
                <Tooltip title="Submit for approval">
                  <AssignmentTurnedInIcon
                    color="primary"
                    onClick={() =>
                      handleApprove(
                        item.id,
                        "IN-PROGRESS",
                        "You've approved the post."
                      )
                    }
                    className="hover:cursor-pointer"
                  ></AssignmentTurnedInIcon>
                </Tooltip>
              </div>
            )}

            {item.status === "PENDING" && (
              <div>
                <Tooltip title="Reject request">
                  <RemoveCircleOutlineIcon
                    color="error"
                    className="hover:cursor-pointer"
                    onClick={() =>
                      handleReject(
                        item.id,
                        "REJECTED",
                        `You've rejected the post.`
                      )
                    }
                  />
                </Tooltip>
              </div>
            )}

            {item.status === "FINISHED" ||
              (item.status === "REJECTED" && (
                <div>
                  <Tooltip title="Delete request">
                    <DeleteIcon
                      color="error"
                      className="hover:cursor-pointer"
                      onClick={() => handleDeleteRequest(item)}
                    />
                  </Tooltip>
                </div>
              ))}
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

  const handleOpenImageDetail = (image: string) => {
    dispatch(
      openImageDetail({
        isOpen: true,
        title: "Image detail",
        image: image,
        screen: SCREEN.BASE,
      })
    );
  };

  return (
    <SkeletonTable loading={false}>
      {/* Table */}
      <div className="max-w-[100%] rounded-[10px] overflow-hidden mt-6">
        <div className="overflow-x-auto">
          <table className="table-auto w-full text-base text-left">
            <thead
              className={`text-grey-c700 uppercase bg-primary-c100 ${FontFamily.BOLD} ${FontSize.BASE}`}
            >
              <tr className="hover:bg-secondary-c100 hover:text-grey-c700">
                <th className="pl-3 py-4">No</th>
                <th className="px-1 py-4">Name</th>
                <th className="px-1 py-4">Description</th>
                <th className="px-1 py-4">Create at</th>
                <th className="px-1 py-4">Update at</th>
                <th className="px-1 py-4">Status</th>
                <th className="px-1 py-4 text-center">Action</th>
              </tr>
            </thead>
            <tbody>{requestList}</tbody>
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
    </SkeletonTable>
  );
}
