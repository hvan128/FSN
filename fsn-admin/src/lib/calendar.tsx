'use client';

import { BgColor, BorderColor, FontFamily, FontSize, HOVER, TextColor } from '@/enum/setting';
import React, { useMemo, memo, forwardRef, useState, useRef } from 'react';
import Typography from './typography';
import moment from 'moment';
import ArrowBackIosIcon from '@mui/icons-material/ArrowBackIos';
import ArrowForwardIosIcon from '@mui/icons-material/ArrowForwardIos';
import Select, { Item } from './select';

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
}

const Calendar = forwardRef<HTMLDivElement, Props>(
    function DatePicker(
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
            ...args
        },
        ref
    ) {
        const [select, setSelect] = useState<Date | null>(value ?? null);
        const [curDateMonth, setCurDateMonth] = useState<Date>(value ?? new Date());
        const { dates } = useMemo(() => caculateDateOfMonth(curDateMonth ?? new Date()), [curDateMonth]);
        const todayIndex = dates.findIndex((date) => date !== null ? isToday(date) : false);
        const yearList = useMemo(() => {
            let startYear = minDate?.getFullYear();
            const endYear = maxDate?.getFullYear() ?? startYear + 15;
            const list = [];
            while (startYear <= endYear) {
                list.push({
                    value: startYear,
                    label: startYear,
                });
                startYear++;
            }

            return (list);
        }, [minDate, maxDate])

        const handleSelect = (date: Date | null) => {
            if (date !== null && isAvailableDate({ minDate: minDate, maxDate: maxDate }, date)) {
                setSelect(date);
                onSelectDate && onSelectDate(date, true);
            }
        }

        const handleChangeMonth = (type: 'back' | 'next') => {
            setCurDateMonth(pre => {
                const value = new Date();
                if (type === 'back') {
                    pre !== null && value?.setFullYear(pre?.getFullYear(), pre.getMonth() - 1, pre.getDate());
                }
                else {
                    pre !== null && value?.setFullYear(pre?.getFullYear(), pre.getMonth() + 1, pre.getDate());
                }
                return value;
            })
        }

        const renderHeader = () => {
            return (
                <div className={`flex justify-between items-center flex-row gap-10 ${TextColor.PRIMARY_700}`}>
                    <Select
                        options={yearList}
                        selected={curDateMonth.getFullYear()}
                        onSelectItem={(item: Item) => {
                            setCurDateMonth(pre => {
                                const value = new Date();
                                pre !== null && value?.setFullYear(
                                    typeof item.value === 'number' ? item.value : parseInt(item.value as unknown as string),
                                    pre.getMonth(),
                                    pre.getDate()
                                    );
                                return value;
                            })
                        }}
                        altLabel={
                            <Typography
                                textColor={TextColor.PRIMARY_700}
                                fontSize={FontSize.BASE}
                                fontFamily={FontFamily.BOLD}
                            >
                                {moment(curDateMonth).format('MMM YYYY')}
                            </Typography>
                        }
                        className='border-none pl-0 flex items-center !p-0'
                        boxClassName='!m-0 min-w-fit'
                    />
                    <div className='flex justify-between items-center flex-row gap-10'>
                        <div className='w-fit h-fit' onClick={() => handleChangeMonth('back')}>
                            <ArrowBackIosIcon
                                className={`${FontSize.BASE} cursor-pointer`}
                            />
                        </div>
                        <div className='w-fit h-fit' onClick={() => handleChangeMonth('next')}>
                            <ArrowForwardIosIcon
                                className={`${FontSize.BASE} cursor-pointer`}
                            />
                        </div>
                    </div>

                </div>
            )
        }

        const renderWeek = () => {
            return (
                <div className={`border-b-2 ${BorderColor.PRIMARY_400} pb-2`}>
                    <div className='grid grid-cols-7 grid-rows-1 gap-2'>
                        {['S', 'M', 'T', 'W', 'T', 'F', 'S',].map((item, index) => (
                            <div
                                key={index}
                                className={`${TextColor.PRIMARY_400} flex justify-center items-center`}
                            >
                                {item}
                            </div>
                        ))}
                    </div>
                </div>
            )
        }

        const renderDate = () => {
            return (
                <div className='grid grid-cols-7 grid-rows-5 gap-2'>
                    {dates.map((date, index) => !(todayIndex === index) ? (
                        <div
                            key={index}
                            className='flex justify-center items-center'
                        >
                            <p
                                className={`
                                text-center 
                                h-full rounded-full aspect-square 
                                p-1.5 
                                ${(date !== null && isSelected(date, select)) ? `${BgColor.PRIMARY_200} hover:!bg-primary-c200 ${selectClassName}` : ''}
                                ${date !== null ? isAvailableDate({ minDate: minDate, maxDate: maxDate }, date) ? 'cursor-pointer hover:bg-primary-c100' : `${BgColor.GREY_100} ${TextColor.GREY_400} hover:bg-grey-c100` : ''}
                                `}
                                onClick={() => handleSelect(date)}
                            >
                                {date?.getDate()}
                            </p>
                        </div>
                    ) : (
                        <div
                            key={index}
                            className='flex justify-center items-center'
                        >
                            <p
                                className={`
                                ${TextColor.PRIMARY_900} text-center 
                                rounded-full border-[1px] 
                                h-full aspect-square 
                                p-1.5 
                                hover:bg-primary-c100
                                cursor-pointer
                                ${(date !== null && isSelected(date, select)) ? `${BgColor.PRIMARY_200} hover:!bg-primary-c200` : ''}
                                ${date !== null ? isAvailableDate({ minDate: minDate, maxDate: maxDate }, date) ? 'cursor-pointer hover:bg-primary-c100' : `${BgColor.GREY_100} ${TextColor.GREY_400} hover:!bg-none cursor-default` : ''}
                                `}
                                onClick={() => handleSelect(date)}
                            >
                                {date?.getDate()}
                            </p>
                        </div>
                    )
                    )}
                </div>
            )
        }

        return (
            <div
                id={id}
                ref={ref}
                className={`
                flex justify-center items-stretch flex-col gap-3
                min-w-[15rem] 
                p-5 pt-3
                text-sm ${TextColor.PRIMARY_700}
                ${className}
                `}
                {...args}
            >
                {renderHeader()}
                {renderWeek()}
                {renderDate()}
            </div>
        )
    }
)

