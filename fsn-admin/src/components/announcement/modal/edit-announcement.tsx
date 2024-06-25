"use client";
import { ImageFileType, maxImageSize } from "@/enum/constants";
import { FontFamily, FontSize, TextColor } from "@/enum/setting";
import Button from "@/lib/button";
import TextField from "@/lib/text-field";
import Typography from "@/lib/typography";
import { openAlert } from "@/redux/slice/alertSlice";
import { closeLoading, openLoading } from "@/redux/slice/loadingSlice";
import { closeModal } from "@/redux/slice/modalSlice";
import { refetchComponent } from "@/redux/slice/refetchSlice";
import AddCircleOutlineIcon from "@mui/icons-material/AddCircleOutline";
import { Form, Formik, getIn } from "formik";
import Image from "next/image";
import React, { useEffect, useMemo, useState } from "react";
import { useDispatch } from "react-redux";
import * as yup from "yup";
import SwitchButton from "../../../lib/switch-button";
import Skeleton from "@/lib/skeleton";
import SaveIcon from "@mui/icons-material/Save";
import InputImage from "@/lib/input-image";

type Props = {
  id: string | number;
};

type AnnouncementType = {
  images: string;
  title: string;
  status: string;
  messageSummary: string;
  messageDetail: string;
  liveTicker: boolean;
};

const validationSchema = yup.object({
  title: yup.string().required("Announcement title is empty!"),
  messageSummary: yup
    .string()
    .required("Announcement message summary is empty!"),
  messageDetail: yup.string().required("Announcement message detail is empty!"),
  liveTicker: yup.boolean().required("Announcement live ticker is empty!"),
  images: yup
    .mixed()
    .when("liveTicker", ([liveTicker]: any[], schema: yup.MixedSchema) => {
      return liveTicker === true
        ? schema.required("Image is required!")
        : schema;
    })
    .test(
      "FILE_SIZE",
      "Uploaded file is too big.",
      (value: any) =>
        !value ||
        (value && value.size <= maxImageSize) ||
        typeof value === "string"
    )
    .test(
      "FILE_FORMAT",
      "Uploaded file has unsupported format.",
      (value: any) =>
        !value ||
        (value && ImageFileType.includes(value.type)) ||
        typeof value === "string"
    ),
});

export default function EditAnnouncement({ id }: Props) {
  const [previewImage, setPreviewImage] = useState("");
  const [announcement, setAnnouncement] = useState<AnnouncementType>();

  useEffect(() => {
    const fetchData = async () => {
      try {
        // setAnnouncement(data?.data.Announcement);
        // setPreviewImage(data?.data.Announcement.images)
      } catch (e) {
      } finally {
      }
    };

    fetchData();

    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, []);

  const initialValues: AnnouncementType = useMemo(() => {
    return {
      images: announcement?.images ?? "",
      title: announcement?.title ?? "",
      status: announcement?.status ?? "IN_PROGRESS",
      messageSummary: announcement?.messageSummary ?? "",
      messageDetail: announcement?.messageDetail ?? "",
      liveTicker: announcement?.liveTicker ?? false,
    };
  }, [announcement]);

  const dispatch = useDispatch();

  const onSubmit = async (values: AnnouncementType) => {
    try {
      dispatch(openLoading());
      const formData = new FormData();

      const variables = {
        updateAnnouncementId: Number(id),
        updateAnnouncementBroadcastDto: {
          title: values.title,
          status: values.status,
          messageSummary: values.messageSummary,
          messageDetail: values.messageDetail,
          liveTicker: values.liveTicker,
        },
      };

      // Change image
    } catch (error) {
      let alert: AlertState = {
        isOpen: true,
        title: "Update ANNOUNCEMENT",
        message: "Something was wrong with update announcement",
        type: "error",
      };
      dispatch(openAlert(alert));
    } finally {
      dispatch(closeLoading());
    }
  };

  return (
    <div>
      <Formik
        initialValues={initialValues}
        validationSchema={validationSchema}
        onSubmit={onSubmit}
        enableReinitialize
      >
        {(formik) => (
          <Form>
            {/* Content */}
            <Skeleton loading={false}>
              <div className="bg-white flex flex-col gap-2 sm:px-4 sm:py-4 border-b-2 border-b-grey-c100">
                <div className="flex flex-row px-8 gap-6 ">
                  <div className="basis-3/4">
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
                  <div className="1/4">
                    <Typography
                      className="text-primary-c700"
                      fontFamily={FontFamily.BOLD}
                    >
                      Live Ticker *:
                    </Typography>
                    <SwitchButton
                      checked={formik.values.liveTicker}
                      name="liveTicker"
                      handleClickSwitchButton={() => {
                        formik.setFieldValue(
                          "liveTicker",
                          !formik.values.liveTicker
                        );
                      }}
                    />
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
                <div className="pt-2">
                  <InputImage
                    id="image"
                    name="image"
                    previewImage={previewImage}
                    onChange={(event) => {
                      formik.setFieldValue("images", event.target.files?.[0]);
                      setPreviewImage(
                        URL.createObjectURL(
                          event.target.files?.[0] ?? new Blob()
                        )
                      );
                    }}
                    onDeleteImage={() => {
                      formik.setFieldValue("images", "");
                      setPreviewImage("");
                    }}
                  />
                </div>
              </div>
              {/* Footer */}
              <div className="flex justify-end px-2 py-2">
                <Button
                  color="primary"
                  type="submit"
                  endIcon={<SaveIcon />}
                  disabled={Boolean(getIn(formik.errors, "image"))}
                >
                  Save
                </Button>
              </div>
            </Skeleton>
          </Form>
        )}
      </Formik>
    </div>
  );
}
