import { FontFamily, FontSize, TextColor } from "@/enum/setting";
import Typography from "@/lib/typography";
import menuItems from "../menu-setting";
import ListItem from "./list-item/list-item";
import { useEffect, useState } from "react";
import storage from "@/services/storage";

export default function MenuItem() {
  const [adminRole, setAdminRole] = useState('ROOT_ROLE');
  const menu = menuItems.items;

  // useEffect(() => {
  //   let userInformation = storage.getUserInforFromLocalStorage();
  //   setAdminRole(userInformation?.adminRole?.code);
  // }, []);

  const menus = menu.map((item: MenuGroupProps, index) => {
    if (item.title !== "") {
      // kiểm tra xem nếu không phải là 3 quyền lớn thì không show Title Settings
      return (
          <div key={index}>
            <div className="block pt-5 pb-[.15rem]">
              <div className="px-4 py-[.2rem]">
                <Typography
                  textColor={TextColor.GREY_800}
                  fontSize={FontSize.LG}
                  fontFamily={FontFamily.BOLD}
                >
                  {item.title}
                </Typography>
              </div>
            </div>
            <ListItem items={item.children}></ListItem>
          </div>
      );
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
