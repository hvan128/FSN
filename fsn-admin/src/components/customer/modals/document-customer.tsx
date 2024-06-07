import { useState } from 'react';
import PassportTab from '../tabs/passport-tab';
import LivenessTab from '../tabs/liveness-tab';
import SupportTab from '../tabs/support-doc-tab';
import CidTab from '../tabs/cid-tab';

type Props = {
    customer: any
}
interface TabPanelProps {
    children?: React.ReactNode;
    value?: number;
    index?: number;
}

const TabPanel: React.FC<TabPanelProps> = ({ children, value, index }) => {
    return (
        <div
            role="tabpanel"
            hidden={value !== index}
            id={`simple-tabpanel-${index}`}
            aria-labelledby={`simple-tab-${index}`}
        >
            {value === index && <div>{children}</div>}
        </div>
    );
};


const ViewCustomerDocumentationTab: React.FC<ViewCustomerDocumentationModalProps> = ({ customer }) => {
    const [value, setValue] = useState(0);
    const handleChange = (newValue: number) => {
        setValue(newValue);
    };
    return (
        <div className="p-4">
            <div className="mb-5">
                <button
                    className={`text-sm px-4 py-2 ${value === 0 ? 'bg-primary-c700 text-white rounded-full hover:bg-secondary-c700 ' : 'text-'}`}
                    onClick={() => handleChange(0)}
                >
                    CID/ID tab
                </button>
                <button
                    className={`text-sm px-4 py-2 ${value === 1 ? 'bg-primary-c700 text-white rounded-full  hover:bg-secondary-c700 ' : 'text-grey-c900'}`}
                    onClick={() => handleChange(1)}
                >
                    Passport tab
                </button>
                <button
                    className={`text-sm px-4 py-2 ${value === 2 ? 'bg-primary-c700 text-white rounded-full  hover:bg-secondary-c700' : 'text-'}`}
                    onClick={() => handleChange(2)}
                >
                    Liveness tab
                </button>
                <button
                    className={`text-sm px-4 py-2 ${value === 3 ? 'bg-primary-c700 text-white rounded-full  hover:bg-secondary-c700' : 'text-'}`}
                    onClick={() => handleChange(3)}
                >
                    Supporting documents tab
                </button>
            </div>
            <TabPanel value={value} index={0}>
                <CidTab customer={customer} />
            </TabPanel>
            <TabPanel value={value} index={1}>
                <PassportTab  customer={customer}/>
            </TabPanel>
            <TabPanel value={value} index={2}>
                <LivenessTab  customer={customer}/>
            </TabPanel>
            <TabPanel value={value} index={3}>
                <SupportTab customer={customer} />
            </TabPanel>
        </div>
    );
};

interface ViewCustomerDocumentationModalProps {
    customer?: any;
}
export default function OnboadingCustomerModal({
    customer
}: Props) {
    return (
        <div>
            <ViewCustomerDocumentationTab customer={customer}></ViewCustomerDocumentationTab>
        </div>
    );
}




