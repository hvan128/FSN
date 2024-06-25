export const ROLES = {
  ROOT_ROLE: {
    ID: "1",
    NAME: "Root Role",
    CODE: "ROOT_ROLE",
  },
  SUPER_ADMIN: {
    ID: "2",
    NAME: "Super Admin",
    CODE: "SUPER_ADMIN",
  },
  OPERATION_MANAGER: {
    ID: "3",
    NAME: "Operation Manager",
    CODE: "MANAGER",
  },
};

export const Page = 0;
export const Limit = 5;
export const rowsPerPage = 25;
export const maxImageSize = 5 * 1024 * 1024;
export const optionRowsPerPage = [5, 25, 50, 100, 200];
export const SortField = "createdAt";
export const SortOrder = "DESC";

export const ImageFileType = ["image/jpg", "image/jpeg", "image/png"];
