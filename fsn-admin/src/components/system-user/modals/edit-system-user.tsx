import { ROLES } from "@/enum/constants";
import Button from "@/lib/button";
import Select, { Item } from "@/lib/select";
import TextField from "@/lib/text-field";
import React from "react";
import { closeModal } from "@/redux/slice/modalSlice";
import { useDispatch } from "react-redux";
import { Form, Formik, getIn } from "formik";
import * as yup from "yup";
import { closeLoading, openLoading } from "@/redux/slice/loadingSlice";
import { openAlert } from "@/redux/slice/alertSlice";
import SaveIcon from '@mui/icons-material/Save';
import { validateNoNumNoSCharacter, validatePhoneBhutan } from "@/utils/regex";

export type SystemUserProp = {
  id: string;
  fullName: string;
  username: string;
  email: string;
  phone: string;
  adminRole: string;
  status: string;
  refetch: () => void;
};
const EditSystemUser = (props: SystemUserProp) => {
  // const [updateUserAdmin] =
  //   useMutation(UPDATE_USER_ADMIN);
  // const rolesArray: Item[] = Object.values(ROLES).map((role) => ({
  //   value: role.CODE,
  //   label: role.NAME,
  // }));

  const dispatch = useDispatch();

  const handleUpdate = async (values: any) => {
    try {
      dispatch(openLoading());
      const variables = {
        updateUserAdminId: Number(props.id),
        updateUserAdminDto: {
          fullName: values.fullName,
          email: values.email,
          phone: `975${values.phone}`,
        },
      };
      // await updateUserAdmin({ variables });
      dispatch(closeModal());
      let alert: AlertState = {
        isOpen: true,
        title: "UPDATE SYSTEM USER",
        message: `You've successfully updated the system user account`,
        type: "success",
      };
      dispatch(openAlert(alert));
      props.refetch();
    } catch (mutationError: any) {
    } finally {
      dispatch(closeLoading());
      dispatch(closeModal());
    }
  };

  const validationSchema = yup.object({
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
      .matches(validatePhoneBhutan(), "Invalid phone number format!")
      .required("Please enter phone number"),
  });

  return (
    <Formik
      initialValues={{
        fullName: props.fullName,
        email: props.email,
        phone: props.phone ? props.phone.split("975")[1] : "",
      }}
      validationSchema={validationSchema}
      onSubmit={(values) => handleUpdate(values)}
      enableReinitialize
    >
      {(formik) => (
        <Form>
          <div className="flex flex-col gap-4 px-3 py-4 sm:p-4 border-b-2 border-b-grey-c100">
            <div className="flex gap-4">
              <div className="flex-1">
                <TextField
                  label="Username *"
                  name="username"
                  id="username"
                  value={props.username}
                  className="flex-1"
                  disabled
                ></TextField>
              </div>
              <div className="flex-1">
                <TextField
                  label="Name *"
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
                  inputProps={{
                    startAdornment:
                      <div className="text-primary-c900" >+975</div>
                  }}
                ></TextField>
              </div>
            </div>
            <div className="flex gap-4">
              <div className="flex-1">
                {/* <Select
                  title="User role *"
                  options={rolesArray}
                  selected={
                    rolesArray.find((item) => item.label === props.adminRole)?.value
                  }
                  fullWidth={true}
                  position="top"
                  name="adminRole"
                  id="adminRole"
                  disabled
                /> */}
              </div>
              <div className="flex-1"></div>
            </div>
          </div>
          <div className="flex justify-end py-3 px-4">
            <Button color="primary" type="submit" endIcon={<SaveIcon />}>
              Save
            </Button>
          </div>
        </Form>
      )}
    </Formik>
  );
};

export default EditSystemUser;
