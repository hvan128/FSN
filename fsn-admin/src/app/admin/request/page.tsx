import { Metadata } from "next";
import Main from "@/components/request/main";

export const metadata: Metadata = {
  title: 'Customer management | DK-Admin',
  description: 'Admin portal for DK staff',
}

export default function Request() {
  return (
    <Main></Main>
  )
}
