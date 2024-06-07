import { ListProductName } from "@/enum/constants";
import { COUNTRIES } from "@/enum/countries";
import {  TextColor } from "@/enum/setting";
import Button from "@/lib/button";
import Select from "@/lib/select";
import TextField from "@/lib/text-field";
import Typography from "@/lib/typography";
import { validatePhone, validatePhoneBhutan } from "@/utils/regex";
import SaveIcon from '@mui/icons-material/Save';
import React, {  useMemo } from "react";
import * as yup from "yup";
import { Form, Formik, getIn } from "formik";
import { WhiteListRecordProp } from "./view-whitelist-record";
import { removeCountryCode } from "@/utils/function";
import DatePicker from "@/lib/datePicker";
import { useMutation } from "@apollo/client";
import { UPDATE_WHITE_LIST_MAKER } from "@/services/white-list";
import moment from "moment";
import { useDispatch } from "react-redux";
import { openAlert } from "@/redux/slice/alertSlice";
import { closeModal } from "@/redux/slice/modalSlice";

const validationSchema = yup.object({
  country: yup
    .object({
      label: yup.string(),
      mobileCode: yup.string(),
      value: yup.string(),
    })
    .nullable()
    .required("Please select your country"),
  phone: yup
    .string()
    .when("country.label", {
      is: "Bhutan",
      then: (schema) =>
        schema.matches(validatePhoneBhutan(), "Invalid phone format!"),
      otherwise: (schema) =>
        schema.matches(validatePhone(), "Invalid phone format!"),
    })
    .required("Please enter your phone"),
  dob: yup.date().required("Please enter your date of birth"),
  productType: yup.string().required("Please enter your product"),
});
const UpdateWhiteListRecord = ({
  props,
  refetch,
}: {
  props: WhiteListRecordProp;
  refetch: () => void;
}) => {
  const dispatch = useDispatch();
  const initialValues = useMemo(() => {
    const country = COUNTRIES.find(
      (country) => country.value === props.countryCode
    );
    return {
      country: country ?? null,
      phone:
        removeCountryCode(props.phone, country?.mobileCode as string) ?? "",
      productType: props.productType ?? null,
      dob: props.dob ?? null,
      prefix: country?.mobileCode ?? "",
    };
  }, [props]);

  const [updateWhiteListMaker, { error }] = useMutation(UPDATE_WHITE_LIST_MAKER);

  const onSubmit = async ({ prefix, country, ...values }: any) => {
    const selectedCountry = COUNTRIES.find(
      (item) => item.value === country.value
    )
    try {
      const variables = {
        updateWhiteListId: Number(props.id),
        updateWhitelistDto: {
          ...values,
          countryCode: selectedCountry?.value,
          phone: `${selectedCountry?.mobileCode}${values.phone}`,
          dob: moment(values.dob).format('YYYY-MM-DD'),
        },
      };
      dispatch(closeModal());
      await updateWhiteListMaker({ variables });      
      dispatch(
        openAlert({
          isOpen: true,
          title: 'UPDATE WHITELIST',
          message: 'Updated whitelist record for approval successfully.',
          type: 'success',
        })
      );
      refetch();
    } catch (error: any) {   
    }
  };
  return (
    <Formik
      initialValues={initialValues}
      validationSchema={validationSchema}
      onSubmit={onSubmit}
    >
      {(formik) => (
        <Form>
          <div>
            {/* Content */}
            <div className="bg-white flex flex-col gap-4 px-3 py-4 sm:p-4 border-b-2 border-b-grey-c100">
              <div className="flex-1">
                <Select
                  name="country"
                  id="country"
                  title="Country * :"
                  options={COUNTRIES}
                  placeholder="Select country"
                  selected={
                    COUNTRIES.find(
                      (country) => country.value === props.countryCode
                    )?.value
                  }
                  fullWidth={true}
                  position="bottom"
                  onSelectItem={(item) => {
                    if (item) {
                      formik.setFieldValue("country", item);
                      formik.setFieldValue(
                        "prefix",
                        COUNTRIES.find(
                          (country) => country.value === item?.value
                        )?.mobileCode
                      );
                    } else {
                      formik.setFieldValue("country", null);
                      formik.setFieldValue("prefix", "");
                    }
                  }}
                  error={
                    getIn(formik.touched, "country") &&
                    Boolean(getIn(formik.errors, "country"))
                  }
                  helperText={
                    getIn(formik.touched, "country") &&
                    getIn(formik.errors, "country")
                  }
                />
              </div>
              <div className="flex-1">
                      <TextField
                        name="phone"
                        label="Mobile number * :"
                        value={formik.values.phone}
                        placeholder="Enter your mobile number"
                        onChange={formik.handleChange}
                        error={
                          getIn(formik.touched, "phone") &&
                          Boolean(getIn(formik.errors, "phone"))
                        }
                        helperText={
                          getIn(formik.touched, "phone") &&
                          getIn(formik.errors, "phone")
                        }
                        inputProps={{
                          startAdornment: formik.values?.prefix && (
                            <Typography textColor={TextColor.PRIMARY_700}>
                              {`+${formik.values.prefix}`}
                            </Typography>
                          ),
                        }}
                        fullWidth={true}
                      />
                    </div>
              <div className="flex-1">
                <DatePicker
                  name="dob"
                  position="center"
                  title="Date of birth * :"
                  selectTime={false}
                  placeholder="dd/mm/yyyy"
                  selected={formik.values.dob !== null ? new Date(formik.values.dob) : null}
                  onSelectItem={(date) => {
                    formik.setFieldValue("dob", date);
                  }}
                  error={
                    getIn(formik.touched, "dob") &&
                    Boolean(getIn(formik.errors, "dob"))
                  }
                  helperText={
                    getIn(formik.touched, "dob") && getIn(formik.errors, "dob")
                  }
                />
              </div>
              <div className="flex-1">
                <Select
                  name="productType"
                  title="Product name * :"
                  placeholder="Select product name"
                  options={ListProductName}
                  selected={formik.values.productType}
                  fullWidth={true}
                  disabled
                />
              </div>
            </div>
            {/* Footer */}
            <div className="flex justify-end px-2 py-4">
              <Button
                color="primary"
                endIcon={<SaveIcon></SaveIcon>}
                type="submit"
              >
                Update
              </Button>
            </div>
          </div>
        </Form>
      )}
    </Formik>
  );
};

export default UpdateWhiteListRecord;
