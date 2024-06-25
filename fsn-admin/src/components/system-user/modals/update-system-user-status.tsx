import Button from "@/lib/button";
import Select from "@/lib/select";
import React from "react";
import { closeModal } from "@/redux/slice/modalSlice";
import { useDispatch } from "react-redux";
import { Form, Formik, getIn } from "formik";
import * as yup from "yup";
import { closeLoading, openLoading } from "@/redux/slice/loadingSlice";
import { openAlert } from "@/redux/slice/alertSlice";
import Typography from "@/lib/typography";
import { TextColor } from "@/enum/setting";
import SaveIcon from '@mui/icons-material/Save';

const UpdateSystemUserStatus = ({ id, status, refetch }: { id: number, status: string, refetch: () => void }) => {
  // const [updateUserAdmin] =
  // useMutation(UPDATE_USER_ADMIN);
  const dispatch = useDispatch();
  const handleUpdateStatus = async (values: any) => {
    try {
      dispatch(openLoading());
      const variables = {
        updateUserAdminId: Number(id),
        updateUserAdminDto: {
          status: values.status,
        },
      };
      // await updateUserAdmin({ variables });
      dispatch(closeModal());
      let alert: AlertState = {
        isOpen: true,
        title: "UPDATE SYSTEM USER STATUS",
        message: `Update system user status success!`,
        type: "success",
      };
      dispatch(openAlert(alert));
      refetch();
    } catch (mutationError: any) {
    } finally {
      dispatch(closeLoading());
      dispatch(closeModal());
        }
  };

  const validationSchema = yup.object({
    status: yup
      .string()
      .required('Select status for system user'),
  });

  return (
    <Formik
      initialValues={{
        status: status,
      }}
      validationSchema={validationSchema}
      onSubmit={handleUpdateStatus}
      enableReinitialize
    >
      {(formik) => (
        <Form>
          <div className="flex flex-col gap-4 px-3 py-4 sm:p-4 border-b-2 border-b-grey-c100">
              <div className="flex-1">
                {/* <Select
                  title="User status *"
                  options={ListStatus.map((item) => ({
                    label: <Typography className={item.value === 'ACTIVE' ? `${TextColor.SUCCESS_900}` : `${TextColor.SUPPORT_900}`}>{item.label}</Typography>,
                    value: item.value,
                  }))}
                  selected={ListStatus.find((item) => item.value === formik.values.status)?.value}
                  fullWidth={true}
                  position="bottom"
                  name="status"
                  id="status"
                  error={
                    getIn(formik.touched, "status") &&
                    Boolean(getIn(formik.errors, "status"))
                  }
                  helperText={
                    getIn(formik.touched, "status") &&
                    getIn(formik.errors, "status")
                  }
                  onSelectItem={(item) =>
                    formik.setFieldValue("status", item.value)
                  }
                /> */}
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

export default UpdateSystemUserStatus;
