import React, { useMemo } from "react";
import ChevronLeftIcon from '@mui/icons-material/ChevronLeft';
import NavigateNextIcon from '@mui/icons-material/NavigateNext';
import { BgColor, TextColor, } from "@/enum/setting";
import { Page, optionRowsPerPage } from "@/enum/constants";
import Button from "./button";
import { Tooltip } from "@mui/material";

type Props = {
  page: number,
  handlePageChange: Function,
  rowsPerPage: number,
  total: number,
  handleRowPerPageChange: Function
}

export const Pagingation = ({ page, handlePageChange, rowsPerPage, total, handleRowPerPageChange }: Props) => {
  const totalPages = useMemo(() => Math.floor(total / rowsPerPage), [total, rowsPerPage]);

  const optionRowPerPageList = optionRowsPerPage.map((item, index) => {
    return (
      <option value={item} key={index}>{item}</option>
    )
  });

  return (
    <div className="flex items-center justify-between border-t border-grey-c700 px-4 py-3 sm:px-6">
      <div className="flex  w-full items-center justify-between">
        {/* Giao diện cho màn xs */}
        <div className="flex w-full justify-between sm:hidden">
          <Button className={`w-[82px] 
         ${page === Page ? `
             ${BgColor.GREY_100}
             ${TextColor.WHITE}         ` : `
             focus:scale-105 hover:scale-105 
             `}`}
            color="info"
            onClick={() => handlePageChange(page - 1)}
            disabled={page === Page}
          >Previous</Button>
          <Button className={`w-[82px]
         ${page === totalPages ? `
             ${BgColor.GREY_100}
             ${TextColor.WHITE}
         ` : `focus:scale-105 hover:scale-105`}`}
            onClick={() => handlePageChange(page + 1)}
            disabled={page === totalPages}
          >Next</Button>
        </div>
        {/* Giao diện cho màn sm trở lên */}
        <div className="flex-row gap-2 justify-center items-center md:flex xs:hidden">
          <div>Rows per page:</div>
          <select className=" border rounded-md active:border-grey-c400 border-primary-c800"
            value={rowsPerPage}
            onChange={(e) => {
              handleRowPerPageChange(e)
            }}                >
            {optionRowPerPageList}
          </select>
        </div>
        {/* Pagination links */}
        <nav className=" xs:hidden sm:flex isolate items-center inline-flex -space-x-px rounded-md gap-8" aria-label="Pagination">
          <div className="isolate inline-flex items-center rounded-md shadow-sm gap-4">
            {/* Previous button */}
            <Tooltip title="Previous">
              <span>
                <button disabled={page === Page} onClick={() => handlePageChange(page - 1)} className="relative inline-flex items-center rounded-l-md px-2 py-2 text-grey-c900 ring-1 ring-inset ring-grey-c300 hover:bg-primary-c100 focus:z-20 focus:outline-offset-0 disabled:bg-grey-c100">
                  <span className="sr-only">Previous</span>
                  <ChevronLeftIcon color="inherit" fontSize="small"></ChevronLeftIcon>
                </button>
              </span>
            </Tooltip>
            <div className="xs:hidden sm:block">
              Showing
              <span className="font-bold text-primary-c700"> {total !== 0 ? page + 1 : page} </span>
              to
              <span className="font-bold text-primary-c700"> {` ${total % rowsPerPage === 0 ? Math.floor(total / rowsPerPage) : Math.floor(total / rowsPerPage) + 1} `}
              </span>
              of <span className="font-bold text-primary-c700"> {total} </span> results
            </div>
            {/* Next button */}
            <Tooltip title="Next">
              <span>
                <button disabled={page === totalPages} onClick={() => handlePageChange(page + 1)} className="relative inline-flex items-center rounded-r-md px-2 py-2 text-grey-c900 ring-1 ring-inset ring-grey-c300 hover:bg-primary-c100 focus:z-20 focus:outline-offset-0 disabled:bg-grey-c100">
                  <span className="sr-only">Next</span>
                  <NavigateNextIcon color="inherit" fontSize="small"></NavigateNextIcon>
                </button>
              </span>
            </Tooltip>
          </div>
        </nav>
      </div>
    </div>
  );
};


