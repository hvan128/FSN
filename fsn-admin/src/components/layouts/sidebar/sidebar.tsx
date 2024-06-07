"use client"
import { FontFamily, FontSize, TextColor } from "@/enum/setting"
import Divide from "@/lib/divide"
import Typography from "@/lib/typography"
import Image from "next/image"
import ArrowForwardIosIcon from '@mui/icons-material/ArrowForwardIos';
import MenuItem from "./menu-item/menu-item";
import React, { useEffect, useState } from "react";
import storage from "@/services/storage";
import Link from "next/link"

type Props = {
  children?: React.ReactNode
}

export default function Sidebar({ children }: Props) {

  const [fullName, setFullName] = useState('');
  const [role, setRole] = useState('');

  useEffect(() => {
    let userInformation = storage.getUserInforFromLocalStorage();
    setFullName(userInformation?.fullName)
    setRole(userInformation?.adminRole?.name)
  }, []);

  return (
    <div className="w-full flex flex-row mx-auto min-h-[calc(100vh-116px)]">
      {/* Sidebar on the left! */}
      <aside className="flex flex-col shrink-0 lg:w-[300px] w-[250px] sm:hidden xs:hidden md:block transition-all duration-300 m-0 fixed z-40 inset-y-0 left-0 bg-white border-r border-r-dashed border-r-white sidenav fixed-start overflow-y-scroll" id="sidenav-main">
        <div className="flex shrink-0 px-8 items-center justify-between h-[84px]">
          <Link className="transition-color duration-200 ease-in-out" href="/">
            <Image alt="Logo" src="/logo.svg" height={60} width={160} style={{
              width: 'auto',
              height: '50px',
            }} priority />
          </Link>
        </div>

        <Divide></Divide>

        <div className="flex items-center justify-between px-8 py-5">
          <div className="flex items-center mr-5">
            <div className="mr-5 md:hidden lg:flex">
              <div className="inline-block relative shrink-0 cursor-pointer rounded-[.95rem]">
                <Image src="/avatar1.png" alt="avatar image" className="inline rounded-sm" height={48} width={48}  />
              </div>
            </div>
            <div className="mr-2 ">
              <Typography textColor={TextColor.PRIMARY_700} fontSize={FontSize.BASE} fontFamily={FontFamily.BOLD}>{fullName}</Typography>
              <Typography textColor={TextColor.PRIMARY_700} fontSize={FontSize.SM} fontFamily={FontFamily.LIGHT}>{role}</Typography>
            </div>
          </div>
          <Link className="inline-flex relative items-center group justify-end text-base font-medium leading-normal text-center align-middle cursor-pointer rounded-[.95rem] transition-colors duration-150 ease-in-out text-dark bg-transparent shadow-none border-0" href="/admin/profile">
            <ArrowForwardIosIcon color="primary"></ArrowForwardIosIcon>
          </Link>
        </div>

        <Divide></Divide>

        <MenuItem></MenuItem>
      </aside>

      {/* Main content on the right! */}
      <div className="flex w-full">
        {/* Left component is beside sidebar! */}
        <div className="lg:w-[300px] w-[250px] sm:hidden xs:hidden md:block">

        </div>
        {/* Right component is main content! */}
        <div className="m-4 grow w-[71.5%]">
          {children}
        </div>
      </div>
    </div>
  )
}