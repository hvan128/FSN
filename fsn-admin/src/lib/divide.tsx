import { BorderColor } from "@/enum/setting";
import { memo } from "react";

const Divide = function Divide() {

  return (
    <div className={`hidden border-b border-dashed lg:block  ${BorderColor.GREY_700}`}></div>
  )
}

export default memo(Divide);