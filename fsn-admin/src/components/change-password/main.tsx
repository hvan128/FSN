"use client";
import { FontFamily, FontSize, TextColor } from "@/enum/setting";
import Button from "@/lib/button";
import Divide from "@/lib/divide";
import TextField from "@/lib/text-field";
import Typography from "@/lib/typography";
import Visibility from "@mui/icons-material/Visibility";
import VisibilityOff from "@mui/icons-material/VisibilityOff";
import SaveAsIcon from "@mui/icons-material/SaveAs";
import React, { useMemo, useState } from "react";
import { Form, Formik, getIn } from "formik";
import * as yup from "yup";
import { validatePassword } from "@/utils/regex";
import { useDispatch } from "react-redux";
import { openAlert } from "@/redux/slice/alertSlice";
import { closeLoading, openLoading } from "@/redux/slice/loadingSlice";
import storage from "@/services/storage";
import api from "@/services/api";

const validationSchema = yup.object({
  oldPassword: yup.string().required("Please enter your old password"),
  newPassword: yup.string().required("Please enter your new password").matches(
    // @ts-ignore
    validatePassword(),
    "Password must be between 10 and 32 characters long and contain at least one lowercase letter and one uppercase letter"
  ),
  confirmPassword: yup
    .string()
    .required("Please confirm your new password")
    .equals(
      [yup.ref("newPassword")],
      "Confirm password must match new password"
    ),
});
export default function Main() {
  const [showOldPassword, setShowOldPassword] = useState(false);
  const [showNewPassword, setShowNewPassword] = useState(false);
  const [showConfirmPassword, setShowConfirmPassword] = useState(false);
  const dispatch = useDispatch();

  const handleClickShowOldPassword = () => {
    setShowOldPassword(!showOldPassword);
  };
  const handleClickShowNewPassword = () => {
    setShowNewPassword(!showNewPassword);
  };
  const handleClickShowConfirmPassword = () => {
    setShowConfirmPassword(!showConfirmPassword);
  };
  const initialValues = useMemo(() => {
    return {
      oldPassword: "",
      newPassword: "",
      confirmPassword: "",
    };
  }, []);

  const handleChangePassword = async (values: any, { resetForm }: any) => {
    try {
      dispatch(openLoading());
      const { newPassword, oldPassword, confirmPassword } = values;
      let userInformation = storage.getUserInforFromLocalStorage();
      const variables = {
        id: userInformation.id,
        confirmPassword: confirmPassword,
        newPassword: newPassword,
        oldPassword: oldPassword,
      };
      api.put('/admin/change-password', variables).then((res) => {
        console.log(res);
      })
      resetForm();
      let alert: AlertState = {
        isOpen: true,
        title: "CHANGE PASSWORD",
        message: "You've successfully changed your password",
        type: "success",
      };
      dispatch(openAlert(alert));
    } catch (error: any) {
      let alert: AlertState = {
        isOpen: true,
        title: "ERROR",
        message: "Something went wrong, please try again",
        type: "error",
      };
      dispatch(openAlert(alert));
    } finally {
      dispatch(closeLoading());
    }
  };

  return (
    <div className="flex flex-col grow bg-white rounded-2xl px-4 py-4 min-h-[800px]">
      {/* Header */}
      <div className="justify-between items-center flex flex-row py-2">
        <div>
          <Typography
            textColor={TextColor.GREY_700}
            fontSize={FontSize.XL}
            fontFamily={FontFamily.BOLD}
          >
            {" "}
            Change password{" "}
          </Typography>
        </div>
        <div></div>
      </div>
      {/* Divider */}
      <Divide></Divide>
      <Formik
        initialValues={initialValues}
        onSubmit={handleChangePassword}
        validationSchema={validationSchema}
        enableReinitialize
      >
        {(formik) => (
          <Form>
            <div className="w-full flex flex-col justify-center items-center my-10">
              <div className="xl:w-5/12 lg:w-6/12 sm:w-8/12 md:w-8/12 w-full px-4 py-4 flex flex-col gap-4">
                <TextField
                  placeholder="Enter current password"
                  label="Current Password"
                  name="oldPassword"
                  id="oldPassword"
                  type={showOldPassword ? "text" : "password"}
                  value={formik.values.oldPassword}
                  helperText={
                    getIn(formik.touched, "oldPassword") &&
                    getIn(formik.errors, "oldPassword")
                  }
                  error={
                    getIn(formik.touched, "oldPassword") &&
                    Boolean(getIn(formik.errors, "oldPassword"))
                  }
                  onChange={formik.handleChange}
                  inputProps={{
                    endAdornment: showOldPassword ? (
                      <Visibility
                        onClick={handleClickShowOldPassword}
                        className="hover:cursor-pointer"
                      />
                    ) : (
                      <VisibilityOff
                        onClick={handleClickShowOldPassword}
                        className="hover:cursor-pointer"
                      />
                    ),
                  }}
                />
                <TextField
                  placeholder="Enter new password"
                  label="New Password"
                  name="newPassword"
                  id="newPassword"
                  type={showNewPassword ? "text" : "password"}
                  value={formik.values.newPassword}
                  onChange={formik.handleChange}
                  helperText={
                    getIn(formik.touched, "newPassword") &&
                    getIn(formik.errors, "newPassword")
                  }
                  error={
                    getIn(formik.touched, "newPassword") &&
                    Boolean(getIn(formik.errors, "newPassword"))
                  }
                  inputProps={{
                    endAdornment: showNewPassword ? (
                      <Visibility
                        onClick={handleClickShowNewPassword}
                        className="hover:cursor-pointer"
                      />
                    ) : (
                      <VisibilityOff
                        onClick={handleClickShowNewPassword}
                        className="hover:cursor-pointer"
                      />
                    ),
                  }}
                />
                <TextField
                  placeholder="Enter confirm password"
                  label="Confirm Password"
                  name="confirmPassword"
                  id="confirmPassword"
                  type={showConfirmPassword ? "text" : "password"}
                  value={formik.values.confirmPassword}
                  onChange={formik.handleChange}
                  helperText={
                    getIn(formik.touched, "confirmPassword") &&
                    getIn(formik.errors, "confirmPassword")
                  }
                  error={
                    getIn(formik.touched, "confirmPassword") &&
                    Boolean(getIn(formik.errors, "confirmPassword"))
                  }
                  inputProps={{
                    endAdornment: showConfirmPassword ? (
                      <Visibility
                        onClick={handleClickShowConfirmPassword}
                        className="hover:cursor-pointer"
                      />
                    ) : (
                      <VisibilityOff
                        onClick={handleClickShowConfirmPassword}
                        className="hover:cursor-pointer"
                      />
                    ),
                  }}
                />
                <div className="flex flex-row-reverse px-2 mt-3">
                  <Button
                    type="submit"
                    endIcon={<SaveAsIcon />}
                    disabled={!formik.dirty}
                  >
                    Save
                  </Button>
                </div>
              </div>
            </div>
          </Form>
        )}
      </Formik>
    </div>
  );
}
