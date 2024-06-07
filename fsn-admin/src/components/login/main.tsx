"use client";
import Button from "@/lib/button";
import TextField from "@/lib/text-field";
import Typography from "@/lib/typography";
import { useEffect, useState } from "react";
import Link from "next/link";
import { Form, Formik, getIn } from "formik";
import * as yup from "yup";
import { useDispatch } from "react-redux";
import storage from "@/services/storage";
import { closeLoading, openLoading } from "@/redux/slice/loadingSlice";
import { useRouter } from "next/navigation";
import VisibilityIcon from "@mui/icons-material/Visibility";
import VisibilityOffIcon from "@mui/icons-material/VisibilityOff";
import LoginIcon from "@mui/icons-material/Login";
import { FontFamily, FontSize, TextColor } from "@/enum/setting";
import api from "@/services/api";
import { openAlert } from "@/redux/slice/alertSlice";

type LoginFormValues = {
  username: string;
  password: string;
  isRemember: boolean;
};

const validationSchema = yup.object({
  username: yup.string().required("Please enter your username"),
  password: yup.string().required("Please enter your password"),
});

export default function Main() {
  const [showPassword, setShowPassword] = useState(false);

  const handleClickShowPassword = () => {
    setShowPassword(!showPassword);
  };
  const handleMouseDownPassword = () => setShowPassword(!showPassword);
  const dispatch = useDispatch();
  const initialValues: LoginFormValues = {
    username: "",
    password: "",
    isRemember: false,
  };
  const router = useRouter();

  const onSubmit = async (values: LoginFormValues) => {
    try {
      dispatch(openLoading());
      const variables = {
        username: values.username,
        password: values.password,
      };
      await api.post("/admin/login", variables).then((res) => {
        console.log(res);
        if (res.data && res.data.data) {
          storage.updateLocalAccessToken(res?.data?.data.token);
          storage.saveUserInfoToLocalStorage(res?.data?.data);
          router.push("/admin");
        } else {
          let alert: AlertState = {
            isOpen: true,
            title: "LOGIN FAILED",
            message: "Wrong username or password",
            type: "error",
          };
          dispatch(openAlert(alert));
        }
      });
    } catch (error: any) {
    } finally {
      dispatch(closeLoading());
    }
  };

  return (
    <div className="flex flex-col grow">
      {/* Header*/}
      <div className="flex flex-row py-10 pl-[126px]">
        <Typography
          textColor={TextColor.SUCCESS_800}
          fontSize={FontSize.XL_2}
          fontFamily={FontFamily.BLACK}
          className={"mr-2"}
        >
          ADMIN
        </Typography>
        <Typography
          textColor={TextColor.PRIMARY_900}
          fontSize={FontSize.XL_2}
          fontFamily={FontFamily.BLACK}
        >
          PORTAL
        </Typography>
      </div>
      {/* Login Form*/}
      <div className="flex justify-center pt-20">
        <div className="flex flex-col grow px-5 py-5 md:max-w-[600px] sm:max-w-[500px]">
          <div className="flex flex-col xs:px-5 sm:px-5 md:px-10 xs:py-5 sm:py-5 md:py-10 lg:py-10 py-20 bg-white rounded-xl shadow-lg">
            {/* Login title*/}
            <div className="my-8 justify-center items-center text-center">
              {" "}
              <Typography
                textColor={TextColor.GREY_900}
                fontSize={FontSize.XL_5}
                fontFamily={FontFamily.BLACK}
              >
                Login Now
              </Typography>
            </div>
            <Formik
              initialValues={initialValues}
              validationSchema={validationSchema}
              onSubmit={onSubmit}
            >
              {(formik) => (
                <Form>
                  {/* Username textfield*/}
                  <div className="flex-1 xs:pb-2 sm:pb-2 md:pb-2 lg:pb-2 pb-2">
                    <TextField
                      placeholder="Please enter your username"
                      label="Username*:"
                      name="username"
                      onChange={formik.handleChange}
                      value={formik.values.username}
                      fullWidth
                      error={
                        getIn(formik.touched, "username") &&
                        Boolean(getIn(formik.errors, "username"))
                      }
                      helperText={
                        getIn(formik.touched, "username") &&
                        getIn(formik.errors, "username")
                      }
                    ></TextField>
                  </div>
                  {/* Password textfield*/}
                  <div className="flex-1 xs:pb-2 sm:pb-2 md:pb-5 lg:pb-5 pb-5">
                    <TextField
                      placeholder="Please enter your password"
                      label="Password*:"
                      name="password"
                      onChange={formik.handleChange}
                      fullWidth
                      value={formik.values.password}
                      error={
                        getIn(formik.touched, "password") &&
                        Boolean(getIn(formik.errors, "password"))
                      }
                      helperText={
                        getIn(formik.touched, "password") &&
                        getIn(formik.errors, "password")
                      }
                      type={showPassword ? "text" : "password"}
                      inputProps={{
                        endAdornment: showPassword ? (
                          <VisibilityIcon
                            onClick={handleClickShowPassword}
                            onMouseDown={handleMouseDownPassword}
                          />
                        ) : (
                          <VisibilityOffIcon
                            onClick={handleClickShowPassword}
                            onMouseDown={handleMouseDownPassword}
                          />
                        ),
                      }}
                      className={`${FontSize.XS} ${TextColor.PRIMARY_700}`}
                    ></TextField>
                  </div>
                  {/* Actions such as remember me, forgot password */}
                  <div className="flex-1 flex items-center justify-between xs:pb-5 sm:pb-5 md:pb-10 lg:pb-10 pb-10">
                    <div className="flex items-center">
                      <input
                        type="checkbox"
                        checked={formik.values.isRemember}
                        name="isRemember"
                        onChange={() =>
                          formik.setFieldValue(
                            "isRemember",
                            !formik.values.isRemember
                          )
                        }
                        className="w-[18px] h-[18px] text-primary-c600 bg-primary-c100 rounded focus:ring-primary-c500"
                      />
                      <label className="ml-2 text-lg font-normal text-grey-c700">
                        Remember me
                      </label>
                    </div>

                    <Link href="/forgot-password">
                      <Typography
                        textColor={TextColor.PRIMARY_700}
                        fontSize={FontSize.LG}
                        fontFamily={FontFamily.NORMAL}
                      >
                        Forgot Password?
                      </Typography>
                    </Link>
                  </div>
                  {/* Sign in button */}
                  <div className="flex justify-center">
                    <Button
                      type="submit"
                      className="px-[80px] py-[10px]"
                      color="primary"
                      endIcon={<LoginIcon></LoginIcon>}
                    >
                      Sign In
                    </Button>
                  </div>
                </Form>
              )}
            </Formik>
          </div>
        </div>
      </div>
    </div>
  );
}
