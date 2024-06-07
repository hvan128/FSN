import Main from "@/components/customer/main";
import { Metadata } from "next";

export const metadata: Metadata = {
  title: 'Customer management | DK-Admin',
  description: 'Admin portal for DK staff',
}

export default function Customer() {
  return (
    <Main></Main>
  )
}
