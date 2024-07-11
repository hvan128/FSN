"use client"
import storage from "@/services/storage";
import { redirect } from "next/navigation";
import { useEffect } from "react";

export default function Home() {

  useEffect(() => {
    const checkToken = () => {
      let accessToken = storage.getLocalAccessToken();
      
      if(accessToken){
        redirect('/admin')
      }else{
        redirect('/login')
      }
    }
 
    checkToken()
  }, []);

  return (
    <main className="flex min-h-screen flex-col items-center bg-white justify-between p-24">
      <div className="z-10 max-w-5xl w-full items-center justify-between lg:flex">

      </div>
    </main>
  )
}
