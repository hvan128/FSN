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
import EditProduct from "./modals/view-product";
import { FontFamily, FontSize, SCREEN } from "@/enum/setting";
import ChangeCircleIcon from "@mui/icons-material/ChangeCircle";
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

type Props = {
  filter: ProductFilterProps;
};

export default function Product({ filter }: Props) {
  const [rowsPage, setRowsPage] = useState(rowsPerPage);
  const [page, setPage] = useState(Page);
  const [order, setOrder] = useState(SortOrder);
  const [orderBy, setOrderBy] = useState(SortField);
  const [count, setCount] = useState(0);
  const [products, setProducts] = useState<Array<ProductProps>>([]);

  const getFilterValue = () => {
    let data = {};

    if (filter.status !== "") {
      data = { ...data, status: filter.status };
    } else {
      data = { ...data, status: "pending" };
    }

    if (filter.type !== "") {
      data = { ...data, type: filter.type };
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
        .get("/community/dish", {
          params: params,
        })
        .then((res) => {
          console.log(params);
          console.log(res.data.data);
          setProducts(res.data.data);
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
        message: "Are you sure you want to submit for approval record?",
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
      await api.put(`/community/dish/status/${id}`, variables).then((res) => {
        console.log(res);
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

  const getColorForProductStatus = (value: string) => {
    switch (value) {
      case "APPROVED":
        return "success";
      case "PENDING":
        return "secondary";
      default:
        return "error";
    }
  };

  // Truyền vào modal component Serivce table
  const handleClickView = (data: ProductProps) => {
    const modal = {
      isOpen: true,
      title: "Edit product",
      content: <EditProduct item={data}></EditProduct>,
      screen: SCREEN.BASE,
    };
    dispatch(openModal(modal));
  };

  const handleChangeStatus = (item: ProductProps) => {
    const confirm = {
      isOpen: true,
      title: "CONFIRM TO DO NEXT STEP",
      message: "Are you sure you want to active this product?",
      feature: CHANGE_PRODUCT_STATUS,
      onConfirm: async () => {
        try {
          const variables = {
            updateProductId: parseInt(item.id),
            updateProductDto: {
              status: item.status === "ACTIVE" ? "DISABLE" : "ACTIVE",
            },
          };
          dispatch(
            openAlert({
              isOpen: true,
              title: "CHANGE PRODUCT STATUS",
              message: `You've updated this product successfully`,
              type: "success",
            })
          );
          dispatch(closeConfirm());
        } catch (error: any) {}
      },
    };
    dispatch(openConfirm(confirm));
  };

  //Hiển thị các product
  const productList = products?.map((item, index) => {
    return (
      <tr className="hover:bg-primary-c50 hover:text-grey-c700" key={index}>
        <td className="pl-3 py-4">{rowsPage * page + index + 1}</td>
        <td className="px-1 py-4 w-[200px]">{item.label}</td>
        <td className="px-1 py-4 w-[250px]">{item.description}</td>
        <td className="px-1 py-4">{item.owner.displayName}</td>
        <td className="px-1 py-4">{item.type}</td>
        <td className="px-1 py-4">{fDateTime(item.createdAt)}</td>
        <td className="px-1 py-4">
          <Label color={getColorForProductStatus(item.status)} variant="filled">
            {item.status}
          </Label>
        </td>
        <td className="px-1 py-4">
          {item.image && (
            <Image
            onClick={() => handleOpenImageDetail(convertImageUrl(item.image))}
            alt="Product"
            loader={() => convertImageUrl(item.image)}
            src={convertImageUrl(item.image)}
            unoptimized
            width={200}
            height={200}
            className="rounded-lg cursor-pointer object-cover w-[200px] h-[200px]"
          />
          )}
        </td>

        <td className="px-1 py-4 w-[150px]">
          {/* Action Button */}
          <div className="flex flex-row gap-2 justify-center">
            <div>
              <Tooltip title="View existing whitelist record">
                <VisibilityIcon
                  color="success"
                  onClick={() => handleClickView(item)}
                  className="hover:cursor-pointer"
                />
              </Tooltip>
            </div>
            {item.status !== "APPROVED" && (
              <div>
                <Tooltip title="Submit for approval">
                  <AssignmentTurnedInIcon
                    color="primary"
                    onClick={() =>
                      handleApprove(
                        item.id,
                        "APPROVED",
                        "You've approved the post."
                      )
                    }
                    className="hover:cursor-pointer"
                  ></AssignmentTurnedInIcon>
                </Tooltip>
              </div>
            )}

            {item.status !== "REJECTED" && (
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
                <th className="px-1 py-4">Dish name</th>
                <th className="px-1 py-4">Description</th>
                <th className="px-1 py-4">Owner</th>
                <th className="px-1 py-4">Type</th>
                <th className="px-1 py-4">Create at</th>
                <th className="px-1 py-4">Status</th>
                <th className="px-1 py-4">Image</th>
                <th className="px-1 py-4 text-center">Action</th>
              </tr>
            </thead>
            <tbody>{productList}</tbody>
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
