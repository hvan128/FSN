"use client"
import SettingsIcon from '@mui/icons-material/Settings';
import AccountCircleIcon from '@mui/icons-material/AccountCircle';
import KeyIcon from '@mui/icons-material/Key';
import LogoutIcon from '@mui/icons-material/Logout';
import Typography from '@/lib/typography';
import { BgColor, FontFamily, FontSize, TextColor } from '@/enum/setting';
import Divide from '@/lib/divide';
import { useEffect, useState } from 'react';
import Button from '../../../lib/button';
import { useDispatch } from 'react-redux';
import { openConfirm } from '@/redux/slice/confirmSlice';
import MenuIcon from '@mui/icons-material/Menu';
import storage from '@/services/storage';
import { LOGOUT } from '@/redux/actions/action';
import Link from 'next/link';
import { openSidebar } from '@/redux/slice/sidebarSlice';

export default function Header() {

  const [open, setOpen] = useState(false);
  const dispatch = useDispatch();
  const [userName, setUsername] = useState('');

  useEffect(() => {
    let userInformation = storage.getUserInforFromLocalStorage();
    setUsername(userInformation?.username)
  }, []);

  const renderGreetingContent = () => {
    const current_time = new Date();
    const hour = current_time.getHours();
    if (hour < 12) {
      return 'Good morning,';
    } else if (12 <= hour && hour < 17) {
      return 'Good afternoon,';
    } else {
      return 'Good evening,';
    }
  };

  // Xử lý bật tắt menu item
  const handleChangeSettingStatus = () => {
    setOpen(!open)
  }

  const handleLogout = () => {
    // Bật Confirm Modal
    let confirm: ConfirmState = {
      isOpen: true,
      title: 'Confirm logout',
      message: 'Are you sure you want to logout your account? All of your data will be permanently removed. This action cannot be undone.',
      feature: LOGOUT
    }
    dispatch(openConfirm(confirm))
  }

  const handleOpenSidebarModal = () => {
    dispatch(openSidebar())
  }

  return (
    <div className="w-full h-[84px] bg-white items-center justify-center flex flex-row p-3">
      {/* Menu icon xuất hiện khi màn hình về kích thước sm hoặc xs từ màn md trở lên sẽ ẩn */}
      <div className="flex-1">
        <div className="pl-4 sm:block xs:block md:hidden w-[100px]" onClick={handleOpenSidebarModal}><MenuIcon fontSize='large' sx={{ color: '#2D7D9F', "&:hover": {
      backgroundColor: "#2D7D9F", color: '#ffffff'
    }, borderRadius: 1}}></MenuIcon></div>
      </div>
      <div className="flex-1 flex flex-row justify-between">
        <div></div>
        {/* Menu item bên phải của header*/}
        <div className="relative inline-block z-40">
          <Button
            onClick={handleChangeSettingStatus}
            id="setting-button"
            endIcon={<SettingsIcon fontSize='medium'></SettingsIcon>}
            aria-expanded={true}
            aria-haspopup={true}
            color='primary'
            type="button"
          >
            Setting
          </Button>
          <div className="absolute right-4 z-10 mt-2 w-60 origin-top-right rounded-md bg-white shadow-lg ring-1 ring-grey-c700 ring-opacity-5 focus:outline-none" hidden={!open}
            role="menu" aria-orientation="vertical" aria-labelledby='setting-button' tabIndex={-1}>
            <div className="py-2" role="none">
              <div className="text-center p-1">
                <Typography textColor={TextColor.PRIMARY_700} fontSize={FontSize.LG} fontFamily={FontFamily.SEMI_BOLD}> {renderGreetingContent()} {userName}</Typography>
              </div>
              <Divide></Divide>
              <Link href="/admin/profile" className="text-primary-c700 block px-4 py-2 text-base font-normal hover:bg-secondary-c100 hover:text-secondary-c700" role="menuitem" tabIndex={-1} id="menu-item-0"> <AccountCircleIcon></AccountCircleIcon> Profile</Link>
              <Link href="/admin/change-password" className="text-primary-c700 block px-4 py-2 text-base font-normal hover:bg-secondary-c100 hover:text-secondary-c700" role="menuitem" tabIndex={-1} id="menu-item-2"> <KeyIcon></KeyIcon> Change password</Link>
              <a onClick={handleLogout} className="text-primary-c700 block px-4 py-2 text-base font-normal hover:bg-secondary-c100 hover:text-secondary-c700 cursor-pointer" role="menuitem" tabIndex={-1} id="menu-item-2"> <LogoutIcon></LogoutIcon> Log out</a>
            </div>
          </div>
        </div>
      </div>
    </div>
  )
}