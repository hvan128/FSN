import { FontFamily, FontSize } from "@/enum/setting";
import Button from "@/lib/button";
import TextField from "@/lib/text-field";
import Typography from "@/lib/typography";
import UpdateIcon from "@mui/icons-material/Update";
import { useMemo} from "react";
import { Form, Formik, getIn } from "formik";
import * as yup from "yup";
import { closeLoading, openLoading } from "@/redux/slice/loadingSlice";
import { useDispatch } from "react-redux";
import { openAlert } from "@/redux/slice/alertSlice";
import { validateAppVersion, validateLink } from "@/utils/regex";
import SwitchButton from "@/lib/switch-button";
import { CONFIRM_UPDATE_VERSION } from "@/redux/actions/action";
import { openConfirm } from "@/redux/slice/confirmSlice";
import Skeleton from "@/lib/skeleton";

const validationSchema = yup.object({
  version: yup
    .string()
    // @ts-ignore
    .matches(validateAppVersion(), "App version is not correct format!")
    .required("Please enter your app version"),
  iosLink: yup
    .string()
    // @ts-ignore
    .matches(validateLink(), "Invalid link format!")
    .required("Please enter your ios link"),
  androidLink: yup
    .string()
    // @ts-ignore
    .matches(validateLink(), "Invalid link format!")
    .required("Please enter your android link"),
  message: yup
    .string()
    .required("Please enter your message!")
    .max(255, "Maximum length is 255 characters"),
});

export default function Update() {
  
  const dispatch = useDispatch();

  type DataProps = {
    version: string;
    iosLink: string;
    androidLink: string;
    require: boolean;
    message: string;
  };
  const appUpdateData: DataProps | undefined = {
    version: "",
    iosLink: "",
    androidLink: "",
    require: true,
    message: "",
  };

  const initialValues = useMemo(() => {
    return {
      version: appUpdateData?.version ?? "",
      iosLink: appUpdateData?.iosLink ?? "",
      androidLink: appUpdateData?.iosLink ?? "",
      require: appUpdateData?.require ?? true,
      message: appUpdateData?.message ?? "",
    };
  }, [appUpdateData]);

  const onSubmit = (values: DataProps, formik: any) => {

    const messageUpdate = `The app will be updated with the release version ${values.version}. Please click to confirm.`

    const confirm: any = {
      isOpen: true,
      title: "CONFIRM TO DO NEXT STEP",
      message: messageUpdate,
      feature: CONFIRM_UPDATE_VERSION,
      onConfirm: async () => {
        try {
          dispatch(openLoading());
          const variables: any = {
            updateAppUpdate: values,
          };
          // await updateAppUpdate({ variables });
          formik.resetForm({ values });
          let alert: AlertState = {
            isOpen: true,
            title: "CONFIGURATE APP UPDATE",
            message: "App update is activated",
            type: "success",
          };
          dispatch(openAlert(alert));
        } catch (error: any) {    
        } finally {
          dispatch(closeLoading());
        }
      },
    };
    dispatch(openConfirm(confirm));
  };

  return (
    <Skeleton loading={false}>
      <div className="px-4 border-grey-c300 rounded-2xl shadow-md w-12/12 lg:w-8/12 xl:w-6/12">
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
                  {/* {App Version} */}
                  <div className="flex flex-col py-2">
                    <TextField
                      label="App version"
                      name="version"
                      value={formik.values.version}
                      placeholder="Enter version"
                      error={
                        getIn(formik.touched, "version") &&
                        Boolean(getIn(formik.errors, "version"))
                      }
                      helperText={
                        getIn(formik.touched, "version") &&
                        getIn(formik.errors, "version")
                      }
                      onChange={formik.handleChange}
                    ></TextField>
                  </div>
                  {/* {IOS link} */}
                  <div className="flex flex-col py-2">
                    <TextField
                      label="Ios Link"
                      value={formik.values.iosLink}
                      name="iosLink"
                      placeholder="Enter ios link"
                      error={
                        getIn(formik.touched, "iosLink") &&
                        Boolean(getIn(formik.errors, "iosLink"))
                      }
                      helperText={
                        getIn(formik.touched, "iosLink") &&
                        getIn(formik.errors, "iosLink")
                      }
                      onChange={formik.handleChange}
                    ></TextField>
                  </div>
                  {/* {Android link} */}
                  <div className="flex flex-col py-2">
                    <TextField
                      label="Android Link"
                      name="androidLink"
                      placeholder="Enter android link"
                      value={formik.values.androidLink}
                      error={
                        getIn(formik.touched, "androidLink") &&
                        Boolean(getIn(formik.errors, "androidLink"))
                      }
                      helperText={
                        getIn(formik.touched, "androidLink") &&
                        getIn(formik.errors, "androidLink")
                      }
                      onChange={formik.handleChange}
                    ></TextField>
                  </div>
                  {/* {Select maintaince option} */}
                  <div className="flex flex-row gap-4 py-2">
                    <div className="flex-1 px-4">
                      <Typography
                        fontSize={FontSize.BASE}
                        fontFamily={FontFamily.BOLD}
                      >
                        Required{" "}
                      </Typography>
                      <SwitchButton
                        name="require"
                        checked={formik.values.require}
                        handleClickSwitchButton={() => {
                          formik.setFieldValue(
                            "require",
                            !formik.values.require
                          );
                        }}
                      />
                    </div>
                    <div className="flex-1 px-4"></div>
                  </div>
                  {/* {Message} */}
                  <div className="flex flex-col">
                    <TextField
                      multiline
                      rows={4}
                      label="Message"
                      value={formik.values.message}
                      onChange={formik.handleChange}
                      name="message"
                      placeholder="Enter your message"
                      error={
                        getIn(formik.touched, "message") &&
                        Boolean(getIn(formik.errors, "message"))
                      }
                      helperText={
                        getIn(formik.touched, "message") &&
                        getIn(formik.errors, "message")
                      }
                    ></TextField>
                  </div>
                  {/* {Button} */}
                  <div className="flex flex-row-reverse py-2">
                    <Button
                      endIcon={<UpdateIcon></UpdateIcon>}
                      type="submit"
                      onSubmit={() => {
                        onSubmit(formik.values, formik);
                      }}
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