export default memo(Calendar);

const caculateDateOfMonth = (date: Date) => {
    const currentMonth = date?.getMonth();
    const dates: Array<Date | null> = new Array(42).fill(null);

    const startDate = new Date();
    startDate.setFullYear(date.getUTCFullYear(), currentMonth, 1);
    const endDate = new Date();
    endDate.setFullYear(date.getUTCFullYear(), currentMonth + 1, 0);
    let numberOfDayInMonth = 0;


    // Add following date
    while (startDate.getDate() + numberOfDayInMonth <= endDate.getDate()) {
        const pushDate = new Date(startDate);
        pushDate.setDate(startDate.getDate() + numberOfDayInMonth);
        dates[startDate.getDay() + numberOfDayInMonth] = pushDate;
        numberOfDayInMonth++;
    }

    return {
        numberOfDayInMonth,
        dates,
        startDate,
        endDate,
    }
}

const isToday = (date: Date) => {
    const today = new Date();
    return (
        today.getDate() === date.getDate() &&
        today.getMonth() === date.getMonth() &&
        today.getFullYear() === date.getFullYear()
    )
}

const isAvailableDate = (
    condition: {
        minDate?: Date,
        maxDate?: Date
    },
    date: Date
) => {
    const { minDate, maxDate } = condition;

    if (minDate !== undefined && minDate.getTime() > date.getTime()) {
        return false;
    }

    if (maxDate !== undefined && maxDate.getTime() < date.getTime()) {
        return false;
    }

    return true;
}

const isSelected = (date: Date, selectedDate: Date | null) => {
    return (
        selectedDate?.getDate() === date.getDate() &&
        selectedDate?.getMonth() === date.getMonth() &&
        selectedDate?.getFullYear() === date.getFullYear()
    )
}

const isSameMonth = (date1: Date, date2: Date) => {
    return (
        date1.getMonth() === date2.getMonth() &&
        date1.getFullYear() === date2.getFullYear()
    )
}