'use client';

import { FontSize, TextColor } from '@/enum/setting';
import React, { useMemo, memo, forwardRef, useState, useCallback } from 'react';
import ArrowBackIosIcon from '@mui/icons-material/ArrowBackIos';
import ArrowForwardIosIcon from '@mui/icons-material/ArrowForwardIos';
import dynamic from 'next/dynamic';

type Props = {
    id?: string
    className?: string,
    onSelectDate?: (date: Date, willClose: boolean, ...args: any[]) => any | React.Dispatch<React.SetStateAction<Date | null>>,
    fullWidth?: boolean,
    disabled?: boolean,
    value?: Date | null,
    selectClassName?: string,
    minDate?: Date,
    maxDate?: Date,
    view?: number,
    setView?: (view: number, ...args: Array<any>) => any | React.Dispatch<React.SetStateAction<number>>,
}

// Caculate distance from top center
const caculateDistance = (side: number, angle: number): { x: number, y: number } => {
    return {
        x: side / 2 * Math.sin(angle),
        y: side / 2 * (1 - Math.cos(angle))
    }
}

const listHours = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11].map((it, index) => {
    const position = caculateDistance(192, index * Math.PI / 6);

    return {
        label: it,
        rotate: index * 30,
        ...position
    }
});

const listMinutes = new Array(60).fill(0).map((_, index) => {
    const position = caculateDistance(192, index * Math.PI / 30);
    return {
        label: index,
        rotate: index * 6,
        ...position
    }
});

