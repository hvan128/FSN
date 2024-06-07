import { FontFamily, TextColor } from "@/enum/setting";
import Link from "next/link";
import React from "react";

interface LinkTabProps {
  label: string;
  openTab: number;
  index: number;
  onClick: () => void;
}

const LinkTab: React.FC<LinkTabProps> = ({ label, openTab, index, onClick }) => {
  return (
    <li className="-mb-px mr-2 last:mr-0 flex-auto text-center">
      <Link
        href={`#link${index}`}
        onClick={(e) => {
          e.preventDefault();
          onClick();
        }}
        className={`text-xs font-bold uppercase px-5 py-3 block leading-normal active:bg-primary-c100 ${
          openTab === index
            ? `${TextColor.PRIMARY_700} ${FontFamily.EXTRA_BOLD}  border-b-4`
            : `${TextColor.GREY_700} `
        }`}
        role="tablist"
      >
        {label}
      </Link>
    </li>
  );
};

export default LinkTab;
