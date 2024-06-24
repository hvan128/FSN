import { useState, FormEvent } from "react";
import { Save } from "@mui/icons-material";
import { validatePhoneBhutan } from "@/utils/regex";
import { closeModal } from "@/redux/slice/modalSlice";
import { useDispatch } from "react-redux";
import Button from "@/lib/button";
import TextField from "@/lib/text-field";
import Select from "@/lib/select";
import { openAlert } from "@/redux/slice/alertSlice";
import { closeLoading, openLoading } from "@/redux/slice/loadingSlice";
interface UpdatePhoneCustomerModalProps {
  customerId: string;
  refetchAllCustomers: Function,
}

interface PhoneNumberError {
  error: boolean;
  errorText: string;
}

export default function UpdatePhoneCustomerModal({
  customerId,
  refetchAllCustomers
}: UpdatePhoneCustomerModalProps) {
  const [newPhoneNumber, setNewPhoneNumber] = useState('');
  const [confirmPhoneNumber, setConfirmPhoneNumber] = useState('');
  const [errorNewPhone, setErrorNewPhone] = useState<PhoneNumberError>({ error: false, errorText: '' });
  const [errorConfirm, setErrorConfirm] = useState<PhoneNumberError>({ error: false, errorText: '' });
  const dispatch = useDispatch();
  const [phoneCode, setPhoneCode] = useState<any>({ value: '975', label: 'Bhutan' });
 

  const handleNewPhoneNumberChange = (e: any) => {
    setNewPhoneNumber(e.target.value);
    setErrorNewPhone({ error: false, errorText: '' });
    setErrorConfirm({ error: false, errorText: '' });

  };

  const handleConfirmPhoneNumberChange = (e: any) => {
    setConfirmPhoneNumber(e.target.value);
    setErrorConfirm({ error: false, errorText: '' });
    setErrorNewPhone({ error: false, errorText: '' });

  };

  const handleSubmit = async (e: FormEvent) => {
    e.preventDefault();

    if (newPhoneNumber === confirmPhoneNumber) {
      if (
        (validatePhoneBhutan().test(newPhoneNumber) && phoneCode?.value === '975') ||
        phoneCode?.value !== '975'
      ) {
        const variables = {
          updateCustomerId: parseInt(customerId, 10),
          updateCustomerDto: {
            phone: `${phoneCode?.value}${newPhoneNumber}`,
            phoneCode: phoneCode?.value,
          },
        };
        try {
          dispatch(openLoading())
          setPhoneCode(null);
          setNewPhoneNumber('');
          setConfirmPhoneNumber('');

          let alert: AlertState = {
            isOpen: true,
            title: 'UPDATE PHONE',
            message: `Update customer's phone number successfully!`,
            type: 'success'
          }
          dispatch(openAlert(alert));
          refetchAllCustomers();
        } catch (error: any) {

        } finally {
          dispatch(closeModal());
          dispatch(closeLoading());
        }
      } else {
        setErrorNewPhone({
          error: true,
          errorText: 'Please enter a valid number starting from 16 or 17 or 77 and a total of 8 digits',
        });
      }
    } else {
      setErrorNewPhone({
        error: true,
        errorText: 'Please enter a valid number starting from 16 or 17 or 77 and a total of 8 digits',
      });

    }
  };

  return (
    <div>
      <div className=" pb-6 pt-10 flex flex-col justify-center items-center gap-4 w-full px-[10%]">

        {/* New phone number */}
        <div className="w-full">
          <TextField
            type="text"
            name="newPhoneNumber"
            className={`w-full ${errorNewPhone.error ? 'border-red-500' : ''}`}
            placeholder={`Enter you new phone`}
            value={newPhoneNumber}
            label="New phone number"
            onChange={handleNewPhoneNumberChange}
            
            error={errorNewPhone.error}
            helperText={errorNewPhone.errorText}
          />
        </div>
        {/* Confirm phone number */}
        <div className="w-full">
          <TextField
            type="text"
            name="confirmPhoneNumber"
            className={`w-full ${errorConfirm.error ? 'border-red-500' : ''}`}
            placeholder={`Confirm your new phone`}
            value={confirmPhoneNumber}
            onChange={handleConfirmPhoneNumberChange}
            
            label="Confirm phone number"
            error={errorConfirm.error}
            helperText={errorConfirm.errorText}
          />
        </div>
      </div>
      <div className="bg-grey-c50 px-4 py-3 gap-2 sm:flex sm:flex-row-reverse sm:px-6 pointer-events-auto">
        <Button
          disabled={newPhoneNumber === '' || confirmPhoneNumber === ''}
          onClick={handleSubmit}
        >
          <Save />
          <span className="ml-1">Submit</span>
        </Button>
      </div>
    </div>
  );
}
