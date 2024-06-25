import Main from "@/components/announcement/main";
import { Metadata } from "next";


export const metadata: Metadata = {
  title: 'Announcement | iFridge-Admin',
  description: 'Admin portal for iFridge staff',
}

export default function Announcement() {
  return (
    <Main></Main>
  )
}
