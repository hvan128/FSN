import storage from "@/services/storage";
import Link from "next/link";
import { useEffect, useState } from "react";
import { usePathname } from 'next/navigation';
import { closeSidebar } from "@/redux/slice/sidebarSlice";
import { useDispatch } from "react-redux";

type Props = {
    items: Array<MenuItemProps>
}

export default function ListItem({ items }: Props) {

    const [adminRole, setAdminRole] = useState('ROOT_ROLE');
    const pathname = usePathname();
    const dispatch = useDispatch();

    // useEffect(() => {
    //     let userInformation = storage.getUserInforFromLocalStorage();
    //     setAdminRole(userInformation?.adminRole?.code);
    // }, []);

    const handleCloseSidebar = () => {
        dispatch(closeSidebar());
    }

    const listItems = items.map((item, key) => {
        // Kiểm tra xem người dùng có quyền hay không
        if (item.title !== '' && item.roles.includes(adminRole)) {
            //Kiểm tra active function
            return pathname === item.url ?  (
                <Link href={item.url} onClick={handleCloseSidebar} className="text-secondary-c700 hover:bg-secondary-c100" key={key}>
                    <span className="select-none flex items-center px-4 py-[.5rem] cursor-pointer my-[.5rem] rounded-[.95rem]">
                        {item.icon}
                        <div className="flex items-center px-4 flex-grow text-base dark:text-neutral-400/75">{item.title}</div>
                    </span>
                </Link>
            ) : (
                <Link href={item.url} onClick={handleCloseSidebar} className="text-primary-c700 hover:bg-secondary-c100 hover:text-secondary-c700 " key={key}>
                    <span className="select-none flex items-center px-4 py-[.5rem] cursor-pointer my-[.5rem] rounded-[.95rem]">
                        {item.icon}
                        <div className="flex items-center px-4 flex-grow text-base dark:text-neutral-400/75">{item.title}</div>
                    </span>
                </Link>
            )
        }
    });

    return (
        <div>
            {listItems}
        </div>
    )
}