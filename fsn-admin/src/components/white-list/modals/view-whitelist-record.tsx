import {  TextColor } from "@/enum/setting";
import TextField from "@/lib/text-field";
import Typography from "@/lib/typography";
import React from "react";
import Select from "@/lib/select";
import { ListGender, ListProductName } from "@/enum/constants";
import { COUNTRIES } from "@/enum/countries";
import DatePicker from "@/lib/datePicker";
import MonthPicker from "@/lib/monthPicker";
import moment from "moment";

export type WhiteListRecordProp = {
  fullName: string;
  id: string;
  countryCode: string | null;
  phone: string;
  dob: string;
  productType: string;
  gender: string;
  email: string;
  instituteName: string;
  referenceId: string;
  courseName: string;
  approvedLoanAmount: string;
  cid: string;
  yearOfCompletion: string;
  status: string;
  prefix: string;
};
const ViewWhiteListRecord = (props: WhiteListRecordProp) => {
  const isLCY = props.productType === "LCY";
  const isLoan = props.productType === "LOAN";
  return (
    <div className="bg-white flex flex-col gap-4 px-3 py-4 sm:p-4 border-b-2 border-b-grey-c100">
      <div className="flex gap-4">
        <div className="flex-1">
          <Select
            name="productType"
            title="Product name * :"
            placeholder="Select product name"
            options={ListProductName}
            selected={props.productType}
            fullWidth={true}
            disabled
          />
        </div>
        <div className="flex-1">
          <TextField
            name="referenceId"
            label="Reference ID * :"
            value={props.referenceId}
            placeholder="Enter reference ID"
            fullWidth={true}
            disabled
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
            value={props.cid ?? ""}
            disabled
          />
        </div>
        <div className="flex-1">
          <TextField
            name="fullName"
            label="Full name * :"
            placeholder="Enter your full name"
            fullWidth={true}
            value={props.fullName}
            disabled
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
              selected={new Date(props.dob)}
              selectTime={false}
              placeholder="dd/mm/yyyy"
              disabled
            />
          </div>
        )}
        {!isLoan && (
          <div className="flex-1">
            <Select
              name="gender"
              id="gender"
              title="Gender * :"
              selected={props.gender}
              placeholder="Select your sex"
              options={ListGender}
              fullWidth={true}
              disabled
            />
          </div>
        )}
        {!isLCY && (
          <div className="flex-1">
            <TextField
              name="instituteName"
              label="Name of the institute * :"
              placeholder="Enter your name of the institute"
              value={props.instituteName}
              disabled
            />
          </div>
        )}
        {!isLCY && (
          <div className="flex-1">
            <TextField
              name="courseName"
              label="Name of the course * :"
              placeholder="Enter your name of the course"
              value={props.courseName}
              disabled
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
              selected={COUNTRIES.find((c) => c.value === props.countryCode)?.value}
              placeholder="Select country"
              fullWidth={true}
              disabled
            />
          </div>
        )}
        {!isLoan && (
          <div className="flex-1">
            <TextField
              name="phone"
              label="Mobile number * :"
              value={props.phone}
              placeholder="Enter your mobile number"
              inputProps={{
                startAdornment: props.prefix && (
                  <Typography textColor={TextColor.PRIMARY_700}>
                    {`+${props.prefix}`}
                  </Typography>
                ),
              }}
              fullWidth={true}
              disabled
            />
          </div>
        )}
        {!isLCY && (
          <div className="flex-1">
            <MonthPicker
              name="yearOfCompletion"
              title="Year of completion *"
              position="top"
              selected={new Date(moment(props.yearOfCompletion, 'MM-YYYY').format())}
              placeholder="dd/mm/yyyy"
              disabled
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
              value={props.approvedLoanAmount}
              disabled
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
              value={props.email}
              disabled
            />
          </div>
          <div className="flex-1"></div>
        </div>
      )}
    </div>
  );
};

export default ViewWhiteListRecord;
