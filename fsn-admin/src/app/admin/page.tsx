"use client";
import { ROLES } from "@/enum/constants";
import storage from "@/services/storage";
import { useRouter } from "next/navigation";
import { useEffect } from "react";

export default function Dashboard() {
  const router = useRouter();

  const initRouteByRoles = (role: string) => {
    let route = "/admin";
    switch (role) {
      case ROLES.ROOT_ROLE.CODE:
        route = '/admin/app-configuration';
        break;
      case ROLES.SUPER_ADMIN.CODE:
        route = '/admin/app-configuration';
        break;
      case ROLES.OPERATION_MANAGER.CODE:
        route = '/admin/community';
        break;
      default:
        route = "/admin";
    }
    return route;
  };

  useEffect(() => {
    let userInformation = storage.getUserInforFromLocalStorage();
    console.log(userInformation);
    if (!userInformation) {
      router.replace("/login");
    } else {
      console.log(userInformation?.role);
      let defaultPage = initRouteByRoles(userInformation?.role);
      console.log(defaultPage);
      router.replace(defaultPage);
    }
  }, [router]);

  return <div className="w-full"></div>;
}
