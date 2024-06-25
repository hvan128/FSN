"use client"
import { FontFamily, FontSize, TextColor } from "@/enum/setting";
import TextField from "@/lib/text-field";
import Typography from "@/lib/typography";
import { closeLoading, openLoading } from "@/redux/slice/loadingSlice";
import Image from "next/image";
import React, { useEffect, useMemo, useRef, useState } from "react";
import { useDispatch } from "react-redux";
import SwitchButton from "../../../lib/switch-button";
import moment from "moment";
import Skeleton from "@/lib/skeleton";

type Props = {
  id: string | number;
};

type AnnouncementType = {
  announcementRemark: any;
  images: string;
  title: string;
  status: string;
  messageSummary: string;
  messageDetail: string;
  liveTicker: boolean;
};

export default function ViewAnnouncement({ id }: Props) {
    const [announcement, setAnnouncement] = useState<AnnouncementType>();
    const [openTab, setOpenTab] = useState(1);
    const tabsRef = useRef<Array<HTMLLIElement>>([])
    const previewImage = useMemo(() => {
        return announcement?.images ?? '';
    }, [announcement?.images]);
    const dispatch = useDispatch();
  
    useEffect(() => {
      const fetchData = async () => {
        try {
          // const data = await getAnnouncementById({
          //   variables: { announcementId: Number(id) },
          // });
  
          // setAnnouncement(data?.data.Announcement);
        } catch (e) {
        } finally {
        }
      };
  
      fetchData();
  
      // eslint-disable-next-line react-hooks/exhaustive-deps
    }, []);
  
    const renderTab = () => {
      return (
        <Skeleton loading={false}>
          <div className="flex flex-col gap-2 sm:py-4">
                  {openTab === 1 ?
                      <>
                          <div className="flex flex-row px-8 gap-6 ">
                              <div className="basis-3/4">
                                  <TextField
                                      label="Title *:"
                                      name='title'
                                      value={announcement?.title}
                                      placeholder="Enter announcement title"
                                      disabled
                                  >
                                  </TextField>
                              </div>
                              <div className="1/4">
                                  <Typography
                                      className="text-primary-c700"
                                      fontFamily={FontFamily.BOLD}
                                  >
                                      Live Ticker *:
                                  </Typography>
                                  <SwitchButton
                                      checked={announcement?.liveTicker ?? false}
                                      name='liveTicker'
                                      handleClickSwitchButton={() => null}
                                      disabled
                                  />
                              </div>
                          </div>
                          <div className="flex-1 px-8">
                              <TextField
                                  label="Message summary *:"
                                  name='messageSummary'
                                  value={announcement?.messageSummary}
                                  placeholder="Enter announcement message detail"
                                  multiline
                                  rows={2}
                                  disabled
                              >
                              </TextField>
                          </div>
                          <div className="flex-1 px-8">
                              <TextField
                                  placeholder="Enter announcement message detail"
                                  label="Message detail *:"
                                  name='messageDetail'
                                  value={announcement?.messageDetail}
                                  multiline
                                  rows={5}
                                  disabled
                              />
                          </div><div className="flex flex-col px-8 items-center">
                              {previewImage &&
                                  <Image
                                      alt="Announcement image"
                                      loader={() => previewImage}
                                      src={previewImage}
                                      unoptimized
                                      width="0"
                                      height="0"
                                      className="w-auto h-[500px]"
                                  ></Image>
                              }
                          </div>
                      </>
                      :
                      <div className="px-4">
                          <div className="max-w-[100%] rounded-[10px] overflow-hidden">
                              <div className="overflow-x-auto">
                                  <table className="table-auto w-full text-base text-left text-grey-c700">
                                      <thead className={`text-grey-c700 uppercase bg-primary-c100 ${FontFamily.BOLD} ${FontSize.BASE}`}>
                                          <tr className="hover:bg-secondary-c100 hover:text-grey-c700">
                                              <th className="pl-3 py-4">Remark</th>
                                              <th className="px-1 py-4">Updated by</th>
                                              <th className="px-1 py-4">Date</th>
                                          </tr>
                                      </thead>
                                      <tbody>
                                          {announcement?.announcementRemark.map((item: any, index: number) => {
                                              return (
                                                  <tr className="hover:bg-primary-c50 hover:text-grey-c700" key={index}>
                                                      <td className="pl-3 py-4">{item.remark}</td>
                                                      <td className="px-1 py-4">{item.adminCreate?.fullName}</td>
                                                      <td className="px-1 py-4">{moment(item.updatedAt).format("DD/MM/YYYY hh:mm a")}</td>
                                                  </tr>
                                              )
                                          }
                                          )}
                                      </tbody>
                                  </table>
                              </div>
                          </div>
                      </div>
                  }
              </div>
        </Skeleton>
      );
    };

 
  return (
    <div className="bg-white sm:px-4 border-b-2 border-b-grey-c100">
      {/* Tabs */}
      <div className="flex flex-col justify-start items-start w-full relative pb-2 px-4 mb-3">
        <ul
          className="flex mb-0 list-none flex-wrap pt-3 pb-2 flex-row"
          role="tablist"
        >
          {/* <li
            ref={(el) => el && tabsRef.current.push(el)}
            className="-mb-px mr-2 last:mr-0 flex-auto text-center"
          >
            <button
              className={
                "text-xs font-bold uppercase px-5 pt-3 block leading-normal active:bg-primary-c100 " +
                (openTab === 1
                  ? `${TextColor.PRIMARY_700} ${FontFamily.EXTRA_BOLD}`
                  : `${TextColor.GREY_700} `)
              }
              onClick={(e) => {
                e.preventDefault();
                setOpenTab(1);
              }}
              data-toggle="tab"
              role="tablist"
            >
              Information
            </button>
          </li>
          <li
            ref={(el) => el && tabsRef.current.push(el)}
            className="-mb-px mr-2 last:mr-0 flex-auto text-center"
          >
            <button
              className={
                "text-xs font-bold uppercase px-5 pt-3 block leading-normal active:bg-primary-c100 " +
                (openTab === 2
                  ? `${TextColor.PRIMARY_700} ${FontFamily.EXTRA_BOLD}`
                  : `${TextColor.GREY_700} `)
              }
              onClick={(e) => {
                e.preventDefault();
                setOpenTab(2);
              }}
              data-toggle="tab"
              role="tablist"
            >
              Remarks
            </button>
          </li> */}
        </ul>
        <span
          style={{
            left: tabsRef.current[(openTab + 1) % 2]?.offsetLeft ?? 0,
            width: tabsRef.current[(openTab + 1) % 2]?.offsetWidth ?? 0,
          }}
          className={`
                        transition-all
                        absolute
                        bottom-0
                        ${TextColor.PRIMARY_700}  
                        border-b-4
                        `}
        />
      </div>
      {/* Content */}
      {renderTab()}
    </div>
  );
}
