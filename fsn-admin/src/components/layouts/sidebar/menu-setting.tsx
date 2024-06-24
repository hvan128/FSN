import SettingsIcon from "@mui/icons-material/Settings";
import DensitySmallIcon from "@mui/icons-material/DensitySmall";
import AdminPanelSettingsIcon from "@mui/icons-material/AdminPanelSettings";
import NotificationImportantIcon from "@mui/icons-material/NotificationImportant";
import PersonIcon from "@mui/icons-material/Person";
import VerifiedUserIcon from "@mui/icons-material/VerifiedUser";
import AppsIcon from "@mui/icons-material/Apps";
import HelpIcon from "@mui/icons-material/Help";
import { ROLES } from "@/enum/constants";
import CategoryIcon from "@mui/icons-material/Category";

const settingItem: Array<MenuItemProps> = [
  {
    id: "app-configuration",
    title: "App configuration",
    type: "item",
    url: "/admin/app-configuration",
    icon: <SettingsIcon></SettingsIcon>,
    roles: [ROLES.SUPER_ADMIN.CODE, ROLES.ROOT_ROLE.CODE],
  },
];
const setting: MenuGroupProps = {
  id: "app-setting",
  title: "Setting",
  type: "group",
  children: settingItem,
};

const manageItem: Array<MenuItemProps> = [
  {
    id: "app-system-user",
    title: "System user",
    type: "item",
    url: "/admin/system-user",
    icon: <AdminPanelSettingsIcon></AdminPanelSettingsIcon>,
    roles: [ROLES.SUPER_ADMIN.CODE, ROLES.ROOT_ROLE.CODE],
  },
  {
    id: "app-announcement-broadcast",
    title: "Announcement",
    type: "item",
    url: "/admin/announcement",
    icon: <NotificationImportantIcon></NotificationImportantIcon>,
    roles: [
      ROLES.SUPER_ADMIN.CODE,
      ROLES.OPERATION_MANAGER.CODE,
      ROLES.ROOT_ROLE.CODE,
    ],
  },
  {
    id: "app-request",
    title: "Request",
    type: "item",
    url: "/admin/request",
    icon: <PersonIcon></PersonIcon>,
    roles: [
      ROLES.SUPER_ADMIN.CODE,
      ROLES.ROOT_ROLE.CODE,
      ROLES.OPERATION_MANAGER.CODE,
    ],
  },
  {
    id: "app-community",
    title: "Community",
    type: "item",
    url: "/admin/community",
    icon: <CategoryIcon></CategoryIcon>,
    roles: [
      ROLES.SUPER_ADMIN.CODE,
      ROLES.OPERATION_MANAGER.CODE,
      ROLES.ROOT_ROLE.CODE,
    ],
  },
  {
    id: "app-whitelist",
    title: "Whitelist",
    type: "item",
    url: "/admin/white-list",
    icon: <VerifiedUserIcon></VerifiedUserIcon>,
    roles: [
      ROLES.SUPER_ADMIN.CODE,
      ROLES.OPERATION_MANAGER.CODE,
      ROLES.ROOT_ROLE.CODE,
    ],
  },
];
const management: MenuGroupProps = {
  id: "app-manage",
  title: "Management",
  type: "group",
  children: manageItem,
};

const otherItem: Array<MenuItemProps> = [
  {
    id: "app-help",
    title: "Help",
    type: "item",
    url: "/help",
    icon: <HelpIcon></HelpIcon>,
    roles: [
      ROLES.SUPER_ADMIN.CODE,
      ROLES.OPERATION_MANAGER.CODE,
      ROLES.ROOT_ROLE.CODE,
    ],
  },
];
const other: MenuGroupProps = {
  id: "other",
  title: "Others",
  type: "group",
  children: otherItem,
};

const menuItems = {
  items: [setting, management, other],
};

export default menuItems;
