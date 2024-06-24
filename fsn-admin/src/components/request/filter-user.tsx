import Button from '@/lib/button';
import TextField from '@/lib/text-field';
import { useFormikContext } from 'formik';
import React, { FC, useState } from 'react';
import { Page } from '@/enum/constants';
import CancelIcon from '@mui/icons-material/Cancel';
import SearchIcon from '@mui/icons-material/Search';

interface FiltersUserProps {
    onChangePage: (page: number) => void;
    onFiltering: () => void;
}

const FiltersUser: FC<FiltersUserProps> = ({ onChangePage, onFiltering }) => {
    const { values, handleSubmit, setFieldValue } = useFormikContext<any>();
    const [customerName, setCustomerName] = useState('');
    const [clientNumber, setClientNumber] = useState('');
    const [cid, setCid] = useState('');
    const [phone, setPhone] = useState('');

    const handleClickCancel = () => {
        setCustomerName('');
        setPhone('');
        setCid('');
        setClientNumber('');
        setFieldValue('customerName', '');
        setFieldValue('phone', '');
        setFieldValue('cid', '');
        setFieldValue('clientNumber', '');
        handleSubmit();
        onFiltering();
    };

    const handleSearch = () => {
        setFieldValue('customerName', customerName);
        setFieldValue('phone', phone);
        setFieldValue('cid', cid);
        setFieldValue('clientNumber', clientNumber);
        handleSubmit()
        onChangePage(Page);
    };
    return (
        <div className="flex flex-col gap-3 py-2">
            <div className="grid lg:grid-cols-4 md:grid-cols-2 sm:grid-cols-1 px-4 gap-4">
                {/* Search by name */}
                <div >
                    <TextField
                        placeholder='Search by name'
                        label='Search by name'
                        type="text"
                        value={customerName ?? values.customerName}
                        onChange={(e: any) => setCustomerName(e.target.value)}
                    />
                </div>
                {/* Search by mobile number */}
                <div >
                    <TextField placeholder='Search by phone number'
                        label='Search by phone number'
                        type="text"
                        value={phone ?? values.phone}
                        onChange={(e: any) => setPhone(e.target.value)}
                    />
                </div>
                {/* Search by CIF no */}
                <div >
                    <TextField placeholder='Search by CIF no'
                        label='Search by CIF no'
                        type="text"
                        value={clientNumber ?? values.clientNumber}
                        onChange={(e: any) => setClientNumber(e.target.value)}
                    />
                </div>
                {/* Search by CID/ID */}
                <div >
                    <TextField placeholder='Search by CID/ID'
                        label='Search by CID/ID'
                        type="text"
                        value={cid ?? values.cid}
                        onChange={(e: any) => setCid(e.target.value)}
                    />
                </div>
            </div>
            <div className="justify-start items-start flex flex-row px-4 gap-4">
                {/* Search button */}
                <Button color="primary" endIcon={<SearchIcon></SearchIcon>}
                    onClick={handleSearch}
                >
                    Search
                </Button>
                {/* Cancel button */}
                <Button color="error" endIcon={<CancelIcon></CancelIcon>}
                    onClick={handleClickCancel}
                >
                    Cancel
                </Button>
            </div>
        </div>
    );
};

export default FiltersUser;
