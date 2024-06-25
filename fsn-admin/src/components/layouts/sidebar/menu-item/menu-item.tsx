import { FontFamily, FontSize, TextColor } from "@/enum/setting";
import Typography from "@/lib/typography";
import menuItems from "../menu-setting";
import ListItem from "./list-item/list-item";
import { useEffect, useState } from "react";
import storage from "@/services/storage";
import { ROLES } from "@/enum/constants";

export default function MenuItem() {
  const [adminRole, setAdminRole] = useState('');
  const menu = menuItems.items;

  useEffect(() => {
    let userInformation = storage.getUserInforFromLocalStorage();
    setAdminRole(userInformation?.role);
  }, []);

  const menus = menu.map((item: MenuGroupProps, index) => {
    if (item.title !== '') {
      return  (item.id === "app-setting" && [ROLES.SUPER_ADMIN.CODE,
          ROLES.ROOT_ROLE.CODE].includes(adminRole) || item.id !== "app-setting") ? (
          <div key={index}>
              <div className="block pt-5 pb-[.15rem]">
                  <div className="px-4 py-[.2rem]">
                      <Typography textColor={TextColor.GREY_800} fontSize={FontSize.LG} fontFamily={FontFamily.BOLD}>{item.title}</Typography>
                  </div>
              </div>
              <ListItem items={item.children}></ListItem>
          </div>
      ) : (<div key={index}></div>)
    } else {
      <div key={index}>
        <ListItem items={item.children}></ListItem>
      </div>;
    }
  });

  return (
    <div className="relative pl-3 my-2">
      <div className="flex flex-col w-full font-semibold">{menus}</div>
    </div>
  );
}
