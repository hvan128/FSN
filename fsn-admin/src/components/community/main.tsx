"use client";
import { FontFamily, FontSize, SCREEN, TextColor } from "@/enum/setting";
import Button from "@/lib/button";
import Divide from "@/lib/divide";
import Typography from "@/lib/typography";
import AddCircleOutlineIcon from "@mui/icons-material/AddCircleOutline";
import FilterListIcon from "@mui/icons-material/FilterList";
import { useDispatch } from "react-redux";
import Product from "./product";
import { useState } from "react";
import Select from "@/lib/select";
import AddProduct from "./modals/add-product";
import { openModal } from "@/redux/slice/modalSlice";
import { refetchComponent } from "@/redux/slice/refetchSlice";

export default function Main() {
  const dispatch = useDispatch();
  const [openFilter, setOpenFilter] = useState(false);
  const [productType, setProductType] = useState("");
  const [productStatus, setProductStatus] = useState("");
  const [productFilter, setProductFilter] = useState<ProductFilterProps>({
    type: "",
    status: "",
  });

  const handleChangeProductType = (item: any) => {
    setProductType(item?.value);
  };

  const handleChangeProductStatus = (item: any) => {
    setProductStatus(item?.value);
  };

  const handleCancelFilter = () => {
    setProductType("");
    setProductStatus("");
    setOpenFilter(false);
    setProductFilter({
      status: "",
      type: "",
    });
  };

  const productTypes = [
    {
      value: "recipes",
      label: "Recipes",
    },
    {
      value: "tips",
      label: "Tips",
    },
  ];

  const listProductStatus = [
    {
      value: "approved",
      label: "Approved",
    },
    {
      value: "rejected",
      label: "Rejected",
    },
    {
      value: "pending",
      label: "Pending",
    },
  ];

  const handleClickSearch = () => {
    setProductFilter({
      type: productType,
      status: productStatus,
    });
    dispatch(refetchComponent());
  };

  const renderSearchComponent = (isOpen: Boolean) => {
    return isOpen ? (
      <div className="flex flex-col gap-3 pb-4">
        {/* Search option */}
        <div className="justify-center items-center flex flex-col lg:flex-row px-4 gap-2 lg:gap-4">
          <div className="flex-1 w-full">
            <Select
              options={productTypes}
              placeholder="Search by product type"
              title="Product type"
              position="bottom"
              onSelectItem={handleChangeProductType}
            ></Select>
          </div>
          <div className="flex-1 w-full">
            <Select
              options={listProductStatus}
              placeholder="Search by product status"
              title="Product status"
              position="bottom"
              onSelectItem={handleChangeProductStatus}
            ></Select>
          </div>
          <div className="flex-1">
            {/* Search button group */}
            <div className="px-4 gap-2 flex-row flex">
              <Button
                color="primary"
                onClick={handleClickSearch}
                endIcon={<AddCircleOutlineIcon></AddCircleOutlineIcon>}
              >
                Search
              </Button>
              <Button
                color="error"
                onClick={handleCancelFilter}
                endIcon={<AddCircleOutlineIcon></AddCircleOutlineIcon>}
              >
                Cancel
              </Button>
            </div>
          </div>
          <div className="flex-1 hidden xl:flex"></div>
        </div>
      </div>
    ) : (
      <></>
    );
  };

  // Open add product modal
  const handleOpenAddProduct = () => {
    const modal = {
      isOpen: true,
      title: "Add product",
      content: <AddProduct></AddProduct>,
      screen: SCREEN.BASE,
    };
    dispatch(openModal(modal));
  };

  return (
    <div className="flex flex-col grow bg-white rounded-2xl px-4 py-4 min-h-[800px]">
      {/* Header */}
      <div className="justify-between items-center flex flex-row py-2">
        <div>
          <Typography
            textColor={TextColor.GREY_700}
            fontSize={FontSize.XL}
            fontFamily={FontFamily.BOLD}
          >
            {" "}
            Product{" "}
          </Typography>
        </div>
        <div>
          <Button
            color="primary"
            endIcon={<AddCircleOutlineIcon></AddCircleOutlineIcon>}
            onClick={handleOpenAddProduct}
          >
            Add product
          </Button>
        </div>
      </div>
      {/* Divider */}
      <Divide></Divide>
      {/* Filter icon */}
      <div className="justify-end items-end flex flex-col py-4 px-4">
        <Button
          color="secondary"
          endIcon={<FilterListIcon></FilterListIcon>}
          onClick={() => setOpenFilter(!openFilter)}
        >
          Filter
        </Button>
      </div>
      {/* Search */}
      {renderSearchComponent(openFilter)}
      {/* Divider */}
      <Divide></Divide>
      {/* Table */}
      <Product filter={productFilter}></Product>
      {/* Divider */}
      <Divide></Divide>
    </div>
  );
}
