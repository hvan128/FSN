import { FontFamily, FontSize, TextColor } from "@/enum/setting";
import Button from "@/lib/button";
import DatePicker from "@/lib/datePicker";
import Skeleton from "@/lib/skeleton";
import TextField from "@/lib/text-field";
import Typography from "@/lib/typography";
import { CONFIRM_OTHERS_UPDATE } from "@/redux/actions/action";
import { openAlert } from "@/redux/slice/alertSlice";
import { openConfirm } from "@/redux/slice/confirmSlice";
import { closeLoading, openLoading } from "@/redux/slice/loadingSlice";
import UpdateIcon from "@mui/icons-material/Update";
import { Form, Formik, getIn } from "formik";
import moment from "moment";
import { useMemo } from "react";
import { useDispatch } from "react-redux";
import * as yup from "yup";

const validationSchema = yup.object({
  chargeFee: yup
    .number()
    .typeError("Please, enter only number")
    .integer("Must be an integer number")
    .positive("Must be more than 0")
    .required("Please enter your month for e-Statement charge fee"),
  facialMatch: yup
    .number()
    .typeError("Please, enter only number")
    .positive("Must be more than 0")
    .required("Please enter your facial match percent")
    .lessThan(101, "Should be from 0 to 100"),

  livenessMatch: yup
    .number()
    .typeError("Please, enter only number")
    .positive("Must be more than 0")
    .required("Please enter your liveness match percent")
    .lessThan(101, "Should be from 0 to 100"),
  dateFrom: yup
    .date()
    .typeError("Date is invalid")
    .required("Date is empty!")
    .max(yup.ref("dateTo"), "Start date must be earlier end date"),
  dateTo: yup
    .date()
    .typeError("Date is invalid")
    .required("Date is empty!")
    .min(yup.ref("dateFrom"), "End date must be later start date"),
});

