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
import * as yup from "yup";

type EditProductProps = {
  label: string;
  description: string;
  createdAt: string;
  id: string;
  image: string;
  cookingTime: string;
  type: string;
  steps: Array<any>;
  ingredients: Array<any>;
  rangeOfPeople: string;
  owner: UserModel;
  updatedAt: string;
};

type Props = {
  item: ProductProps;
};

export default function ViewProduct({ item }: Props) {

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

  return (
    <div>
      <div className="bg-white flex flex-col gap-2 sm:px-4 sm:py-4 border-b-2 border-b-grey-c100">
        <div className="flex flex-row px-8 gap-4">
          <div className="flex-1">
            <TextField
              label="Owner name"
              name="code"
              disabled
              value={item.owner.displayName}
            ></TextField>
          </div>
          <div className="flex-1">
            <TextField
              label="Created at"
              name="name"
              value={fDateTime(item.createdAt) || ""}
              disabled
            ></TextField>
          </div>
        </div>
        <div className="flex flex-row px-8 gap-4">
          <div className="flex-1">
            {/* <Select
              options={listProductStatus}
              placeholder="Select new product status"
              title="Product status"
              position="bottom"
              name="status"
              selected={item.status}
              
            ></Select> */}
          </div>
          <div className="flex-1">
            {/* <Select
              options={productTypes}
              placeholder="Select new product type"
              title="Product type"
              position="bottom"
              name="type"
              disabled
              selected={item.type}
             
            ></Select> */}
          </div>
        </div>
        <div className="flex flex-col px-8 items-center">
          <TextField
            fullWidth
            disabled
            label="Label"
            value={item.label}
            multiline
            rows={2}
          ></TextField>
        </div>
        <div className="flex flex-col px-8 items-center">
          <TextField
            fullWidth
            disabled
            name="description"
            label="Product description"
            value={item.description}
            placeholder="Enter new product description"
            multiline
            rows={3}
          ></TextField>
        </div>
        {item.image ? (
          <div className="flex flex-col px-8 items-center">
            <Image
              onClick={() => handleOpenImageDetail(convertImageUrl(item.image))}
              alt="Product"
              loader={() => convertImageUrl(item.image)}
              src={convertImageUrl(item.image)}
              unoptimized
              width="0"
              height="0"
              className="w-[200px] h-auto rounded-lg"
            ></Image>
          </div>
        ) : (
          <></>
        )}
        <div>
          <Typography
            fontSize={FontSize.LG}
            fontFamily={FontFamily.BOLD}
            textColor={TextColor.PRIMARY_900}
          >
            Ingredients
          </Typography>
          {item.ingredients.map((item, index) => (
            <div key={index} className="flex flex-row px-8 gap-4">
              <Typography
                textColor={TextColor.PRIMARY_700}
                className={`!font-bold`}
              >
                {item.quantity} {item.unit} {item.label}
              </Typography>
            </div>
          ))}
        </div>
        <div>
          <Typography
            fontSize={FontSize.LG}
            fontFamily={FontFamily.BOLD}
            textColor={TextColor.PRIMARY_900}
          >
            Steps
          </Typography>
          {item.steps.map((item, index) => (
            <div
              key={index}
              className="flex flex-row px-8 gap-4 py-4 items-center"
            >
              <Typography
                textColor={TextColor.PRIMARY_700}
                className={`!font-bold`}
              >
                {item.no}
              </Typography>
              <div className="flex-1">
                <Typography
                  textColor={TextColor.PRIMARY_700}
                  className={`!font-bold`}
                >
                  {item.description}
                </Typography>
              </div>
              {item.image ? (
                <div className="flex flex-col px-8 items-center">
                  <Image
                    alt="Product"
                    onClick={() =>
                      handleOpenImageDetail(convertImageUrl(item.image))
                    }
                    loader={() => convertImageUrl(item.image)}
                    src={convertImageUrl(item.image)}
                    unoptimized
                    width="0"
                    height="0"
                    className="w-[200px] h-auto rounded-lg"
                  ></Image>
                </div>
              ) : (
                <></>
              )}
            </div>
          ))}
        </div>
      </div>
      {/* Footer */}
    </div>
  );
}
