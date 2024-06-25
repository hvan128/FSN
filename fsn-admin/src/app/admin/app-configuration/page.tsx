import Main from "@/components/app-configuration/main";
import { Metadata } from "next";

export const metadata: Metadata = {
  title: "App configuration | iFridge-Admin",
  description: "Admin portal for iFridge staff",
};

export default function AppConfiguration() {
  return <Main></Main>;
}
