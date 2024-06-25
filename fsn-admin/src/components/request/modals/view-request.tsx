"use client";
import { ImageFileType } from "@/enum/constants";
import { FontFamily, FontSize, SCREEN, TextColor } from "@/enum/setting";
import Button from "@/lib/button";
import Select from "@/lib/select";
import TextField from "@/lib/text-field";
import Typography from "@/lib/typography";
import { openAlert } from "@/redux/slice/alertSlice";
import { openImageDetail } from "@/redux/slice/imageDetailSlice";
import { closeLoading, openLoading } from "@/redux/slice/loadingSlice";
import { closeModal } from "@/redux/slice/modalSlice";
import { refetchComponent } from "@/redux/slice/refetchSlice";
import { convertImageUrl, fDateTime } from "@/utils/function";
import { Update } from "@mui/icons-material";
import { Form, Formik, getIn } from "formik";
import Image from "next/image";
import React, { useState } from "react";
import { useDispatch } from "react-redux";
import Label from "@/lib/label";

type Props = {
  item: RequestProps;
};

export default function ViewRequest({ item }: Props) {
  const dispatch = useDispatch();
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
  const getColorForRequestStatus = (value: string) => {
    switch (value) {
      case "APPROVED":
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

  return (
    <div>
      <div className="bg-white flex flex-col gap-2 sm:px-4 sm:py-4 border-b-2 border-b-grey-c100">
        <div className="flex flex-row px-8 gap-4">
          <div className="flex-1 flex flex-row items-center">
            <TextField
              label="Created at"
              name="name"
              fullWidth
              value={fDateTime(item.createdAt) || ""}
              read={true}
            ></TextField>
            <div className="ml-4">
              <Label
                color={getColorForRequestStatus(item.status)}
                variant="filled"
              >
                {item.status}
              </Label>
            </div>
          </div>
        </div>
        <div className="flex flex-row px-8 gap-4"></div>
        <div className="flex flex-col px-8 items-center">
          <TextField
            fullWidth
            read={true}
            label="Label"
            value={item.name}
            multiline
            rows={2}
          ></TextField>
        </div>
        <div className="flex flex-col px-8 items-center">
          <TextField
            fullWidth
            read={true}
            name="description"
            label="Request description"
            value={item.description}
            placeholder="Enter new product description"
            multiline
            rows={3}
          ></TextField>
        </div>
      </div>
      {/* Footer */}
    </div>
  );
}
