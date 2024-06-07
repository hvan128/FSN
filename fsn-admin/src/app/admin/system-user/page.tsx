import Main from "@/components/system-user/main";
import { Metadata } from "next";


export const metadata: Metadata = {
  title: 'System user | DK-Admin',
  description: 'Admin portal for DK staff',
}

export default function SystemUser() {
  return (
    <Main></Main>
  )
}