const Time = forwardRef<HTMLDivElement, Props>(
    function Time(
        {
            id,
            className,
            onSelectDate,
            fullWidth,
            disabled,
            value,
            selectClassName,
            minDate = new Date('01-01-1990'),
            maxDate,
            view,
            setView,
            ...args
        },
        ref
    ) {
        const [select, setSelect] = useState<Date>(value ?? new Date());
        const [isAM, setIsAM] = useState(select.getHours() < 12);
        const [viewTab, setViewTab] = useState<number>(view ?? 0);

        const rotateDeg = useMemo(() => {
            if (viewTab === 0) {
                return (
                    listHours.find(it => select?.getHours() % 12 === it.label)?.rotate ?? 0
                )
            }
            else {
                return (
                    listMinutes.find(it => select?.getMinutes() % 60 === it.label)?.rotate ?? 0
                )
            }
        }, [select, viewTab])

        const handleSelect = (value: number, type: 'hour' | 'minute') => {
            const newDate = new Date(select);
            if (type === 'hour') {
                newDate.setHours(isAM ? value % 12 : value + 12);
                setSelect(newDate);
                onSelectDate && onSelectDate(newDate, false);
                handleChangeView();
            }
            else {
                newDate.setMinutes(value);
                setSelect(newDate);
                onSelectDate && onSelectDate(newDate, true);
            }


        }

        const handleChangeAMPM = (type: 'am' | 'pm') => {
            const newDate = new Date(select);
            if (type === 'am') {
                setIsAM(true);
                newDate.setHours(newDate.getHours() % 12);
                onSelectDate && onSelectDate(newDate, false);
            }
            else {
                setIsAM(false);
                newDate.setHours(newDate.getHours() % 12 + 12);
                onSelectDate && onSelectDate(newDate, false);
            }
        }

        const handleChangeView = () => {
            setViewTab(pre => (pre + 1) % 2);
            setView && setView((viewTab + 1) % 2)
        }

        const renderHeader = () => {
            return (
                <div className={`flex flex-row justify-between items-center gap-10 ${TextColor.PRIMARY_700}`}>
                    <div className={`flex flex-row justify-between items-center gap-5`}>
                        <button
                            type='button'
                            className={`
                            p-2 
                            hover:bg-primary-c100 
                            rounded-full 
                            ${isAM ? 'bg-primary-c700 text-white hover:bg-primary-c700' : ''}
                            `}
                            onClick={() => handleChangeAMPM('am')}
                        >
                            AM
                        </button>
                        <button
                            type='button'
                            className={`
                            p-2 
                            hover:bg-primary-c100 
                            rounded-full 
                            ${!isAM ? 'bg-primary-c700 text-white hover:bg-primary-c700' : ''}
                            `}
                            onClick={() => handleChangeAMPM('pm')}
                        >
                            PM
                        </button>
                    </div>

                    <div className='flex justify-between items-center flex-row gap-10'>
                        <div className='w-fit h-fit' onClick={() => handleChangeView()}>
                            <ArrowBackIosIcon
                                className={`${FontSize.BASE} cursor-pointer`}
                            />
                        </div>
                        <div className='w-fit h-fit' onClick={() => handleChangeView()}>
                            <ArrowForwardIosIcon
                                className={`${FontSize.BASE} cursor-pointer`}
                            />
                        </div>
                    </div>

                </div>
            )
        }

        const renderHours = useCallback(() => {
            return (
                <>
                    {listHours.map((item, index) => (
                        <button
                            key={index}
                            type='button'
                            style={{
                                transform: `translate(${item.x}px, ${item.y}px) translateY(-50%)`
                            }}
                            className={`
                                absolute top-0 
                                p-2
                                justify-center items-center flex 
                                ${select && select?.getHours() % 12 === item.label ? 'text-white' : ''}
                            `}
                            onClick={() => handleSelect(item.label, 'hour')}
                        >
                            {item.label === 0 ? 12 : item.label}
                        </button>
                    ))}
                </>
            )
            // eslint-disable-next-line react-hooks/exhaustive-deps
        }, [select])

        const renderMinutes = useCallback(() => {
            const visibleLabel = [0, 5, 10, 15, 20, 25, 30, 35, 40, 45, 50, 55];

            return (
                <>
                    {listMinutes.map((item, index) => (
                        <button
                            key={index}
                            type='button'
                            style={{
                                transform: `translate(${item.x}px, ${item.y}px) translateY(-50%)`
                            }}
                            className={`
                                absolute top-0 
                                p-2
                                justify-center items-center flex 
                                ${select && select?.getMinutes() % 60 === item.label ? 'text-white' : ''}
                                ${visibleLabel.includes(item.label) ? '' : 'pointer-events-none'}
                            `}
                            onClick={() => handleSelect(item.label, 'minute')}
                        >
                            {
                                visibleLabel.includes(item.label) ?
                                    item.label < 10 ? `0${item.label}` : item.label :
                                    <span className={`aspect-square w-1 rounded-full  ${select && select?.getMinutes() % 60 === item.label ? 'bg-white' : ''}`}></span>
                            }
                        </button>
                    ))}
                </>
            )
            // eslint-disable-next-line react-hooks/exhaustive-deps
        }, [select])

        return (
            <div
                id={id}
                ref={ref}
                className={`
                flex justify-center items-center flex-col gap-3
                min-w-[15rem] 
                p-5 pt-3
                bg-[inherit]
                text-sm ${TextColor.PRIMARY_700}
                ${className}
                `}
                {...args}
            >
                {renderHeader()}
                <div
                    className={`bg-primary-c100 rounded-full p-5 relative`}
                >
                    <div className='w-1.5 aspect-square rounded-full top-1/2 left-1/2 absolute -translate-x-1/2 -translate-y-1/2 bg-primary-c400' />
                    <div
                        className='w-48 aspect-square relative flex items-center justify-center'
                    >
                        <div
                            style={{
                                rotate: `${rotateDeg}deg`
                            }}
                            className='absolute top-0 bottom-1/2 w-[2px] bg-primary-c400 origin-[center_bottom] flex justify-center items-start pointer-events-none'
                        >
                            <div className='absolute h-10 w-10 rounded-full bg-primary-c400 -translate-y-[20px]' />
                        </div>
                        {viewTab === 0 ? renderHours() : renderMinutes()}
                    </div>
                </div>
            </div>
        )
    }
)

export default dynamic(() => Promise.resolve(memo(Time)), { ssr: false });