export default function Others() {

  const dispatch = useDispatch();
  const othersSettingData = useMemo(() =>  [], []);

  type DataProps = {
    chargeFee: string;
    facialMatch: string;
    livenessMatch: string;
    dateTo: any;
    dateFrom: any;
  };

  const initialValues = useMemo(() => {
    let initialState: DataProps = {
      chargeFee: "",
      facialMatch: "",
      livenessMatch: "",
      dateTo: new Date(),
      dateFrom: new Date(),
    };

    // othersSettingData?.forEach((el: any) => {
    //   if (el.settingCode === otherSettingCodes.fee) {
    //     initialState = { ...initialState, chargeFee: el.settingValue };
    //   }
    //   if (el.settingCode === otherSettingCodes.facial) {
    //     initialState.facialMatch = el.settingValue;
    //   }
    //   if (el.settingCode === otherSettingCodes.liveness) {
    //     initialState.livenessMatch = el.settingValue;
    //   }
    //   if (el.settingCode === otherSettingCodes.migrationFrom) {
    //     initialState.dateFrom = moment(el.settingValue);
    //   }
    //   if (el.settingCode === otherSettingCodes.migrationTo) {
    //     initialState.dateTo = moment(el.settingValue);
    //   }
    // });
    return initialState;
  }, [othersSettingData]);



  const onSubmit = (values: DataProps, formik: any) => {
    const confirm: any = {
      isOpen: true,
      title: "CONFIRM TO DO NEXT STEP",
      message: "Do you want to change others configruration?",
      feature: CONFIRM_OTHERS_UPDATE,
      onConfirm: async () => {
        try {
          dispatch(openLoading());
          const parseData = othersSettingData.map((el: any) => {
            let data: any = { id: "", settingValue: "" };

            // if (el.settingCode === otherSettingCodes.fee) {
            //   data.id = Number(el.id);
            //   data.settingValue = values.chargeFee;
            // }
            // if (el.settingCode === otherSettingCodes.facial) {
            //   data.id = Number(el.id);
            //   data.settingValue = values.facialMatch;
            // }
            // if (el.settingCode === otherSettingCodes.liveness) {
            //   data.id = Number(el.id);
            //   data.settingValue = values.livenessMatch;
            // }
            // if (el.settingCode === otherSettingCodes.migrationFrom) {
            //   data.id = Number(el.id);
            //   data.settingValue = moment(values.dateFrom).utc().toISOString();
            // }
            // if (el.settingCode === otherSettingCodes.migrationTo) {
            //   data.id = Number(el.id);
            //   data.settingValue = moment(values.dateTo).utc().toISOString();
            // }
            return data;
          });
          const variables = {
            dto: parseData,
          };
          // await updateOtherSetting({ variables });

          let alert: AlertState = {
            isOpen: true,
            title: "UPDATE OTHERS SETTING",
            message: "Update others setting success!",
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

  return (
    <Skeleton loading={false}>
      <div className="px-4 border-grey-c300 rounded-2xl shadow-md w-12/12 lg:w-6/12 md:8/12">
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
                  {/* {Month for e-Statement charge fee} */}
                  <div className="flex flex-col py-2">
                    <TextField
                      inputProps={{ endAdornment: "months" }}
                      label="Month for e-Statement charge fee"
                      name="chargeFee"
                      id="chargeFee"
                      placeholder="Enter your number"
                      value={formik.values.chargeFee}
                      onChange={formik.handleChange}
                      error={
                        getIn(formik.touched, "chargeFee") &&
                        Boolean(getIn(formik.errors, "chargeFee"))
                      }
                      helperText={
                        getIn(formik.touched, "chargeFee") &&
                        getIn(formik.errors, "chargeFee")
                      }
                    ></TextField>
                  </div>
                  {/* {Facial match percent} */}
                  <div className="flex flex-col py-2">
                    <TextField
                      inputProps={{ endAdornment: "%" }}
                      label="Facial match percent"
                      name="facialMatch"
                      id="facialMatch"
                      placeholder="Enter your number"
                      value={formik.values.facialMatch}
                      onChange={formik.handleChange}
                      error={
                        getIn(formik.touched, "facialMatch") &&
                        Boolean(getIn(formik.errors, "facialMatch"))
                      }
                      helperText={
                        getIn(formik.touched, "facialMatch") &&
                        getIn(formik.errors, "facialMatch")
                      }
                    ></TextField>
                  </div>
                  {/* {Liveness match percent} */}
                  <div className="flex flex-col py-2">
                    <TextField
                      inputProps={{ endAdornment: "%" }}
                      label="Liveness match percent"
                      name="livenessMatch"
                      id="livenessMatch"
                      placeholder="Enter your number"
                      value={formik.values.livenessMatch}
                      onChange={formik.handleChange}
                      error={
                        getIn(formik.touched, "livenessMatch") &&
                        Boolean(getIn(formik.errors, "livenessMatch"))
                      }
                      helperText={
                        getIn(formik.touched, "livenessMatch") &&
                        getIn(formik.errors, "livenessMatch")
                      }
                    ></TextField>
                  </div>
                  {/* {Select migration date} */}
                  <Typography fontFamily={FontFamily.BOLD} fontSize={FontSize.BASE} textColor={TextColor.PRIMARY_700} className={'px-2'}>Migration time for ETB:</Typography>
                  <div className="flex flex-row flex-wrap gap-4 py-2">
                    <div className="basis-1 grow">
                      <DatePicker
                        id="dateFrom"
                        title="From"
                        selected={formik.values.dateFrom}
                        onSelectItem={(newValue) => {
                          formik.setFieldValue("dateFrom", newValue);
                        }}
                        error={
                          getIn(formik.touched, "dateFrom") &&
                          Boolean(getIn(formik.errors, "dateFrom"))
                        }
                        helperText={
                          getIn(formik.touched, "dateFrom") &&
                          getIn(formik.errors, "dateFrom")
                        }
                      />
                    </div>
                    <div className="basis-1 grow">
                      <DatePicker
                        id="dateTo"
                        title="To"
                        selected={formik.values.dateTo}
                        onSelectItem={(newValue) => {
                          formik.setFieldValue("dateTo", newValue);
                        }}
                        error={
                          getIn(formik.touched, "dateTo") &&
                          Boolean(getIn(formik.errors, "dateTo"))
                        }
                        helperText={
                          getIn(formik.touched, "dateTo") &&
                          getIn(formik.errors, "dateTo")
                        }
                      />
                    </div>
                  </div>
                  {/* {Button} */}
                  <div className="flex flex-row-reverse">
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
