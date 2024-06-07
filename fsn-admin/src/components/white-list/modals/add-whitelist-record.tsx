import {  TextColor } from "@/enum/setting";
import Button from "@/lib/button";
import TextField from "@/lib/text-field";
import Typography from "@/lib/typography";
import React, { useMemo } from "react";
import AddIcon from "@mui/icons-material/Add";
import Select from "@/lib/select";
import { COUNTRIES } from "@/enum/countries";
import { ListGender, ListProductName, productStatus } from "@/enum/constants";
import * as yup from "yup";
import { useDispatch } from "react-redux";
import { Form, Formik, getIn } from "formik";
import {
  validateCidNumber,
  validatePhone,
  validatePhoneBhutan,
} from "@/utils/regex";
import DatePicker from "@/lib/datePicker";
import moment from "moment";
import { CREATE_WHITE_LIST } from "@/services/white-list";
import { useMutation } from "@apollo/client";
import { openAlert } from "@/redux/slice/alertSlice";
import { closeModal } from "@/redux/slice/modalSlice";
import { openConfirm } from "@/redux/slice/confirmSlice";
import { CREATE_WHITELIST_RECORD } from "@/redux/actions/action";
import { refetchComponent } from "@/redux/slice/refetchSlice";
import MonthPicker from "@/lib/monthPicker";

const validationSchema = yup.object({
  productType: yup.string().required("Product is empty!"),
  cid: yup
    .string()
    .matches(validateCidNumber(), "CID/ID includes only letters or numbers")
    .required("Please enter your CID/ID"),
  fullName: yup.string().required("Please enter your full name"),
  referenceId: yup.string().required("Please enter your Reference ID"),
  instituteName: yup.string().when("productType", {
    is: "LOAN",
    then: (schema) => schema.required("Please enter your institute name"),
    otherwise: (schema) => schema,
  }),
  approvedLoanAmount: yup
    .number()
    .typeError("Amount must be number!")
    .when(["productType"], {
      is: "LOAN",
      then: (schema) => schema.required("Please enter your Loan Amount"),
      otherwise: (schema) => schema,
    }),
  courseName: yup.string().when("productType", {
    is: "LOAN",
    then: (schema) => schema.required("Please enter your course"),
    otherwise: (schema) => schema,
  }),
  yearOfCompletion: yup
    .date()
    .typeError("Invalid year format!")
    .when("productType", {
      is: "LOAN",
      then: (schema) => schema.required("Please enter your year of completion"),
      otherwise: (schema) => schema,
    }),
  dob: yup
    .date()
    .typeError("Date is invalid format!")
    .when("productType", {
      is: "LCY",
      then: (schema) => schema.required("Please enter your date of birth"),
      otherwise: (schema) => schema,
    }),
  countryCode: yup
    .string()
    .nullable()
    .when("productType", {
      is: "LCY",
      then: (schema) => schema.required("Please select country"),
      otherwise: (schema) => schema,
    }),
  email: yup
    .string()
    .email()
    .when("productType", {
      is: "LCY",
      then: (schema) => schema.required("Please enter your email"),
      otherwise: (schema) => schema,
    }),
  gender: yup.string().when("productType", {
    is: "LCY",
    then: (schema) => schema.required("Please select your sex"),
    otherwise: (schema) => schema,
  }),
  phone: yup.string().when("productType", {
    is: "LCY",
    then: (schema) =>
      schema
        .when("countryCode", {
          is: "BTN",
          then: (schema) =>
            schema.matches(validatePhoneBhutan(), "Invalid phone format!"),
          otherwise: (schema) =>
            schema.matches(validatePhone(), "Invalid phone format!"),
        })
        .required("Please enter your phone number"),
    otherwise: (schema) => schema,
  }),
});

