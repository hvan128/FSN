import type { Metadata } from 'next'
import './globals.css'
import localFont from 'next/font/local'
import { ReduxProvider } from './provider'
import Modal from '@/components/modals/modal'
import Confirm from '@/components/modals/confirm'
import Alert from '@/components/modals/alert'
import Loading from '@/components/modals/loading'
import Sidebar from '@/components/modals/sidebar'
import ImageDetail from '@/components/modals/image-detail'

const urbanist = localFont({
  src: [
    {
      path: '../assets/fonts/Urbanist-Thin.ttf',
      style: 'thin', //weight 100
    },
    {
      path: '../assets/fonts/Urbanist-ExtraLight.ttf',
      style: 'extralight', //weight 200
    },
    {
      path: '../assets/fonts/Urbanist-Light.ttf',
      style: 'light', //weight 300
    },
    {
      path: '../assets/fonts/Urbanist-Medium.ttf',
      style: 'medium', //weight 500
    },
    {
      path: '../assets/fonts/Urbanist-SemiBold.ttf',
      style: 'semibold', //weight 600
    },
    {
      path: '../assets/fonts/Urbanist-Bold.ttf',
      style: 'bold', //weight 700
    },
    {
      path: '../assets/fonts/Urbanist-ExtraBold.ttf',
      style: 'extrabold', //weight 800
    },
    {
      path: '../assets/fonts/Urbanist-Black.ttf',
      style: 'blackbold', //weight 900
    },
    {
      path: '../assets/fonts/Urbanist-Regular.ttf',
      style: 'normal', //weight 400
    },
  ],
})

export const metadata: Metadata = {
  title: 'FSN-Admin Portal',
  description: 'Admin portal for FSN',
}

export default function RootLayout({
  children,
}: {
  children: React.ReactNode
}) {
  return (
    <html lang="en">
      <body className={urbanist.className}>
        <ReduxProvider>
            {children}
            <Modal></Modal>
            <Confirm></Confirm>
            <Alert></Alert>
            <Loading></Loading>
            <Sidebar></Sidebar>
            <ImageDetail />
        </ReduxProvider>
      </body>
    </html>
  )
}
