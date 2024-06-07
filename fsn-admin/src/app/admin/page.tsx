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
      // case ROLES.ROOT_ROLE.CODE:
      //   route = '/admin/app-configuration';
      //   break;
      // case ROLES.IT_ADMIN.CODE:
      //   route = '/admin/app-configuration';
      //   break;
      // case ROLES.SUPER_ADMIN.CODE:
      //   route = '/admin/app-configuration';
      //   break;
      // case ROLES.OPERATION_EXEC.CODE:
      //   route = '/admin/announcement';
      //   break;
      // case ROLES.OPERATION_MANAGER.CODE:
      //   route = '/admin/announcement';
      //   break;
      // case ROLES.COMPLIANCE_OFFICER.CODE:
      //   route = '/admin/announcement';
      //   break;
      // case ROLES.COMPLIANCE_MANAGER.CODE:
      //   route = '/admin/announcement';
      //   break;
      // case ROLES.INCIDENT_COMPLIANCE_MANAGER.CODE:
      //   route = '/admin/logging-ticket';
      //   break;
      // case ROLES.INCIDENT_MANAGER_SUPPORT.CODE:
      //   route = '/admin/logging-ticket';
      //   break;
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
      let defaultPage = initRouteByRoles(userInformation?.adminRole?.code);
      router.replace(defaultPage);
    }
  }, [router]);

  return <div className="w-full"></div>;
}
