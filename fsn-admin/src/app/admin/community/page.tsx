import Main from "@/components/community/main";
import { Metadata } from "next";


export const metadata: Metadata = {
  title: 'Production | DK-Admin',
  description: 'Admin portal for DK staff',
}

export default function Product() {
  return (
    <Main></Main>
  )
}
