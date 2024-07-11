"use client";
import Button from "@/lib/button";
import TextField from "@/lib/text-field";
import Typography from "@/lib/typography";
import { openAlert } from "@/redux/slice/alertSlice";
import { closeModal } from "@/redux/slice/modalSlice";
import { refetchComponent } from "@/redux/slice/refetchSlice";
import AddCircleOutlineIcon from "@mui/icons-material/AddCircleOutline";
import { Form, Formik, getIn } from "formik";
import Image from "next/image";
import React, { useState } from "react";
import { useDispatch } from "react-redux";
import * as yup from "yup";
import api from "@/services/api";

type AnnouncementType = {
  title: string;
  messageSummary: string;
  messageDetail: string;
};

const validationSchema = yup.object({
  title: yup.string().required("Announcement title is empty!"),
  messageSummary: yup
    .string()
    .required("Announcement message summary is empty!"),
  messageDetail: yup.string().required("Announcement message detail is empty!"),
});

export default function AddAnnouncement() {
  const initialValues: AnnouncementType = {
    title: "",
    messageSummary: "",
    messageDetail: "",
  };


  const dispatch = useDispatch();

  const onSubmit = async (values: AnnouncementType) => {
    try {

      const variables = {
        title: values.title,
        summary: values.messageSummary,
        detail: values.messageDetail,
        type: 'admin',
      };
      console.log(variables);
      api.post('/send-notification', variables).then((res) => {
        console.log(res);
        
        if (res.status === 200) {
          dispatch(closeModal());
          let alert: any = {
            isOpen: true,
            title: "CREATE ANNOUNCEMENT",
            message: `You've successfully created an announcement. An notification is sent to all users`,
            type: "success",
          };
          dispatch(openAlert(alert));
          dispatch(refetchComponent());
        } else {
          let alert: any = {
            isOpen: true,
            title: "CREATE ANNOUNCEMENT",
            message: res.data.message,
            type: "error",
          };
          dispatch(openAlert(alert));
        }
      });
      api.post("/notification", variables);
    } catch (error) {
      let alert: AlertState = {
        isOpen: true,
        title: "CREATE ANNOUNCEMENT",
        message: "Something was wrong with create announcement",
        type: "error",
      };
      dispatch(openAlert(alert));
    } finally {
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
              <div className="flex flex-row px-8 gap-6 ">
                <div className="w-full">
                  <TextField
                    label="Title *:"
                    name="title"
                    value={formik.values.title}
                    placeholder="Enter announcement title"
                    error={
                      getIn(formik.touched, "title") &&
                      Boolean(getIn(formik.errors, "title"))
                    }
                    helperText={
                      getIn(formik.touched, "title") &&
                      getIn(formik.errors, "title")
                    }
                    onChange={formik.handleChange}
                  ></TextField>
                </div>
              </div>
              <div className="flex-1 px-8">
                <TextField
                  label="Message summary *:"
                  name="messageSummary"
                  value={formik.values.messageSummary}
                  placeholder="Enter announcement message summary"
                  onChange={formik.handleChange}
                  multiline
                  rows={2}
                  error={
                    getIn(formik.touched, "messageSummary") &&
                    Boolean(getIn(formik.errors, "messageSummary"))
                  }
                  helperText={
                    getIn(formik.touched, "messageSummary") &&
                    getIn(formik.errors, "messageSummary")
                  }
                ></TextField>
              </div>
              <div className="flex-1 px-8">
                <TextField
                  placeholder="Enter announcement message detail"
                  label="Message detail *:"
                  name="messageDetail"
                  value={formik.values.messageDetail}
                  onChange={formik.handleChange}
                  multiline
                  rows={5}
                  error={
                    getIn(formik.touched, "messageDetail") &&
                    Boolean(getIn(formik.errors, "messageDetail"))
                  }
                  helperText={
                    getIn(formik.touched, "messageDetail") &&
                    getIn(formik.errors, "messageDetail")
                  }
                />
              </div>
            </div>
            {/* Footer */}
            <div className="flex justify-end px-2 py-2">
              <Button
                color="primary"
                type="submit"
                endIcon={<AddCircleOutlineIcon />}
                disabled={Boolean(getIn(formik.errors, "image"))}
              >
                Add
              </Button>
            </div>
          </Form>
        )}
      </Formik>
    </div>
  );
}
