import { rowsPerPage } from '@/enum/constants';
import Button from '@/lib/button';
// import { GET_LIST_CUSTOMER_CID } from '@/services/customer';
import { fDateTime } from '@/utils/function';
// import { useLazyQuery } from '@apollo/client';
import DriveFolderUploadIcon from '@mui/icons-material/DriveFolderUpload';
import { useEffect, useState } from 'react';
import { useDispatch } from 'react-redux';
import { Pagingation } from '@/lib/pagingation';
import Divide from '@/lib/divide';
import Image from 'next/image';
import CancelIcon from '@mui/icons-material/Cancel';
import { openImageDetail } from '@/redux/slice/imageDetailSlice';
import Skeleton from '@/lib/skeleton';
import { FontFamily, FontSize, SCREEN } from '@/enum/setting';


const headCells = [
    {
        id: '0',
        disablePadding: true,
        label: 'No',
        value: 'id'
    },
    {
        id: '1',
        disablePadding: true,
        label: 'LIVENESS IMAGE',
        value: 'livenessImg'
    },
    {
        id: '2',
        disablePadding: false,
        label: 'SUBMIT DATE & TIME',
        value: 'createdAt'
    },
    {
        id: '3',
        disablePadding: false,
        label: 'SUBMIT FOR',
        value: 'submitFor'
    },
    {
        id: '4',
        disablePadding: false,
        label: 'SUBMITTED/UPDATED BY',
        value: 'adminSubmit'
    },
];


export default function LivenessTab({ customer }: any) {
    const dispatch = useDispatch();
    const [listLiveness, setListLiveness] = useState([]);
    // const [GetListCustomerCid, { loading }] = useLazyQuery(GET_LIST_CUSTOMER_CID, {
    //     fetchPolicy: 'network-only',
    // });
    const [update, setUpdate] = useState(false);
    const [isRefetch, setIsRefetch] = useState(false);
    const [page, setPage] = useState(0);
    const [total, setTotal] = useState(0);
    const [perPage, setRowsPerPage] = useState<any>(rowsPerPage);

    const onFilterAndSort = async (values?: any) => {
        // const responseFront = await GetListCustomerCid(
        //     {
        //         variables: {
        //             customerId: Number(customer?.id),
        //             filter: {
        //                 docType: 'LIVENESS',
        //             },
        //             options: {
        //                 page: page + 1,
        //                 perPage: perPage,
        //             },
        //         }
        //     }
        // ).catch((error: any) => {
        // });

        // const frontList = responseFront?.data.GetListCustomerDocsByCustomer?.items ?? [];
        // setListLiveness(frontList);
        // setTotal(responseFront?.data.GetListCustomerDocsByCustomer?.total ?? 0);
    };

    useEffect(() => {
        try {
            onFilterAndSort();
        } catch (error) { }
        // eslint-disable-next-line react-hooks/exhaustive-deps
    }, [isRefetch, page, perPage]);


    const onUpdate = () => {
        setUpdate(true);
    }

    const onCancel = () => {
        setUpdate(false);
    }
    const refetch = () => {
        setIsRefetch(!isRefetch)
    }
    const handlePageChange = (page: number) => {
        setPage(page);
    };
    const handleRowPerPageChange = (e: any) => {
        setRowsPerPage(parseInt(e.target.value));
    };
    const handleOpenImageDetail = (image: string) => {
        dispatch(openImageDetail({
            isOpen: true,
            title: 'Image detail',
            image: image,
            screen: SCREEN.BASE
        }))
    }
    return (
        <Skeleton loading={false}>
            <div>
                <div className='flex justify-end'>
                    {!update ? <Button
                        variant='contained'
                        endIcon={<DriveFolderUploadIcon />}
                        color='secondary'
                        onClick={onUpdate}
                    >
                        Upload
                    </Button> :
                        <Button onClick={onCancel} color='error' endIcon={<CancelIcon />}
                        >Cancel</Button>}
                </div>
                {!update &&
                    <div>
                        <div className="py-6">
                            <div className='max-w-[100%] rounded-[10px] overflow-hidden'>
                                <div className='overflow-x-auto'>
                                    <table className="table-auto w-full text-base text-left text-grey-c700">
                                        <thead className={`text-grey-c700 uppercase bg-primary-c100 ${FontFamily.BOLD} ${FontSize.BASE}`}>
                                            <tr className="hover:bg-secondary-c100 hover:text-grey-c700">
                                                {headCells.map((item: any, index: any) => {
                                                    if(index === 0) {
                                                        return <th key={item.id} className="pl-3 py-4">{item.label}</th>
                                                    }
                                                    else return <th key={item.id} className="px-1 py-4">{item.label}</th>
                                                })}
                                            </tr>
                                        </thead>
                                        <tbody>
                                            {listLiveness.length > 0 && listLiveness.map((item: any, index: any) => (
                                                <tr className="hover:bg-primary-c50 hover:text-grey-c700" key={item.id}>
                                                    <td className="pl-3 py-4">
                                                        {page * perPage + index + 1}
                                                    </td>
                                                    <td className="px-1 py-4">
                                                        <Image 
                                                        alt="docLink" 
                                                        loader={() => item.docLink} 
                                                        onClick={()=>handleOpenImageDetail(item.docLink)}
                                                        src={item.docLink}                                          
                                                        unoptimized
                                                        width="0"
                                                        height="0"
                                                        className="w-[200px] h-auto rounded-lg cursor-pointer"
                                                        ></Image>
                                                    </td>
                                                    <td className="px-1 py-4">
                                                        {item?.createdAt
                                                            ?
                                                            fDateTime(item.createdAt)
                                                            : ''}                      </td>
                                                    <td className="px-1 py-4">
                                                        {item?.submitFor}                      </td>
                                                    <td className="px-1 py-4">
                                                        {item?.adminSubmit?.username}
                                                    </td>
                                                </tr>
                                            ))}
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                        {/* Paginate */}
                        <Pagingation
                            page={page}
                            handlePageChange={handlePageChange}
                            handleRowPerPageChange={handleRowPerPageChange}
                            total={total}
                            rowsPerPage={perPage}
                        />
                        {/* Divider */}
                        <Divide></Divide>
                    </div>
                }
            </div>
          
        </Skeleton>
    );
}
