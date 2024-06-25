import Main from "@/components/profile/main";
import { Metadata } from "next";

export const metadata: Metadata = {
  title: "Profile | iFridge-Admin",
  description: "Admin portal for iFridge staff",
};

export default function Profile() {
  return <Main></Main>;
}
