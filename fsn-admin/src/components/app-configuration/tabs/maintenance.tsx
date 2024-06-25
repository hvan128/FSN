import { FontFamily, FontSize, TextColor } from "@/enum/setting";
import Button from "@/lib/button";
import DatePicker from "@/lib/datePicker";
import Skeleton from "@/lib/skeleton";
import SwitchButton from "@/lib/switch-button";
import TextField from "@/lib/text-field";
import Typography from "@/lib/typography";
import { CONFIRM_APP_MAINTENANCE } from "@/redux/actions/action";
import { openAlert } from "@/redux/slice/alertSlice";
import { openConfirm } from "@/redux/slice/confirmSlice";
import { closeLoading, openLoading } from "@/redux/slice/loadingSlice";
import UpdateIcon from "@mui/icons-material/Update";
import { Form, Formik, getIn } from "formik";
import moment from "moment";
import { useMemo} from "react";
import { useDispatch } from "react-redux";
import * as yup from "yup";

const validationSchema = yup.object({
  message: yup
    .string()
    .required("Please enter your message")
    .max(255, "Maximum length is 255 characters"),
  from: yup
    .date()
    .typeError("Date is invalid")
    .required("Date is empty!")
    .max(yup.ref("to"), "Start date must be earlier end date"),
  to: yup
    .date()
    .typeError("Date is invalid")
    .required("Date is empty!")
    .min(yup.ref("from"), "End date must be later start date"),
});

export default function Maintenance() {
  const dispatch = useDispatch();

  type DataProps = {
    internetBanking: boolean;
    mobileApp: boolean;
    from: any;
    to: any;
    message: string;
  };
  const appMainteanceData: DataProps | undefined = {
    internetBanking: true,
    mobileApp: true,
    from: new Date(),
    to: new Date(),
    message: "",  
  };
  const initialValues = useMemo(() => {
    return {
      internetBanking: appMainteanceData?.internetBanking ?? true,
      mobileApp: appMainteanceData?.mobileApp ?? true,
      from: appMainteanceData?.from ?? new Date(),
      to: appMainteanceData?.to ?? new Date(),
      message: appMainteanceData?.message ?? "",
    };
  }, [appMainteanceData]);



  // !Function
  const onSubmit = (values: any, formik: any) => {
    const isAppMaintenanceActive = values.internetBanking && values.mobileApp;
    const maintenanceMessage = isAppMaintenanceActive
      ? 'Customers will not be able to access the App. Do you want to proceed?'
      : 'Customers will now be able to access their app. Do you wish to proceed?';

    const maintenanceTitle = isAppMaintenanceActive
      ? 'Turn on app maintenance'
      : 'Turn off app maintenance';

    const confirm: any = {
      isOpen: true,
      title: maintenanceTitle,
      message: maintenanceMessage,
      feature: CONFIRM_APP_MAINTENANCE,
      onConfirm: async () => {
        try {
          dispatch(openLoading());
          const variables: any = {
            updateAppMaintenanceDto: {
              ...values,
              from: moment(values?.from).toISOString(),
              to: moment(values?.to).toISOString(),
            },
          };
          // await updateAppMaintenance({ variables });
          let alert: AlertState = {
            isOpen: true,
            title: "UPDATE APP MAINTENANCE",
            message: "App maintenance is updated",
            type: "success",
          };
          dispatch(openAlert(alert));
          formik.resetForm({ values });
        } catch (mutationError: any) {
            } finally {
          dispatch(closeLoading());
        }
      },
    };
    dispatch(openConfirm(confirm));
  };

  // if (error) return <div>Error!</div>;

  return (
    <Skeleton loading={false}>
      <div className="w-12/12 lg:w-8/12 xl:w-6/12 px-4 border-grey-c300 rounded-2xl shadow-md">
        <Formik
          initialValues={initialValues}
          validationSchema={validationSchema}
          onSubmit={onSubmit}
          enableReinitialize
        >
          {(formik) => {
              return (
              <Form>
                <div className="justify-center items-center px-4 py-4">
                  {/* {Select maintaince option} */}
                  <div className="flex flex-row gap-4 py-2">
                    <div className="flex-1 px-4">
                      <Typography
                        fontSize={FontSize.BASE}
                        fontFamily={FontFamily.BOLD}
                      >
                        Maintaince
                      </Typography>
                    </div>
                  </div>
                
                  {/* {Select maintaince date} */}
                  <div className="flex flex-row flex-wrap gap-4 py-2">
                    <div className="basis-5/12 grow">
                      <DatePicker
                        id="from"
                        title="From"
                        selected={formik.values.from}
                        onSelectItem={(newValue) => {
                          formik.setFieldValue("from", newValue);
                        }}
                        error={
                          getIn(formik.touched, "from") &&
                          Boolean(getIn(formik.errors, "from"))
                        }
                        helperText={
                          getIn(formik.touched, "from") &&
                          getIn(formik.errors, "from")
                        }
                      />
                    </div>
                    <div className="basis-5/12 grow">
                      <DatePicker
                        id="to"
                        title="To"
                        selected={formik.values.to}
                        onSelectItem={(newValue) => {
                          formik.setFieldValue("to", newValue);
                        }}
                        error={
                          getIn(formik.touched, "to") &&
                          Boolean(getIn(formik.errors, "to"))
                        }
                        helperText={
                          getIn(formik.touched, "to") &&
                          getIn(formik.errors, "to")
                        }
                      />
                    </div>
                  </div>
                  {/* {Message} */}
                  <div className="flex flex-col py-2">
                    <TextField
                      multiline
                      rows={4}
                      label="Message"
                      name="message"
                      placeholder="Enter your message"
                      value={formik.values.message}
                      error={
                        getIn(formik.touched, "message") &&
                        Boolean(getIn(formik.errors, "message"))
                      }
                      helperText={
                        getIn(formik.touched, "message") &&
                        getIn(formik.errors, "message")
                      }
                      onChange={formik.handleChange}
                    ></TextField>
                  </div>
                  {/* {Button} */}
                  <div className="flex flex-row-reverse py-2">
                    <Button
                      endIcon={<UpdateIcon></UpdateIcon>}
                      type="submit"
                      disabled={!formik.dirty}
                    >
                      Update
                    </Button>
                  </div>
                </div>
              </Form>
            );
          }}
        </Formik>
      </div>
    </Skeleton>
  );
}
