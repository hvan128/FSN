import Footer from "@/components/layouts/footer/footer"
import Header from "@/components/layouts/header/header"
import Sidebar from "@/components/layouts/sidebar/sidebar"
import React from "react"

export default function AdminLayout({
  children,
}: {
  children: React.ReactNode
}) {
  return (
    <main className="flex min-h-screen flex-col items-center bg-primary-c100">
      <Header></Header>
      <Sidebar>
        {children}
      </Sidebar>
      <Footer></Footer>
    </main>
  )
}