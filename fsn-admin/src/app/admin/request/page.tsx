import { Metadata } from "next";
import Main from "@/components/request/main";

export const metadata: Metadata = {
  title: "Customer management | iFridge-Admin",
  description: "Admin portal for iFridge staff",
};

export default function Request() {
  return <Main></Main>;
}
