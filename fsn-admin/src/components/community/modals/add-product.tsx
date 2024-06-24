"use client"
import { ImageFileType } from "@/enum/constants";
import { FontFamily, FontSize, TextColor } from "@/enum/setting";
import Button from "@/lib/button";
import Select from "@/lib/select";
import TextField from "@/lib/text-field";
import Typography from "@/lib/typography";
import { openAlert } from "@/redux/slice/alertSlice";
import { closeLoading, openLoading } from "@/redux/slice/loadingSlice";
import { closeModal } from "@/redux/slice/modalSlice";
import { refetchComponent } from "@/redux/slice/refetchSlice";
import { Update } from "@mui/icons-material";
import { Form, Formik, getIn } from "formik";
import Image from "next/image";
import React, { useState } from "react";
import { useDispatch } from "react-redux";
import * as yup from 'yup';

type editProductProps = {
    code: string
    description: string
    highlight: string
    image: string
    name: string
    status: string
    type: string
}

const validationSchema = yup.object({
    name: yup.string().required('Product name is empty!'),
    code: yup.string().required('Product code is empty!'),
    type: yup.string().required('Product type is empty!'),
    status: yup.string().required('Product status is empty!'),
    image: yup.mixed().required('Image is required!').test("FILE_SIZE", "Uploaded file is too big.",
        (value: any) => !value || (value && value.size <= maxImageSize))
        .test("FILE_FORMAT", "Uploaded file has unsupported format.",
            (value: any) => !value || (value && ImageFileType.includes(value.type))),
});

export default function AddProduct() {

    const initialValues: editProductProps = {
        code: '',
        description: '',
        highlight: '',
        image: '',
        name: '',
        status: '',
        type: '',
    };

    const [previewImage, setPreviewImage] = useState('');

    const dispatch = useDispatch();

    const onSubmit = async (values :editProductProps) => {
        try {
            dispatch(openLoading());
          const formData = new FormData();
   
            const variables = {
              createProductDto: {
                name: values.name,
                code: values.code,
                type: values.type,
                status: values.status,
                highlight: values.highlight,
                description: values.description,
              },
            };
    
            
            formData.append(
              'map',
              JSON.stringify({ 0: ['variables.createProductDto.file'] })
            );
            formData.append('0', values.image);
            const body = formData;
    
            if (!response?.data?.data?.CreateProduct) {
              let alert: AlertState = {
                isOpen: true,
                title: 'CREATE PRODUCT',
                message: response?.data?.errors[0]?.message || "Something was wrong",
                type: 'error'
              }
              dispatch(openAlert(alert));
            } else {
            let alert: AlertState = {
                isOpen: true,
                title: 'CREATE PRODUCT',
                message: 'Create product successfully',
                type: 'success'
              }
              dispatch(openAlert(alert));
              dispatch(closeModal())
              dispatch(refetchComponent());
            }
        } catch (error) {
            let alert: AlertState = {
                isOpen: true,
                title: 'CREATE PRODUCT',
                message: 'Something was wrong with create product',
                type: 'error'
              }
              dispatch(openAlert(alert));
        }finally{
            dispatch(closeLoading());
        }
      };

    return (
        <div>
            <Formik
                initialValues={initialValues}
                validationSchema={validationSchema}
                onSubmit={onSubmit}
            >
                {(formik) => (
                    <Form>
                        {/* Content */}
                        <div className="bg-white flex flex-col gap-2 sm:px-4 sm:py-4 border-b-2 border-b-grey-c100">
                            <div className="flex flex-row px-8 gap-4">
                                <div className="flex-1">
                                    <TextField
                                        label="Product name"
                                        name='name'
                                        value={formik.values.name}
                                        placeholder="Enter new product name"
                                        error={
                                            getIn(formik.touched, 'name') &&
                                            Boolean(getIn(formik.errors, 'name'))
                                          }
                                          helperText={
                                            getIn(formik.touched, 'name') &&
                                            getIn(formik.errors, 'name')
                                          }
                                          onChange={formik.handleChange}
                                    >
                                    </TextField>
                                </div>
                                <div className="flex-1">
                                    <TextField
                                        label="Product code"
                                        name='code'
                                        value={formik.values.code}
                                        placeholder="Enter new product code"
                                        onChange={formik.handleChange}
                                        error={
                                            getIn(formik.touched, 'code') &&
                                            Boolean(getIn(formik.errors, 'code'))
                                          }
                                          helperText={
                                            getIn(formik.touched, 'code') &&
                                            getIn(formik.errors, 'code')
                                          }
                                    >
                                    </TextField>
                                </div>
                            </div>
                            <div className="flex flex-row px-8 gap-4">
                                <div className="flex-1">
                                    <Select options={listProductStatus} placeholder="Select new product status" title="Product status" position="bottom"
                                        name='status'
                                        onSelectItem={(e) => {
                                            formik.setFieldValue("status", e.value);
                                        }}
                                          error={
                                            getIn(formik.touched, 'status') &&
                                            Boolean(getIn(formik.errors, 'status'))
                                          }
                                          helperText={
                                            getIn(formik.touched, 'status') &&
                                            getIn(formik.errors, 'status')
                                          }
                                    ></Select>
                                </div>
                                <div className="flex-1">
                                    <Select options={productTypes} placeholder="Select new product type" title="Product type" position="bottom"
                                          name='type'
                                          onSelectItem={(e) => {
                                            formik.setFieldValue("type", e.value);
                                        }}
                                          error={
                                            getIn(formik.touched, 'type') &&
                                            Boolean(getIn(formik.errors, 'type'))
                                          }
                                          helperText={
                                            getIn(formik.touched, 'type') &&
                                            getIn(formik.errors, 'type')
                                          }
                                    ></Select>
                                </div>
                            </div>
                            <div className="flex flex-col px-8 items-center">
                                <TextField
                                    fullWidth
                                    name='highlight'
                                    label="Product highlight"
                                    value={formik.values.highlight}
                                    onChange={formik.handleChange}
                                    placeholder="Enter new product highlight"
                                    multiline
                                    rows={3}
                                >
                                </TextField>
                            </div>
                            <div className="flex flex-col px-8 items-center">
                                <TextField
                                    fullWidth
                                    name='description'
                                    label="Product description"
                                    value={formik.values.description}
                                    onChange={formik.handleChange}
                                    placeholder="Enter new product description"
                                    multiline
                                    rows={3}
                                >
                                </TextField>
                            </div>
                            { previewImage ? (<div className="flex flex-col px-8 items-center">
                                <Image alt="Product" loader={() => previewImage} src={previewImage} width={100} height={100}></Image>
                            </div>) : <></>}
                            <div className="flex flex-col px-8 items-center">
                                <input type="file" accept="image/*" id="image" name="image" onChange={(event) => {
                                    formik.setFieldValue("image", event.target.files?.[0]);
                                    setPreviewImage(URL.createObjectURL(event.target.files?.[0] ?? new Blob()));
                                }}></input>
                            </div>
                            <div className="flex flex-col px-8 items-center">
                                {Boolean(getIn(formik.errors, 'image')) ?
                                    <Typography fontFamily={FontFamily.NORMAL} fontSize={FontSize.SM} textColor={TextColor.SUPPORT_900}> {formik.errors.image} </Typography> : <></>}
                            </div>
                        </div>
                        {/* Footer */}
                        <div className="flex justify-end px-2 py-2">
                            <Button color="primary" type="submit" endIcon={<Update></Update>} disabled={Boolean(getIn(formik.errors, 'image'))}>
                                Update
                            </Button>
                        </div>
                    </Form>
                )}
            </Formik>
        </div>
    );
};
