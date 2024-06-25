'use client';
import { useEffect, useState } from 'react';
import { FontFamily, FontSize, TextColor } from '@/enum/setting';
import Divide from '@/lib/divide';
import TextField from '@/lib/text-field';
import Typography from '@/lib/typography';
import storage from '@/services/storage';
import Image from 'next/image';

export default function Main() {
  const [userInfo, setUserInfo] = useState({
    name: '',
    role: '',
    email: '',
    phone: '',
    username: ''
  });

  useEffect(() => {
    const data = storage.getUserInforFromLocalStorage();
    if (data) {
      setUserInfo({
        name: data.name,
        role: data.role,
        email: data.email,
        phone: data.phone,
        username: data.username
      });
    }
  }, []);

  return (
    <div className="flex flex-col grow bg-white rounded-2xl px-4 py-4">
      {/* Header */}
      <div className="justify-between items-center flex flex-row py-2">
        <Typography
          textColor={TextColor.GREY_700}
          fontSize={FontSize.XL}
          fontFamily={FontFamily.BOLD}
        >
          Profile
        </Typography>
      </div>
      {/* Divider */}
      <Divide />
      <div className="flex flex-col justify-center items-center gap-2 my-4">
        <div className="flex flex-col justify-center items-center gap-2 mb-3">
          <Image
            alt="avatar"
            src={'/avatar1.png'}
            width={150}
            height={150}
            className="rounded-full"
          />
          <Typography fontFamily={FontFamily.BOLD} fontSize={FontSize.XL}>
            {userInfo.name}
          </Typography>
        </div>
        <div className="w-2/3 grid xl:grid-cols-2 xs:grid-cols-1 gap-4">
          <TextField label="Username" value={userInfo.username} disabled={true} placeholder="Username" />
          <TextField label="Phone" value={userInfo.phone || ''} disabled={true} placeholder="Phone" />
          <TextField label="Email Address" value={userInfo.email} disabled={true} placeholder="Email" />
          <TextField label="User Role" value={userInfo.role} disabled={true} placeholder="User role" />
        </div>
      </div>
    </div>
  );
}
