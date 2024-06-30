"use client"
import Typography from "@/lib/typography";
import { FontFamily, FontSize, TextColor } from "@/enum/setting";
import ArrowForwardIosIcon from '@mui/icons-material/ArrowForwardIos';
import type { RootState } from '../../redux/store';
import { useSelector, useDispatch } from 'react-redux'
import { closeSidebar } from "@/redux/slice/sidebarSlice";
import Link from "next/link";
import Image from "next/image";
import Divide from "@/lib/divide";
import MenuItem from "../layouts/sidebar/menu-item/menu-item";
import { useEffect, useState } from "react";
import storage from "@/services/storage";

// Just for responsive < md screen
export default function Sidebar() {
    const [fullName, setFullName] = useState('');
    const [role, setRole] = useState('');
    const sidebarData = useSelector((state: RootState) => state.sidebar);
    const dispatch = useDispatch();

    const handleCloseSidebar = () => {
        dispatch(closeSidebar());
    }

    useEffect(() => {
        let userInformation = storage.getUserInforFromLocalStorage();
        setFullName(userInformation?.fullName)
        setRole(userInformation?.adminRole?.name)
    }, []);


    const renderSidebarForm = () => {
        return (
            <div className="flex flex-col w-[250px] md:w-[300px] left-0 h-screen bg-white overflow-y-scroll shrink-0 border-r border-r-dashed border-r-white" id="sidenav-main-responsive">
                <div className="flex items-center justify-between px-8 py-5">
                    <div className="flex items-center mr-5">
                        <div className="mr-5 xs:hidden md:flex">
                            <div className="inline-block relative shrink-0 cursor-pointer rounded-[.95rem]">
                                <Image src="/avatar1.png" alt="avatar image" className="inline rounded-sm" height={48} width={48} />
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
            </div>
        )
    }

    return (
        <div className="fixed inset-0 z-50" aria-labelledby="modal-title" role="dialog" aria-modal="true" hidden={!sidebarData.isOpen}>
            <div className="fixed z-50 w-fit overflow-y-auto">
                <div className="flex min-h-full items-start justify-start text-center sm:items-start">
                    {renderSidebarForm()}
                </div>
            </div>
            <div className="fixed inset-0 transition-opacity z-40 bg-white/40" onClick={handleCloseSidebar}></div>
        </div>
    )
}