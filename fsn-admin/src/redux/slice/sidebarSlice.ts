import { createSlice } from '@reduxjs/toolkit'

const initialState: SidebarState = {
  isOpen: false,
}

export const sidebarSlice = createSlice({
  name: 'sidebar',
  initialState,
  reducers: {
    closeSidebar: (state) => {
      state.isOpen = false
    },
    openSidebar: (state) => {
      state.isOpen = true
    },
  },
})

// Action creators are generated for each case reducer function
export const { openSidebar, closeSidebar } = sidebarSlice.actions

export default sidebarSlice.reducer