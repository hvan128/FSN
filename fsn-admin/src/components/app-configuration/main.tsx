"use client";
import { useState } from "react";
import { FontFamily, FontSize, TextColor } from "@/enum/setting";
import Divide from "@/lib/divide";
import Typography from "@/lib/typography";
import EngineeringIcon from "@mui/icons-material/Engineering";
import UpdateIcon from "@mui/icons-material/Update";
import SecurityIcon from "@mui/icons-material/Security";
import SettingsApplicationsIcon from "@mui/icons-material/SettingsApplications";
import CallIcon from "@mui/icons-material/Call";
import Maintenance from "./tabs/maintenance";
import Update from "./tabs/update";
import Others from "./tabs/others";

export default function Main() {
  const [tab, setTab] = useState(1);

  const renderTabContent = (value: number) => {
    switch (value) {
      case 1:
        return <Maintenance></Maintenance>;
      case 2:
        return <Update></Update>;
      case 3:
        return <Others></Others>;
      default:
        return <></>;
    }
  };

  const handleChangeTab = (value: number) => {
    setTab(value);
  };

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
            App Configuration{" "}
          </Typography>
        </div>
        <div></div>
      </div>
      {/* Divider */}
      <Divide></Divide>
      {/* Tabs and Content */}
      <div className="flex flex-col gap-3">
        <div className="grid grid-cols-5">
          {/* Tabs */}
          <div className="p-1">
            <ul className="flex-column text-sm font-bold text-grey-c700">
              <li className="p-1">
                <a
                  onClick={() => handleChangeTab(1)}
                  className={
                    tab === 1
                      ? `inline-flex items-center px-4 py-4 text-grey-c700 rounded-lg hover:bg-primary-c100 bg-primary-c100 w-full gap-2`
                      : `inline-flex items-center px-4 py-4 text-grey-c700 rounded-lg hover:bg-primary-c100 w-full gap-2 cursor-pointer`
                  }
                  aria-current="page"
                >
                  <EngineeringIcon></EngineeringIcon>
                  <Typography
                    fontFamily={FontFamily.BOLD}
                    fontSize={FontSize.SM}
                    className="hidden sm:flex"
                  >
                    Maintenance
                  </Typography>
                </a>
              </li>
              <li className="pb-1">
                <a
                  onClick={() => handleChangeTab(2)}
                  className={
                    tab === 2
                      ? `inline-flex items-center px-4 py-4 text-grey-c700 rounded-lg hover:bg-primary-c100 bg-primary-c100 w-full gap-2 cursor-pointer`
                      : `inline-flex items-center px-4 py-4 text-grey-c700 rounded-lg hover:bg-primary-c100 w-full gap-2 cursor-pointer`
                  }
                >
                  <UpdateIcon></UpdateIcon>
                  <Typography
                    fontFamily={FontFamily.BOLD}
                    fontSize={FontSize.SM}
                    className="hidden sm:flex"
                  >
                    App update
                  </Typography>
                </a>
              </li>

              <li className="pb-1">
                <a
                  onClick={() => handleChangeTab(3)}
                  className={
                    tab === 3
                      ? `inline-flex items-center px-4 py-4 text-grey-c700 rounded-lg hover:bg-primary-c100 bg-primary-c100 w-full gap-2 cursor-pointer`
                      : `inline-flex items-center px-4 py-4 text-grey-c700 rounded-lg hover:bg-primary-c100 w-full gap-2 cursor-pointer`
                  }
                >
                  <SettingsApplicationsIcon></SettingsApplicationsIcon>
                  <Typography
                    fontFamily={FontFamily.BOLD}
                    fontSize={FontSize.SM}
                    className="hidden sm:flex"
                  >
                    Others setting
                  </Typography>
                </a>
              </li>
            </ul>
          </div>
          {/* Content */}
          <div className="col-span-4 p-4 border-l-grey-c700 border-l border-dashed">
            {renderTabContent(tab)}
          </div>
        </div>
      </div>
    </div>
  );
}
