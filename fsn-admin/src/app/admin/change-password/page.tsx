import Main from "@/components/change-password/main";
import { Metadata } from "next";

export const metadata: Metadata = {
  title: "Change password | iFridge-Admin",
  description: "Admin portal for iFridge staff",
};

export default function ChangePassword() {
  return <Main></Main>;
}
