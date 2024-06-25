import {  FontFamily, FontSize, TextColor } from "@/enum/setting";
import Typography from "@/lib/typography";
import { fDate } from "@/utils/function";
import React from "react";

const ViewDuplicateReport = ({ data }: any) => {
  return (
    <div className="bg-white px-5 py-4 sm:p-4">
      <div className="items-center flex flex-col">
        {/* Table */}
        <div className="w-full max-w-[100%] rounded-[10px] overflow-hidden">
          <div className="overflow-x-auto">
            <table className="table-auto w-full text-base text-left text-grey-c700">
              <thead className={`text-grey-700 uppercase bg-primary-c100 ${FontFamily.BOLD} ${FontSize.BASE}`}>
                <tr>
                  <th className="pl-3 py-4">REFERENCE ID</th>
                  <th className="px-1 py-4">PRODUCT NAME</th>
                  <th className="px-1 py-4">CID/ID NUMBER</th>
                  <th className="px-1 py-4">FULL NAME</th>
                  <th className="px-1 py-4">DOB</th>
                  <th className="px-1 py-4">MOBILE NUMBER</th>
                </tr>
              </thead>
              <tbody>
                {data && data?.length > 0 && data?.map((row: any, index: number) => {
                  return (
                    <tr
                      className="hover:bg-primary-c50 hover:text-grey-c700"
                      key={row.referenceId}
                    >
                      <td className="pl-3 py-4">{row?.referenceId}</td>
                      <td className="px-1 py-4">{row?.productType}</td>
                      <td className="px-1 py-4">{row?.cid}</td>
                      <td className="px-1 py-4">{row?.fullName}</td>
                      <td className="px-1 py-4">
                        {row?.dob ? fDate(row?.dob) : ""}
                      </td>
                      <td className="px-1 py-4">{row.phone && "+" + row.phone}</td>
                    </tr>
                  );
                })}
                {/* <tr className="hover:bg-primary-c50 hover:text-grey-c700">
                  <td className="px-1 py-4">11</td>
                  <td className="px-1 py-4">Earth, Wind, and Fire</td>
                  <td className="px-1 py-4">1975</td>
                  <td className="px-1 py-4">Shining Star</td>
                  <td className="px-1 py-4">Earth, Wind, and Fire</td>
                  <td className="px-1 py-4">1975</td>
                </tr> */}
              </tbody>
            </table>
          </div>
        </div>
        {/* Body with no data */}
        {!data && <div className="w-full text-center pt-5">
          <Typography
            textColor={TextColor.PRIMARY_700}
            fontSize={FontSize.BASE}
          >
            No data
          </Typography>
        </div>}
      </div>
    </div>
  );
};

export default ViewDuplicateReport;
