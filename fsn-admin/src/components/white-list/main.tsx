"use client";
import { FontFamily, FontSize, TextColor } from "@/enum/setting";
import Divide from "@/lib/divide";
import Typography from "@/lib/typography";
import React, { useState } from "react";
import RecordComponent from "./record-component";
import Link from "next/link";
import BatchComponent from "./batch-component";
import Button from "@/lib/button";
import AddIcon from "@mui/icons-material/Add";
import { openModal } from "@/redux/slice/modalSlice";
import { useDispatch } from "react-redux";
import AddWhiteListRecord from "./modals/add-whitelist-record";
import {
  ROLES,
} from "@/enum/constants";
import TextField from "@/lib/text-field";
import FilterListIcon from "@mui/icons-material/FilterList";
import storage from "@/services/storage";
import Select from "@/lib/select";
import CancelIcon from '@mui/icons-material/Cancel';
import SearchIcon from '@mui/icons-material/Search';


export default function Main() {
  const [openFilter, setOpenFilter] = useState(false);
  const [openTab, setOpenTab] = useState(1);
  const dispatch = useDispatch();
  const [phone, setPhone] = useState("");
  const [cid, setCid] = useState("");
  const [status, setStatus] = useState("");
  const statusTypes = [
    { label: "Approved", value: "APPROVED" },
    { label: "In-Progress", value: "IN_PROGRESS" },
    { label: "Rejected", value: "REJECTED" },
    { label: "Returned", value: "RETURNED" },
    { label: "Submit for Approval", value: "SUBMIT_FOR_APPROVAL" },
    { label: "Submit for Deletion", value: "SUBMIT_FOR_DELETION" },
  ];
  const [recordWhitelistFilter, setRecordWhitelistFilter] =
    useState<RecordWhitelistFilterProps>({
      phone: "",
      cid: "",
      status: "",
    });
  const handleClickSearch = () => {
    setRecordWhitelistFilter({
      cid: cid,
      phone: phone,
      status: status,
    });
  };
  const handleCancelFilter = () => {
    setPhone("");
    setStatus("");
    setCid("");
    setRecordWhitelistFilter({
      cid: "",
      phone: "",
      status: "",
    });
    setOpenFilter(false);
  };
  const userRole = storage.getUserInforFromLocalStorage();

  const onClickAddWhitelist = () => {
    const modal = {
      isOpen: true,
      title: "Add whitelist record",
      content: <AddWhiteListRecord></AddWhiteListRecord>,
    };
    dispatch(openModal(modal));
  };


  const transformerStatusTypes = [
    { label: "Approved", value: "APPROVED" },
    { label: "Pending", value: "PENDING" },
    { label: "Rejected", value: "REJECTED" },
  ]

  return (
    <div className="flex flex-col grow bg-white rounded-2xl px-4 py-4 min-h-[800px]">
      {/* Header */}
      <div className="justify-between items-center flex flex-row py-2">
        <div className="hover:bg-primary-c50 rounded-md">
          <Typography
            textColor={TextColor.PRIMARY_900}
            fontSize={FontSize.XL}
            fontFamily={FontFamily.BOLD}
            className={"px-2 py-1"}
          >
            Whitelist
          </Typography>
        </div>
        {userRole.adminRole?.code !== ROLES.OPERATION_MANAGER.CODE &&
          userRole.adminRole?.code !== ROLES.SUPER_ADMIN.CODE && (
            <div>
              <Button
                startIcon={<AddIcon></AddIcon>}
                className="px-4"
                onClick={onClickAddWhitelist}
              >
                Add Whitelist
              </Button>
            </div>
          )}
      </div>
      {/* Divider */}
      <Divide></Divide>
      {/* Tabs */}
      <div className="flex flex-wrap">
        <div className="flex flex-col justify-start items-start w-full">
          <ul
            className="flex mb-0 list-none flex-wrap pt-3 pb-2 flex-row"
            role="tablist"
          >
            <li className="-mb-px mr-2 last:mr-0 flex-auto text-center">
              <Link
                className={
                  "text-xs font-bold uppercase px-5 py-3 block leading-normal active:bg-primary-c100 " +
                  (openTab === 1
                    ? `${TextColor.PRIMARY_700} ${FontFamily.EXTRA_BOLD}  border-b-4`
                    : `${TextColor.GREY_700} `)
                }
                onClick={(e) => {
                  e.preventDefault();
                  setOpenTab(1);
                }}
                data-toggle="tab"
                href="#link1"
                role="tablist"
              >
                Record tab
              </Link>
            </li>
            <li className="-mb-px mr-2 last:mr-0 flex-auto text-center">
              <Link
                className={
                  "text-xs font-bold uppercase px-5 py-3 block leading-normal active:bg-primary-c100 " +
                  (openTab === 2
                    ? `${TextColor.PRIMARY_700} ${FontFamily.EXTRA_BOLD}  border-b-4`
                    : `${TextColor.GREY_700} `)
                }
                onClick={(e) => {
                  e.preventDefault();
                  setOpenTab(2);
                }}
                data-toggle="tab"
                href="#link2"
                role="tablist"
              >
                Batch tab
              </Link>
            </li>
          </ul>
          {/* Content */}
          <div className="relative flex flex-col min-w-0 bg-white w-full mb-6">
            <div className="flex-auto">
              <div className="tab-content tab-space">
                <div className={openTab === 1 ? "block" : "hidden"} id="link1">
                  {/* Filter icon */}
                  <div className="justify-end items-end flex flex-col px-4 cursor-pointer">
                    <Button
                      color="secondary"
                      endIcon={<FilterListIcon></FilterListIcon>}
                      onClick={() => setOpenFilter(!openFilter)}
                    >
                      Filter
                    </Button>
                  </div>
                  {/* Search */}
                  {openFilter && (
                    <>
                      <div className="flex flex-col gap-3">
                        {/* Search option */}
                        <div className="justify-end items-end grid xl:grid-cols-3 lg:grid-cols-3 sm:grid-cols-2 xs:grid-cols-1 px-4 gap-3">
                          <div >
                            <TextField
                              placeholder="Search by Document ID"
                              label="Document ID"
                              className={`${FontSize.BASE}`}
                              onChange={(e) => {
                                setCid(e.target.value);
                              }}
                              value={cid}
                            ></TextField>
                          </div>
                          <div >
                            <TextField
                              placeholder="Search by mobile number"
                              label="Mobile number"
                              className={`${FontSize.BASE}`}
                              onChange={(e) => {
                                setPhone(e.target.value);
                              }}
                              value={phone}
                            ></TextField>
                          </div>
                          <div >
                            <Select
                              placeholder="Search by status"
                              title="Status"
                              className={`${FontSize.BASE}`}
                              options={transformerStatusTypes}
                              onSelectItem={(item) => {
                                setStatus(item.value as string);
                              }}
                            ></Select>
                          </div>
                        </div>
                        {/* Search button group */}
                        <div className="pb-4 px-4 gap-2 flex-row flex">
                          <Button
                            color="primary"
                            endIcon={
                              <SearchIcon></SearchIcon>
                            }
                            onClick={handleClickSearch}
                          >
                            Search
                          </Button>
                          <Button
                            color="error"
                            endIcon={
                              <CancelIcon></CancelIcon>
                            }
                            onClick={handleCancelFilter}
                          >
                            Cancel
                          </Button>
                        </div>
                      </div>
                    </>
                  )}

                  {/* Divider */}
                  <div className="pt-4 pb-6">
                    <Divide></Divide>
                  </div>

                  <RecordComponent filter={recordWhitelistFilter} />
                </div>
                <div className={openTab === 2 ? "block" : "hidden"} id="link2">
                  <BatchComponent />
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  );
}
