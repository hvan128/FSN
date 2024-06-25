import Main from "@/components/system-user/main";
import { Metadata } from "next";

export const metadata: Metadata = {
  title: "System user | iFridge-Admin",
  description: "Admin portal for iFridge staff",
};

export default function SystemUser() {
  return <Main></Main>;
}
