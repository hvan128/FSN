import Button from "@/lib/button";
import Select, { Item } from "@/lib/select";
import TextField from "@/lib/text-field";
import React from "react";
import AddIcon from "@mui/icons-material/Add";
import { closeModal } from "@/redux/slice/modalSlice";
import { useDispatch } from "react-redux";
import { Form, Formik, getIn } from "formik";
import * as yup from "yup";
import { closeLoading, openLoading } from "@/redux/slice/loadingSlice";
import { openAlert } from "@/redux/slice/alertSlice";
import Typography from "@/lib/typography";
import { TextColor } from "@/enum/setting";
import {
  validateNoNumNoSCharacter,
  validateNoNumNoSCharacterNoSpace,
  validatePhone,
  validatePhoneBhutan,
} from "@/utils/regex";
import { userAgent } from "next/server";
import api from "@/services/api";
import { refetchComponent } from "@/redux/slice/refetchSlice";

const AddSystemUser = ({ refetch }: { refetch: () => void }) => {
  const rolesArray: Item[] = [
    { label: "Super Admin", value: "SUPER_ADMIN" },
    { label: "Manager", value: "MANAGER" },
  ];

  const dispatch = useDispatch();

  const handleCreate = async (values: any, { resetForm }: any) => {
    try {
      dispatch(openLoading());
      const variables = {
        username: values.username,
        fullName: values.fullName,
        email: values.email,
        phone: values.phone,
        role: values.adminRole,
      };
      await api.post("/admin/register", variables).then((res) => {
        if (res.data && res.data.data) {
          dispatch(closeModal());
          let alert: any = {
            isOpen: true,
            title: "CREATE SYSTEM USER",
            message: `You've successfully added the user account. An email is sent to the user to activate the account`,
            type: "success",
          };
          dispatch(openAlert(alert));
          dispatch(refetchComponent());
        } else {
          let alert: any = {
            isOpen: true,
            title: "CREATE SYSTEM USER",
            message: res.data.message,
            type: "error",
          };
          dispatch(openAlert(alert));
        }
      });
    } catch (error: any) {
      dispatch(closeModal());
    } finally {
      dispatch(closeLoading());
    }
  };

  const validationSchema = yup.object({
    username: yup
      .string()
      .trim()
      .matches(
        validateNoNumNoSCharacterNoSpace(),
        "Username should be between 6 and 32 characters, not allow number, spaces and special characters."
      )
      .required("Please enter your username"),
    fullName: yup
      .string()
      .matches(
        validateNoNumNoSCharacter(),
        "Name does not allow numbers and special characters"
      )
      .required("Please enter your name"),
    email: yup.string().email().required("Please enter your email"),
    phone: yup
      .string()
      .nullable()
      .matches(validatePhone(), "Invalid phone number format!")
      .required("Please enter phone number"),
    adminRole: yup.string().required("Please select user role"),
  });

  return (
    <Formik
      initialValues={{
        username: "",
        fullName: "",
        email: "",
        phone: "",
        adminRole: "",
      }}
      validationSchema={validationSchema}
      onSubmit={handleCreate}
      enableReinitialize
    >
      {(formik) => (
        <Form>
          <div className="flex flex-col gap-4 px-3 py-4 sm:p-4 border-b-2 border-b-grey-c100">
            <div className="flex gap-4">
              <div className="flex-1">
                <TextField
                  label="Username *"
                  placeholder="Enter username"
                  name="username"
                  id="username"
                  value={formik.values.username}
                  helperText={
                    getIn(formik.touched, "username") &&
                    getIn(formik.errors, "username")
                  }
                  error={
                    getIn(formik.touched, "username") &&
                    Boolean(getIn(formik.errors, "username"))
                  }
                  onChange={formik.handleChange}
                  className="flex-1"
                ></TextField>
              </div>
              <div className="flex-1">
                <TextField
                  label="Name *"
                  placeholder="Enter your full name"
                  name="fullName"
                  id="fullName"
                  helperText={
                    getIn(formik.touched, "fullName") &&
                    getIn(formik.errors, "fullName")
                  }
                  error={
                    getIn(formik.touched, "fullName") &&
                    Boolean(getIn(formik.errors, "fullName"))
                  }
                  onChange={formik.handleChange}
                  value={formik.values.fullName}
                  className="flex-1"
                ></TextField>
              </div>
            </div>
            <div className="flex gap-4">
              <div className="flex-1">
                <TextField
                  label="Email *"
                  placeholder="Enter your email"
                  name="email"
                  id="email"
                  helperText={
                    getIn(formik.touched, "email") &&
                    getIn(formik.errors, "email")
                  }
                  error={
                    getIn(formik.touched, "email") &&
                    Boolean(getIn(formik.errors, "email"))
                  }
                  onChange={formik.handleChange}
                  value={formik.values.email}
                  className="flex-1"
                ></TextField>
              </div>
              <div className="flex-1">
                <TextField
                  label="Phone *"
                  placeholder="Enter your phone number"
                  name="phone"
                  id="phone"
                  helperText={
                    getIn(formik.touched, "phone") &&
                    getIn(formik.errors, "phone")
                  }
                  error={
                    getIn(formik.touched, "phone") &&
                    Boolean(getIn(formik.errors, "phone"))
                  }
                  onChange={formik.handleChange}
                  value={formik.values.phone}
                  className="flex-1"
                ></TextField>
              </div>
            </div>
            <div className="flex gap-4">
              <div className="flex-1">
                <Select
                  title="User role *"
                  options={rolesArray}
                  fullWidth={true}
                  placeholder="Select user role"
                  position="top"
                  name="adminRole"
                  id="adminRole"
                  error={
                    getIn(formik.touched, "adminRole") &&
                    Boolean(getIn(formik.errors, "adminRole"))
                  }
                  helperText={
                    getIn(formik.touched, "adminRole") &&
                    getIn(formik.errors, "adminRole")
                  }
                  onSelectItem={(item) =>
                    formik.setFieldValue("adminRole", item.value)
                  }
                />
              </div>
              <div className="flex-1"></div>
            </div>
          </div>
          <div className="flex justify-end py-3 px-4">
            <Button color="primary" type="submit" endIcon={<AddIcon />}>
              Save
            </Button>
          </div>
        </Form>
      )}
    </Formik>
  );
};

export default AddSystemUser;
