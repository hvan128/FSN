import Main from "@/components/community/main";
import { Metadata } from "next";

export const metadata: Metadata = {
  title: "Production | iFridge-Admin",
  description: "Admin portal for iFridge staff",
};

export default function Product() {
  return <Main></Main>;
}
