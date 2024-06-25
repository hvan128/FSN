import Image from "next/image";
import CloseIcon from "@mui/icons-material/Close";
import PhotoCameraBackIcon from "@mui/icons-material/PhotoCameraBack";
import { BgColor, BorderColor, FontFamily, FontSize, TextColor } from "@/enum/setting";
import { ChangeEvent, MouseEvent } from "react";
import Typography from "./typography";

type InputImage = {
  id: string;
  name: string;
  previewImage: string;
  width?: string;
  height?: string;
  rounded?: string;
  onChange?: (event: ChangeEvent<HTMLInputElement>) => void;
  onDeleteImage?: (event: MouseEvent<HTMLDivElement>) => void;
  onClick?: () => void;
  error?: boolean;
  helperText?: string;
};

export default function InputImage({
  id,
  name,
  previewImage,
  onChange,
  width = "!w-[250px]",
  height = "!h-[250px]",
  rounded = "!rounded-2xl",
  onDeleteImage,
  onClick,
  error,
  helperText,
}: InputImage) {
  return (
    <div className="flex flex-col px-8 items-center">
      {previewImage && (
        <div className="relative">
          <Image
            alt="Announcement"
            unoptimized
            loader={() => previewImage}
            src={previewImage}
            width="0"
            height="0"
            className={`w-auto ${height} ${rounded}`}
            onClick={onClick}
          ></Image>
          <div
            onClick={onDeleteImage}
            className={`absolute top-[-10px] right-[-34px] hover:opacity-80 rounded-full hover:cursor-pointer hover:${BgColor.GREY_100} px-2 py-1`}
          >
            <CloseIcon
              style={{ color: "black", width: "16px", height: "16px" }}
            />
          </div>
        </div>
      )}
      {!previewImage && (
        <div
          onClick={() => document.getElementById(`${id}`)?.click()}
          className={`${width} ${height} ${rounded} border-[2px] ${
            error ? BorderColor.SUPPORT_900 : BorderColor.GREY_200
          } flex flex-col justify-center items-center hover:cursor-pointer hover:${BgColor.GREY_50}`}
        >
          <PhotoCameraBackIcon
            style={{
              width: "50px",
              height: "50px",
            }}
            className={`${error ? TextColor.SUPPORT_900 : TextColor.GREY_200}`}
          />
          <div
            className={`${error ? TextColor.SUPPORT_900 : TextColor.GREY_400} ${
              FontSize.BASE
            }`}
          >
            No file chosen!
          </div>
        </div>
      )}
      <div className="px-8 items-center hidden">
        <input
          type="file"
          accept="image/*"
          id={id}
          name={name}
          onChange={onChange}
        />
      </div>
      <div className="flex flex-col px-8 py-1 items-center">
        {error ? (
          <Typography
            fontFamily={FontFamily.NORMAL}
            fontSize={FontSize.SM}
            textColor={TextColor.SUPPORT_900}
          >
            {helperText}
          </Typography>
        ) : (
          <></>
        )}
      </div>
    </div>
  );
}
