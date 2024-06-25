import React from "react"

export default function AdminLayout({
  children,
}: {
  children: React.ReactNode
}) {
  return (
    <main className="flex min-h-screen bg-[url('../assets/images/bg1.jpg')] bg-no-repeat bg-cover">
        {children}
    </main>
  )
}