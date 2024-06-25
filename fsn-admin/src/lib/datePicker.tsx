'use client';

import { BgColor, BorderColor, FOCUS, FontFamily, FontSize, HOVER, TextColor } from '@/enum/setting';
import React, { useMemo, memo, forwardRef, useState, ReactNode, useEffect } from 'react';
import Typography from './typography';
import moment from 'moment';
import TodayIcon from '@mui/icons-material/Today';
import Calendar from './calendar';
import Time from './time';


type Props = {
    id?: string
    className?: string,
    onSelectItem?: (item: Date, ...args: any[]) => any | React.Dispatch<React.SetStateAction<Date | null>>,
    fullWidth?: boolean,
    disabled?: boolean,
    selected?: Date | null,
    selectClassName?: string,
    closeOnSelect?: boolean,
    itemClassName?: string,
    boxClassName?: string,
    startIcon?: React.ReactNode,
    endIcon?: React.ReactNode,
    error?: boolean,
    helperText?: string,
    placeholder?: string,
    position?: 'top' | 'bottom' | 'center',
    altLabel?: ReactNode,
    formatLabel?: string,
    name?: string,
    title?: string,
    minDate?: Date,
    maxDate?: Date,
    selectTime?: boolean,
}

const DatePicker = forwardRef<HTMLDivElement, Props>(
    function DatePicker(
        {
            id,
            className = '',
            onSelectItem,
            fullWidth,
            disabled,
            selected,
            selectClassName = '',
            closeOnSelect = true,
            boxClassName = '',
            itemClassName = '',
            startIcon,
            endIcon,
            error,
            helperText,
            placeholder,
            position = 'bottom',
            altLabel,
            selectTime = true,
            formatLabel = selectTime ? 'DD/MM/YYYY hh:mm a' : 'DD/MM/YYYY',// ex: 25/01/1990 01:45 pm
            name,
            title,
            minDate,
            maxDate,
            ...args
        },
        ref
    ) {
        const [open, setOpen] = useState(false);
        const [hidden, setHidden] = useState(true);
        const [select, setSelect] = useState<Date | null>(selected ? new Date(selected) : null);
        const [tab, setTab] = useState(0);

        useEffect(() => {
            if (selected === null) {
                setSelect(null);
            }
        }, [selected])

        const colorAttitude = useMemo(() => {
            return {
                'error': `
                ${BgColor.SUPPORT_300}
                ${TextColor.PRIMARY_900}      
                ${BorderColor.SUPPORT_500}
                ${FOCUS.BorderColor.SUPPORT}
                focus-within:border-support-c700
                `,
                'normal': `
                ${BgColor.TRANSPARENT}
                ${TextColor.PRIMARY_900}      
                ${BorderColor.PRIMARY_300}
                ${FOCUS.BorderColor.PRIMARY}
                focus-within:border-primary-c700
                `,
                'disable': `
                ${BgColor.GREY_100}
                ${TextColor.GREY_900}
                ${BorderColor.GREY_400}
                `,
            }
        }, []);

        const handleSelect = (item: Date, willClose: boolean) => {
            setSelect(item);

            onSelectItem && onSelectItem(item);

            if (tab === 0 && selectTime) {
                setTab(1);
            }

            if (closeOnSelect && (tab === 1 || !selectTime) && willClose) {
                handleOpenClose('close');
            }
        }

        const handleOpenClose = (type: 'open' | 'close') => {
            if (disabled) {
                return;
            }

            if (type === 'open') {
                setOpen(true);
                setHidden(false);
            }
            else {
                setOpen(false);
                setTimeout(() => {
                    setHidden(true);
                    setTab(0);
                }, 400);
            }
        }

        const renderText = () => {

            return (
                <Typography
                    className={`block truncate ${selected || select ? '' : '!text-grey-c400'}`}
                >
                    {selected || select ? moment(selected ?? select).format(formatLabel) : placeholder}
                </Typography>
            )
        }

        return (
            <div
                id={id}
                ref={ref}
                className={`
                    mb-2.5
                    ${TextColor.GREY_700} 
                    ${FontSize.BASE}
                    bg-[inherit] 
                    min-w-[17rem]
                    ${fullWidth ? 'w-full' : ''}
                    ${boxClassName}
                `}
                {...args}
            >
                <div className={`relative`}>
                    <fieldset
                        className={`
                        relative 
                        min-w-0
                        h-fit
                        w-full
                        px-4
                        pb-2
                        rounded-3xl
                        bg-[inherit] 
                        border-[2px]
                        outline-0
                        text-sm sm:text-sm md:text-base 
                        ${!title ? 'pt-2 mt-2.5' : ''}
                        ${disabled ? `${colorAttitude['disable']} cursor-default` :
                                error ? `${colorAttitude['error']} ${!open ? HOVER.BorderColor.SUPPORT : BorderColor.SUPPORT_700} cursor-pointer` :
                                    `${colorAttitude['normal']} ${!open ? HOVER.BorderColor.PRIMARY : BorderColor.PRIMARY_700} cursor-pointer`}
                        ${className}
                    `}
                        onClick={() => handleOpenClose(open ? 'close' : 'open')}
                        disabled={disabled}
                    >
                        <input name={name} className='hidden absolute opacity-0 pointer-events-none select-none' onChange={() => null} value={select?.toString() ?? ''}></input>
                        {title && <>
                            <legend className={`
                                whitespace-nowrap
                                ${open || disabled ? 'cursor-default' : 'cursor-pointer'}
                                ${open || placeholder || selected || select ? 'max-w-full px-2' : ' max-w-0'} 
                                ${disabled ? TextColor.GREY_500 : error ? TextColor.SUPPORT_900 : TextColor.PRIMARY_700}
                                ${FontSize.SM}
                                ${FontFamily.BOLD}
                                transition-all
                                duration-150
                                ease-linear
                            `}
                            >
                                <span className='opacity-0 inline-block visible'>{title}</span>
                            </legend>
                            <label className={`
                                absolute
                                flex
                                items-center
                                ${open || disabled ? 'cursor-default' : 'cursor-pointer'}
                                ${open || placeholder || selected || select ? `top-0 left-0 px-2 -translate-y-full` : `top-0 left-0 bottom-2`} translate-x-4
                                ${disabled ? TextColor.GREY_500 : error ? TextColor.SUPPORT_900 : TextColor.PRIMARY_700}
                                ${(open || placeholder || selected || select) && FontSize.SM}
                                ${FontFamily.BOLD}
                                transition-all
                                duration-150
                                ease-linear
                                truncate
                            `}
                            >
                                {title}
                            </label>
                        </>
                        }
                        <div className="flex items-center justify-between py-1 xl:py-1.5 gap-3">
                            <div className='px-2'>
                                {
                                    altLabel ? altLabel
                                        : <div className='flex items-center flex-row gap-3 truncate'>
                                            {startIcon}
                                            {renderText()}
                                        </div>
                                }
                            </div>
                            <TodayIcon
                                className={` 
                                    ${disabled ? `text-grey-c500 cursor-default` :
                                        error ? `text-support-c800 cursor-pointer` :
                                            `text-primary-c500 cursor-pointer`}
                                    md:text-2xl sm:text-xl text-xl
                                `}
                            />
                        </div>
                    </fieldset>
                    {!hidden && <>
                        <div className='fixed top-0 left-0 w-screen h-screen bg-transparent z-10' onClick={() => handleOpenClose('close')}></div>
                        <div
                            className={`
                                absolute 
                                z-20 
                                max-h-fit
                                w-full
                                overflow-auto
                                rounded-md border-[1px]
                                bg-white 
                                focus:outline-none 
                                transition-all
                                duration-[400ms]
                                left-0 right-0
                                ${position === 'bottom' ? 'top-full mt-1'
                                    : position === 'center' ? '-translate-y-1/2 top-0'
                                        : '-translate-y-full top-0 -mt-1'}
                                ${open ? `opacity-100 origin-top` : `opacity-0 origin-top`}
                                ${disabled ? `${colorAttitude['disable']} ${HOVER.BorderColor.GREY}` :
                                    error ? `${colorAttitude['error']} ${HOVER.BorderColor.SUPPORT}` :
                                        `${colorAttitude['normal']} ${HOVER.BorderColor.PRIMARY}`}
                            `}
                        >
                            {tab === 0 ?
                                <Calendar
                                    value={selected ? new Date(selected) : select}
                                    onSelectDate={handleSelect}
                                    minDate={minDate ?? new Date('12-10-2021')}
                                    maxDate={maxDate}
                                /> :
                                selectTime && <Time
                                    disabled={disabled}
                                    value={selected ? new Date(selected) : select}
                                    onSelectDate={handleSelect}
                                    minDate={minDate ?? new Date('12-10-2021')}
                                    maxDate={maxDate}
                                />
                            }
                        </div>
                    </>
                    }
                </div>
                {error &&
                    <Typography className='px-2' textColor={TextColor.SUPPORT_900} fontSize={FontSize.SM} fontFamily={FontFamily.NORMAL}>
                        {helperText}
                    </Typography>
                }
            </div>
        )
    }
)

export default memo(DatePicker);