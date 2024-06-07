"use client";
import RecommendIcon from "@mui/icons-material/Recommend";
import Typography from "@/lib/typography";
import { FontFamily, FontSize, TextColor } from "@/enum/setting";
import CloseIcon from "@mui/icons-material/Close";
import { useDispatch, useSelector } from "react-redux";
import type { RootState } from "../../redux/store";
import { closeConfirm } from "@/redux/slice/confirmSlice";
import CheckIcon from '@mui/icons-material/Check';
import { DELETE_SYSTEM_USER, RESET_PASSWORD_SYSTEM_USER, LOGOUT, CHANGE_PRODUCT_STATUS, DELETE_PRODUCT, CONFIRM_CONTACT_US, CONFIRM_UPDATE_VERSION, CONFIRM_OTHERS_UPDATE, CONFIRM_APP_MAINTENANCE, CONFIRM_SUPEND_CUSTOMER, CONFIRM_RESET_CUSTOMER_PASSWORD, DELETE_ASSESSMENT_LCY, CREATE_WHITELIST_RECORD, CLOSE_TICKET } from '@/redux/actions/action';
import storage from '@/services/storage';
import { useRouter } from 'next/navigation';

export default function Confirm() {
  const confirmData = useSelector((state: RootState) => state.confirm);
  const dispatch = useDispatch();
  const router = useRouter();

  const handleCloseAlert = () => {
    dispatch(closeConfirm());
  };

  const handleConfirm = () => {
    if (confirmData.onConfirm) {
      confirmData.onConfirm();
    }
    switch (confirmData.feature) {
      case LOGOUT:
        storage.clearLocal();
        router.replace('/login');
        dispatch(closeConfirm());
        break;
      case DELETE_SYSTEM_USER:
        dispatch(closeConfirm());
        break;
      case RESET_PASSWORD_SYSTEM_USER:
        dispatch(closeConfirm());
        break;
      case CHANGE_PRODUCT_STATUS:
        dispatch(closeConfirm());
        break;
      case DELETE_PRODUCT:
        dispatch(closeConfirm());
        break;
      case CREATE_WHITELIST_RECORD:
        dispatch(closeConfirm());
        break;
      case CONFIRM_CONTACT_US:
        dispatch(closeConfirm());
        break;
      case CONFIRM_UPDATE_VERSION:
        dispatch(closeConfirm());
        break;
      case CONFIRM_OTHERS_UPDATE:
        dispatch(closeConfirm());
        break;
      case CONFIRM_APP_MAINTENANCE:
        dispatch(closeConfirm());
        break;
      case CONFIRM_SUPEND_CUSTOMER:
        dispatch(closeConfirm());
        break;
      case CONFIRM_RESET_CUSTOMER_PASSWORD:
        dispatch(closeConfirm());
        break;
      case DELETE_ASSESSMENT_LCY:
        dispatch(closeConfirm());
        break;
      case CLOSE_TICKET:
        dispatch(closeConfirm());
        break;
      default:
        dispatch(closeConfirm());
        break;
    }
  }

  return (
    <div
      className="relative z-50"
      aria-labelledby="modal-title"
      role="dialog"
      aria-modal="true"
      hidden={!confirmData.isOpen}
    >
      <div className="fixed inset-0 z-50 w-screen overflow-y-auto pointer-events-none">
        <div className="flex min-h-full items-start justify-center p-4 text-center sm:items-start sm:p-0">
          <div className="relative transform overflow-hidden rounded-lg text-left shadow-xl transition-all sm:my-8 sm:w-full sm:max-w-lg pointer-events-auto">
            <div className="bg-white px-4 pb-4 pt-5 sm:p-4 sm:pb-4">
              <div className="sm:flex sm:items-start">
                <div className="mx-auto flex h-12 w-12 flex-shrink-0 items-center justify-center rounded-full sm:mx-0 sm:h-10 sm:w-10">
                  <RecommendIcon fontSize="large" color="error"></RecommendIcon>
                </div>
                <div className="mt-3 text-center sm:ml-4 sm:mt-0 sm:text-left">
                  <Typography
                    fontSize={FontSize.BASE}
                    fontFamily={FontFamily.BOLD}
                    textColor={TextColor.SUPPORT_900}
                  >
                    {confirmData.title}
                  </Typography>
                  <div className="mt-2">
                    <Typography
                      fontSize={FontSize.SM}
                      fontFamily={FontFamily.SEMI_BOLD}
                      textColor={TextColor.SUPPORT_800}
                    >
                      {confirmData.message}
                    </Typography>
                  </div>
                </div>
              </div>
            </div>
            <div className="bg-grey-c50 px-4 py-3 gap-2 sm:flex sm:flex-row-reverse sm:px-6 pointer-events-auto">
              <button
                type="button"
                onClick={handleCloseAlert}
                className="mt-3 inline-flex justify-center items-center rounded-3xl bg-white px-4 py-2 text-sm font-semibold text-grey-c700 shadow-sm hover:bg-support-300 sm:mt-0 sm:w-auto"
              >
                Close
                <CloseIcon fontSize="medium"></CloseIcon>
              </button>
              <button
                type="button"
                onClick={handleConfirm}
                className="mt-3 inline-flex justify-center items-center rounded-3xl bg-support-c900 px-4 py-2 text-sm font-semibold text-white shadow-sm hover:bg-support-c800 sm:mt-0 sm:w-auto"
              >
                Confirm
                <CheckIcon fontSize="medium"></CheckIcon>
              </button>
            </div>
          </div>
        </div>
      </div>
      <div className="fixed inset-0 transition-opacity blur-sm bg-white/40 z-10"></div>
    </div>
  );
}