const AddWhiteListRecord = () => {
  const dispatch = useDispatch();
  const initialValues = useMemo(() => {
    return {
      fullName: "",
      countryCode: null,
      phone: "",
      dob: "",
      productType: "LCY",
      gender: "Male",
      email: "",
      instituteName: "",
      referenceId: "",
      courseName: "",
      approvedLoanAmount: "",
      cid: "",
      yearOfCompletion: "",
      status: productStatus.IN_PROGRESS,
      prefix: "",
    };
  }, []);

  const [createWhiteList] =
    useMutation(CREATE_WHITE_LIST);

  const handleAddWhiteListRecord = async (values: any, { resetForm }: any) => {
    let variables = {};
    if (values.productType === "LCY") {
      variables = {
        createWhiteListDto: {
          fullName: values.fullName,
          countryCode: values.countryCode,
          phone: `${values.prefix}${values.phone}`,
          dob: moment(values.dob).format("YYYY-MM-DD"),
          productType: values.productType,
          gender: values.gender,
          email: values.email,
          referenceId: values.referenceId,
          cid: values.cid,
          status: values.status,
        },
      };
    }
    if (values.productType === "LOAN") {
      variables = {
        createWhiteListDto: {
          fullName: values.fullName,
          productType: values.productType,
          gender: values.gender,
          referenceId: values.referenceId,
          cid: values.cid,
          status: values.status,
          yearOfCompletion: moment(values.yearOfCompletion).format("MM-YYYY"),
          approvedLoanAmount: Number(values.approvedLoanAmount),
          courseName: values.courseName,
          instituteName: values.instituteName,
        },
      };
    }
    try {
      await createWhiteList({ variables });
      dispatch(closeModal());
      dispatch(
        openAlert({
          isOpen: true,
          title: "CREATE WHITELIST",
          message: "The request is forwarded to checker for approval.",
          type: "success",
        })
      );
      resetForm();
      dispatch(refetchComponent());
    } catch (error: any) {    
    }
  };

  const onSubmit = (values: any, { resetForm }: any) => {
    const confirm = {
      isOpen: true,
      title: "CONFIRM CREATE NEW WHITELIST RECORD",
      message: "Are you sure you want to create this record?",
      feature: CREATE_WHITELIST_RECORD,
      onConfirm: () => {
        handleAddWhiteListRecord(values, { resetForm });
      },
    };
    dispatch(openConfirm(confirm));
  };

  return (
    <div>
      <Formik
        initialValues={initialValues}
        validationSchema={validationSchema}
        onSubmit={onSubmit}
      >
        {(formik) => {
          const isLCY = formik.values.productType === "LCY";
          const isLoan = formik.values.productType === "LOAN";
          return (
            <Form>
              {/* Content */}
              <div className="bg-white flex flex-col gap-4 px-3 py-4 sm:p-4 border-b-2 border-b-grey-c100">
                <div className="flex gap-4">
                  <div className="flex-1">
                    <Select
                      name="productType"
                      title="Product name * :"
                      placeholder="Select product name"
                      options={ListProductName}
                      selected={formik.values.productType}
                      fullWidth={true}
                      onSelectItem={(item) => {
                        formik.setFieldValue("productType", item.value);
                      }}
                      error={
                        getIn(formik.touched, "productType") &&
                        Boolean(getIn(formik.errors, "productType"))
                      }
                      helperText={
                        getIn(formik.touched, "productType") &&
                        getIn(formik.errors, "productType")
                      }
                    />
                  </div>
                  <div className="flex-1">
                    <TextField
                      name="referenceId"
                      label="Reference ID * :"
                      placeholder="Enter reference ID"
                      fullWidth={true}
                      value={formik.values.referenceId}
                      error={
                        getIn(formik.touched, "referenceId") &&
                        Boolean(getIn(formik.errors, "referenceId"))
                      }
                      helperText={
                        getIn(formik.touched, "referenceId") &&
                        getIn(formik.errors, "referenceId")
                      }
                      onChange={formik.handleChange}
                    />
                  </div>
                </div>
                <div className="flex gap-4">
                  <div className="flex-1">
                    <TextField
                      name="cid"
                      label="CID/ID number * :"
                      placeholder="Enter CID/ID number"
                      fullWidth={true}
                      value={formik.values.cid ?? ""}
                      onChange={formik.handleChange}
                      error={
                        getIn(formik.touched, "cid") &&
                        Boolean(getIn(formik.errors, "cid"))
                      }
                      helperText={
                        getIn(formik.touched, "cid") &&
                        getIn(formik.errors, "cid")
                      }
                    />
                  </div>
                  <div className="flex-1">
                    <TextField
                      name="fullName"
                      label="Full name * :"
                      placeholder="Enter your full name"
                      fullWidth={true}
                      value={formik.values.fullName}
                      onChange={formik.handleChange}
                      error={
                        getIn(formik.touched, "fullName") &&
                        Boolean(getIn(formik.errors, "fullName"))
                      }
                      helperText={
                        getIn(formik.touched, "fullName") &&
                        getIn(formik.errors, "fullName")
                      }
                    />
                  </div>
                </div>
                <div className="flex gap-4">
                  {!isLoan && (
                    <div className="flex-1">
                      <DatePicker
                        name="dob"
                        position="center"
                        title="Date of birth * :"
                        selectTime={false}
                        placeholder="dd/mm/yyyy"
                        onSelectItem={(date) => {
                          formik.setFieldValue("dob", date);
                        }}
                        error={
                          getIn(formik.touched, "dob") &&
                          Boolean(getIn(formik.errors, "dob"))
                        }
                        helperText={
                          getIn(formik.touched, "dob") &&
                          getIn(formik.errors, "dob")
                        }
                      />
                    </div>
                  )}
                  {!isLoan && (
                    <div className="flex-1">
                      <Select
                        name="gender"
                        id="gender"
                        title="Gender * :"
                        selected={formik.values.gender}
                        placeholder="Select your sex"
                        options={ListGender}
                        fullWidth={true}
                        onSelectItem={(item) => {
                          formik.setFieldValue("gender", item?.value);
                        }}
                        error={
                          getIn(formik.touched, "gender") &&
                          Boolean(getIn(formik.errors, "gender"))
                        }
                        helperText={
                          getIn(formik.touched, "gender") &&
                          getIn(formik.errors, "gender")
                        }
                      />
                    </div>
                  )}
                  {!isLCY && (
                    <div className="flex-1">
                      <TextField
                        name="instituteName"
                        label="Name of the institute * :"
                        placeholder="Enter your name of the institute"
                        value={formik.values.instituteName}
                        onChange={formik.handleChange}
                        error={
                          getIn(formik.touched, "instituteName") &&
                          Boolean(getIn(formik.errors, "instituteName"))
                        }
                        helperText={
                          getIn(formik.touched, "instituteName") &&
                          getIn(formik.errors, "instituteName")
                        }
                      />
                    </div>
                  )}
                  {!isLCY && (
                    <div className="flex-1">
                      <TextField
                        name="courseName"
                        label="Name of the course * :"
                        placeholder="Enter your name of the course"
                        value={formik.values.courseName}
                        onChange={formik.handleChange}
                        error={
                          getIn(formik.touched, "courseName") &&
                          Boolean(getIn(formik.errors, "courseName"))
                        }
                        helperText={
                          getIn(formik.touched, "courseName") &&
                          getIn(formik.errors, "courseName")
                        }
                      />
                    </div>
                  )}
                </div>
                <div className="flex gap-4">
                  {!isLoan && (
                    <div className="flex-1">
                      <Select
                        name="countryCode"
                        id="countryCode"
                        title="Country * :"
                        options={COUNTRIES}
                        placeholder="Select country"
                        fullWidth={true}
                        position="top"
                        onSelectItem={(item) => {
                          if (item) {
                            formik.setFieldValue("countryCode", item?.value);
                            formik.setFieldValue(
                              "prefix",
                              COUNTRIES.find(
                                (country) => country.value === item?.value
                              )?.mobileCode
                            );
                          } else {
                            formik.setFieldValue("countryCode", null);
                            formik.setFieldValue("prefix", "");
                          }
                        }}
                        error={
                          getIn(formik.touched, "countryCode") &&
                          Boolean(getIn(formik.errors, "countryCode"))
                        }
                        helperText={
                          getIn(formik.touched, "countryCode") &&
                          getIn(formik.errors, "countryCode")
                        }
                      />
                    </div>
                  )}
                  {!isLoan && (
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
                  )}
                  {!isLCY && (
                    <div className="flex-1">
                      <MonthPicker
                        name="yearOfCompletion"
                        title="Year of completion *"
                        position="top"
                        placeholder="mm/yyyy"
                        onSelectItem={(date) => {
                          formik.setFieldValue("yearOfCompletion", date);
                        }}
                        error={
                          getIn(formik.touched, "yearOfCompletion") &&
                          Boolean(getIn(formik.errors, "yearOfCompletion"))
                        }
                        helperText={
                          getIn(formik.touched, "yearOfCompletion") &&
                          getIn(formik.errors, "yearOfCompletion")
                        }
                        boxClassName="!min-w-[0px]"
                      />
                    </div>
                  )}
                  {!isLCY && (
                    <div className="flex-1">
                      <TextField
                        name="approvedLoanAmount"
                        label="Approved loan amount * :"
                        placeholder="Enter approved loan amount"
                        value={formik.values.approvedLoanAmount}
                        onChange={formik.handleChange}
                        error={
                          getIn(formik.touched, "approvedLoanAmount") &&
                          Boolean(getIn(formik.errors, "approvedLoanAmount"))
                        }
                        helperText={
                          getIn(formik.touched, "approvedLoanAmount") &&
                          getIn(formik.errors, "approvedLoanAmount")
                        }
                      />
                    </div>
                  )}
                </div>
                {!isLoan && (
                  <div className="flex gap-4">
                    <div className="flex-1">
                      <TextField
                        name="email"
                        label="Email * :"
                        placeholder="Enter your email"
                        fullWidth={true}
                        value={formik.values.email}
                        onChange={(e) => {
                          formik.setFieldValue("email", e.target.value);
                        }}
                        error={
                          getIn(formik.touched, "email") &&
                          Boolean(getIn(formik.errors, "email"))
                        }
                        helperText={
                          getIn(formik.touched, "email") &&
                          getIn(formik.errors, "email")
                        }
                      />
                    </div>
                    <div className="flex-1"></div>
                  </div>
                )}
              </div>
              {/* Footer */}
              <div className="flex justify-end px-2 py-2">
                <Button
                  color="primary"
                  endIcon={<AddIcon></AddIcon>}
                  type="submit"
                >
                  Add
                </Button>
              </div>
            </Form>
          );
        }}
      </Formik>
    </div>
  );
};

export default AddWhiteListRecord;
