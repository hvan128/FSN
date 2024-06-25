"use client";
import { FontFamily, FontSize, SCREEN, TextColor } from "@/enum/setting";
import Button from "@/lib/button";
import Divide from "@/lib/divide";
import Typography from "@/lib/typography";
import AddCircleOutlineIcon from "@mui/icons-material/AddCircleOutline";
import FilterListIcon from "@mui/icons-material/FilterList";
import { useDispatch } from "react-redux";
import Request from "./request";
import { useState } from "react";
import Select from "@/lib/select";
import { refetchComponent } from "@/redux/slice/refetchSlice";

export default function Main() {
  const dispatch = useDispatch();
  const [openFilter, setOpenFilter] = useState(false);
  const [requestType, setRequestType] = useState("");
  const [requestStatus, setRequestStatus] = useState("");
  const [requestFilter, setRequestFilter] = useState<RequestFilterProps>({
    status: "",
  });

  const handleChangeRequestType = (item: any) => {
    setRequestType(item?.value);
  };

  const handleChangeRequestStatus = (item: any) => {
    setRequestStatus(item?.value);
  };

  const handleCancelFilter = () => {
    setRequestType("");
    setRequestStatus("");
    setOpenFilter(false);
    setRequestFilter({
      status: "",
    });
  };

  const listRequestStatus = [
    {
      value: "finished",
      label: "Finished",
    },
    {
      value: "in-progress",
      label: "In Progress",
    },
    {
      value: "pending",
      label: "Pending",
    },
    {
      value: "rejected",
      label: "Rejected",
    },
    {
      value: "all",
      label: "All",
    },
  ];

  const handleClickSearch = () => {
    setRequestFilter({
      status: requestStatus,
    });
    dispatch(refetchComponent());
  };

  const renderSearchComponent = (isOpen: Boolean) => {
    return isOpen ? (
      <div className="flex flex-col gap-3 pb-4">
        {/* Search option */}
        <div className="justify-center items-center flex flex-col lg:flex-row px-4 gap-2 lg:gap-4">
          <div className="flex-1 w-full">
            <Select
              options={listRequestStatus}
              placeholder="Search by request status"
              title="Request status"
              position="bottom"
              onSelectItem={handleChangeRequestStatus}
            ></Select>
          </div>
          <div className="flex-1">
            {/* Search button group */}
            <div className="px-4 gap-2 flex-row flex">
              <Button
                color="primary"
                onClick={handleClickSearch}
                endIcon={<AddCircleOutlineIcon></AddCircleOutlineIcon>}
              >
                Search
              </Button>
              <Button
                color="error"
                onClick={handleCancelFilter}
                endIcon={<AddCircleOutlineIcon></AddCircleOutlineIcon>}
              >
                Cancel
              </Button>
            </div>
          </div>
          <div className="flex-1 hidden xl:flex"></div>
        </div>
      </div>
    ) : (
      <></>
    );
  };

  // Open add request modal

  return (
    <div className="flex flex-col grow bg-white rounded-2xl px-4 py-4 min-h-[800px]">
      {/* Header */}
      <div className="justify-between items-center flex flex-row py-2">
        <div>
          <Typography
            textColor={TextColor.GREY_700}
            fontSize={FontSize.XL}
            fontFamily={FontFamily.BOLD}
          >
            {" "}
            Request{" "}
          </Typography>
        </div>
      </div>
      {/* Divider */}
      <Divide></Divide>
      {/* Filter icon */}
      <div className="justify-end items-end flex flex-col py-4 px-4">
        <Button
          color="secondary"
          endIcon={<FilterListIcon></FilterListIcon>}
          onClick={() => setOpenFilter(!openFilter)}
        >
          Filter
        </Button>
      </div>
      {/* Search */}
      {renderSearchComponent(openFilter)}
      {/* Divider */}
      <Divide></Divide>
      {/* Table */}
      <Request filter={requestFilter}></Request>
      {/* Divider */}
      <Divide></Divide>
    </div>
  );
}
