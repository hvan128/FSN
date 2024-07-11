type MenuGroupProps = {
    id: string;
    title: string;
    type: string;
    children: Array<MenuItemProps>
}

type MenuItemProps = {
    id: string;
    title: string;
    type: string;
    url: string;
    icon: React.ReactNode
    roles: Array<String>
}

// Alert
type AlertState = {
    isOpen?: boolean,
    title: string,
    message: string,
    type?: "success" | "error" | "information"
}

// Confirm
type ConfirmState = {
    isOpen?: boolean,
    title: string,
    message: string,
    feature: string,
    onConfirm?: () => void,
}

// Modal
type ModalState = {
    isOpen?: boolean,
    title: string,
    content: React.ReactNode,
    screen?: string
}

// Image detail
type ImageDetailState = {
    isOpen?: boolean,
    title: string,
    image: string,
    screen?: string
}

type SidebarState = {
    isOpen?: boolean,
}

type SystemUserFilterProps = {
    username: string
    phone: string
    email: string
}

type ProductFilterProps = {
    status: string
    type: string
}

type RequestFilterProps = {
    status: string
}

type RequestProps = {
    id: string
    name: string
    description: string
    status: string
    createdAt: string
    updatedAt: string
}

//Product type
type ProductProps = {
    label: string
    description: string
    createdAt: string
    id: string
    image: string
    name: string
    cookingTime: string
    type: string,
    steps: Array<any>,
    ingredients: Array<any>,
    rangeOfPeople: string,
    owner: UserModel,
    updatedAt: string,
    status: string
}

type UserModel = {
    id: number,
    username: string,
    email: string,
    imageUrl: string,
    displayName: string,
    description: string,
    address: string,
    phone: string,
    birthday: string,
    gender: string,
    fcmToken: string,
}

type FilterOptions = {
    page?: number,
    perPage?: number,
    sortField?: string,
    sortOrder?: null | 'desc' | 'asc',
}

type RecordWhitelistFilterProps = {
    cid: string
    phone: string
    status: string
}

type AnnouncementFilterProps = {
    title: string
}