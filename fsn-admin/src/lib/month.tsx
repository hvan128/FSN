'use client';

import { BgColor, BorderColor, FontFamily, FontSize, HOVER, TextColor } from '@/enum/setting';
import React, { useMemo, memo, forwardRef, useState, useRef } from 'react';
import Typography from './typography';
import Select, { Item } from './select';
import moment from 'moment';


type Props = {
    id?: string
    className?: string,
    onSelectedMonth?: (date: Date, willClose: boolean, ...args: any[]) => any | React.Dispatch<React.SetStateAction<Date | null>>,
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
            onSelectedMonth,
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
        const [select, setSelect] = useState<Date>(value ?? new Date());
        const months = useMemo(() => caculateMonthOfYear(select ?? new Date()), [select]);
        const thisMonthIndex = months.findIndex((date) => date !== null ? isThisMonth(date) : false);
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

        const handleSelect = (date: Date | null, willClose: boolean = true) => {
            if (date !== null) {
                if (isAvailableDate({ minDate: minDate, maxDate: maxDate }, date)) {
                    setSelect(date);
                    onSelectedMonth && onSelectedMonth(date, willClose);
                }
                else if (
                    minDate !== undefined && (
                        minDate.getFullYear() > date.getFullYear() ||
                        (minDate.getFullYear() === date.getFullYear() && minDate.getMonth() > date.getMonth())
                    )) {
                    const newDate = new Date(minDate);
                    newDate.setDate(1);
                    setSelect(minDate);
                    onSelectedMonth && onSelectedMonth(minDate, willClose);
                }
                else if (maxDate !== undefined) {
                    const newDate = new Date(maxDate);
                    newDate.setDate(1);
                    setSelect(maxDate);
                    onSelectedMonth && onSelectedMonth(maxDate, willClose);
                }
            }
        }

        const renderHeader = () => {

            return (
                <div className={`flex justify-between items-center flex-row gap-10 ${TextColor.PRIMARY_700}`}>
                    <Select
                        options={yearList}
                        selected={select?.getFullYear()}
                        onSelectItem={(item: Item) => {
                            const value = new Date();
                            select !== null && value?.setFullYear(
                                typeof item.value === 'number' ? item.value : parseInt(item.value as unknown as string),
                                select.getMonth(),
                                select.getDate()
                            );
                            handleSelect(value, false);
                        }}
                        altLabel={
                            <Typography
                                textColor={TextColor.PRIMARY_700}
                                fontSize={FontSize.BASE}
                                fontFamily={FontFamily.BOLD}
                            >
                                {moment(select).format('MMM YYYY')}
                            </Typography>
                        }
                        className='border-none pl-0 flex items-center !p-0'
                        boxClassName='!m-0 min-w-fit'
                    />

                </div>
            )
        }

        const renderMonth = () => {
            return (
                <div className='grid grid-cols-3 grid-rows-4 gap-5'>
                    {months.map((date, index) => !(thisMonthIndex === index) ? (
                        <div
                            key={index}
                            className='flex justify-center items-center'
                        >
                            <button
                                className={`
                                text-center 
                                h-full rounded-full
                                py-1.5
                                w-full
                                ${(date !== null && isSelected(date, select)) ? `${BgColor.PRIMARY_200} hover:!bg-primary-c200 ${selectClassName}` : ''}
                                ${date !== null ? isAvailableDate({ minDate: minDate, maxDate: maxDate }, date) ? 'cursor-pointer hover:bg-primary-c100' : `${BgColor.GREY_100} ${TextColor.GREY_400} hover:bg-grey-c100` : ''}
                                `}
                                onClick={() => handleSelect(date)}
                            >
                                {moment(date).format("MMM")}
                            </button>
                        </div>
                    ) : (
                        <div
                            key={index}
                            className='flex justify-center items-center'
                        >
                            <button
                                className={`
                                ${TextColor.PRIMARY_900} text-center 
                                rounded-full border-[1px] 
                                h-full
                                py-1.5
                                w-full
                                hover:bg-primary-c100
                                cursor-pointer
                                ${(date !== null && isSelected(date, select)) ? `${BgColor.PRIMARY_200} hover:!bg-primary-c200` : ''}
                                ${date !== null ? isAvailableDate({ minDate: minDate, maxDate: maxDate }, date) ? 'cursor-pointer hover:bg-primary-c100' : `${BgColor.GREY_100} ${TextColor.GREY_400} hover:!bg-none cursor-default` : ''}
                                `}
                                onClick={() => handleSelect(date)}
                            >
                                {moment(date).format("MMM")}
                            </button>
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
                w-full
                text-sm ${TextColor.PRIMARY_700}
                ${className}
                `}
                {...args}
            >
                {renderHeader()}
                {renderMonth()}
            </div>
        )
    }
)

export default memo(Calendar);

const caculateMonthOfYear = (date: Date) => {
    const currentYear = date?.getFullYear();
    const months: Array<Date> = new Array(12).fill(new Date);

    const startDate = new Date();
    startDate.setFullYear(currentYear, 0, 1);
    const endDate = new Date();
    endDate.setFullYear(currentYear, 11, 1);
    let indexOfMonth = 0;


    // Add following month
    while (indexOfMonth < 12) {
        const pushDate = new Date(startDate);
        pushDate.setMonth(startDate.getMonth() + indexOfMonth);
        months[startDate.getMonth() + indexOfMonth] = pushDate;
        indexOfMonth++;
    }

    return months;
}

const isThisMonth = (date: Date) => {
    const today = new Date();
    return (
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

    if (
        minDate !== undefined && (
            minDate.getFullYear() > date.getFullYear() ||
            (minDate.getFullYear() === date.getFullYear() && minDate.getMonth() > date.getMonth())
        )
    ) {
        return false;
    }

    if (
        maxDate !== undefined && (
            maxDate.getFullYear() < date.getFullYear() ||
            (maxDate.getFullYear() === date.getFullYear() && maxDate.getMonth() < date.getMonth())
        )
    ) {
        return false;
    }

    return true;
}

const isSelected = (date: Date, selectedDate: Date | null) => {
    return (
        selectedDate?.getMonth() === date.getMonth() &&
        selectedDate?.getFullYear() === date.getFullYear()
    )
}
