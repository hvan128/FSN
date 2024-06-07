'use client';

import { BgColor, BorderColor, FOCUS, FontFamily, FontSize, HOVER, TextColor } from '@/enum/setting';
import React, { useMemo, memo, forwardRef, useState, useRef } from 'react';
import Typography from './typography';

type Props = {
    id?: string
    label?: string,
    resize?: React.CSSProperties['resize'],
    children?: React.ReactNode,
    className?: string,
    onChange?: React.ChangeEventHandler<HTMLTextAreaElement & HTMLInputElement>,
    type?: "text" | "password", // input only
    fullWidth?: boolean,
    disabled?: boolean,
    boxClassName?: string,
    multiline?: boolean,
    error?: boolean,
    helperText?: string,
    rows?: number,
    placeholder?: string,
    value?: string,
    inputProps?: { // input only
        startAdornment?: React.ReactNode,
        endAdornment?: React.ReactNode
    }
}

export type TextFieldProps = Props & React.TextareaHTMLAttributes<HTMLTextAreaElement> & React.InputHTMLAttributes<HTMLInputElement>
export type TextFieldRef = HTMLTextAreaElement | HTMLInputElement | null

const TextField = forwardRef<TextFieldRef, TextFieldProps>(
    function TextField(
        {
            id,
            resize = 'none',
            label = '',
            children,
            className = '',
            onChange = () => null,
            type,
            fullWidth = false,
            disabled,
            boxClassName = '',
            multiline,
            rows,
            error,
            helperText,
            placeholder,
            value = '',
            inputProps,
            ...args
        },
        ref
    ) {
        const [focus, setFocus] = useState(false);
        const curRef = useRef<TextFieldRef>(null);

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
        }, [])

        function renderTextArea<T extends React.ForwardedRef<TextFieldRef>>(ref: T) {
            return (
                <textarea
                    {...args}
                    placeholder={placeholder}
                    rows={rows}
                    autoComplete={placeholder || ''}
                    ref={e => {
                        if (ref !== null && ref !== undefined && typeof ref !== 'function') {
                            ref.current = e
                        }
                        curRef.current = e
                    }}
                    style={{
                        resize: resize
                    }}
                    className={
                        `text-sm sm:text-sm md:text-base text-justify text-grey-c700 bg-transparent
                        w-full
                        outline-0
                        px-2
                        py-1 xl:py-1.5
                        ${className}
                    `}
                    disabled={disabled}
                    value={value}
                    onBlur={() => setFocus(false)}
                    onFocus={() => setFocus(true)}
                    onChange={onChange}
                >
                </textarea>
            )

        }

        function renderInput<T extends React.ForwardedRef<TextFieldRef>>(ref: T) {
            return (
                <div className='flex items-center justify-between flex-row w-full text-grey-c700'>
                    {inputProps?.startAdornment}
                    <input
                        {...args}
                        placeholder={placeholder}
                        autoComplete={placeholder || ''}
                        ref={e => {
                            if (ref !== null && ref !== undefined && typeof ref !== 'function') {
                                ref.current = e
                            }
                            curRef.current = e
                        }}
                        style={{
                            resize: resize,
                        }}
                        className={`
                            text-sm sm:text-sm md:text-base text-justify text-grey-c700 
                            bg-transparent
                            grow
                            w-full
                            outline-0
                            px-2
                            py-1 xl:py-1.5
                            gap-3
                            ${className}
                        `}
                        disabled={disabled}
                        type={type}
                        value={value}
                        onBlur={() => setFocus(false)}
                        onFocus={() => setFocus(true)}
                        onChange={onChange}
                    >
                    </input>
                    {inputProps?.endAdornment}
                </div>
            )

        }

        return (
            <div className={`mb-2.5 h-fit bg-[inherit] ${fullWidth ? `w-full` : `w-[auto]`}`}>
                <fieldset
                    id={id}
                    className={`
                        group
                        relative
                        px-4
                        pb-2
                        min-w-[4rem]
                        bg-[inherit]
                        text-sm sm:text-sm md:text-base 
                        flex flex-col justify-center items-start transition-all
                        h-fit
                        cursor-text
                        border-[2px] rounded-3xl
                        ${!label ? 'pt-2 mt-2.5' : ''}
                        ${disabled ? `${colorAttitude['disable']}` :
                            error ? `${colorAttitude['error']} ${!focus && HOVER.BorderColor.SUPPORT}` :
                                `${colorAttitude['normal']} ${!focus && HOVER.BorderColor.PRIMARY}`}
                        ${boxClassName}
                    `}
                    onClick={() => {
                        setFocus(true);
                        curRef.current?.focus();
                    }}
                >
                    {label && <>
                        <legend className={
                            `
                            whitespace-nowrap
                            ${focus ? 'cursor-default' : 'cursor-text'}
                            ${focus || placeholder || value || inputProps?.startAdornment ? 'max-w-full px-2' : ' max-w-0'} 
                            ${disabled ? TextColor.GREY_500 : error ? TextColor.SUPPORT_900 : TextColor.PRIMARY_700}
                            ${FontSize.SM}
                            ${FontFamily.BOLD}
                            transition-all
                            duration-150
                            ease-linear
                        `}
                        >
                            <span className='opacity-0 inline-block visible'>{label}</span>
                        </legend>
                        <label className={
                            `
                            absolute
                            flex
                            items-center
                            ${focus ? 'cursor-default' : 'cursor-text'}
                            ${focus || placeholder || value || inputProps?.startAdornment ? `top-0 left-0 px-2 -translate-y-full` : `top-0 left-0 ${multiline ? '' : 'bottom-2'}`} translate-x-4
                            ${disabled ? TextColor.GREY_500 : error ? TextColor.SUPPORT_900 : TextColor.PRIMARY_700}
                            ${(focus || placeholder || value || inputProps?.startAdornment) && FontSize.SM}
                            ${FontFamily.BOLD}
                            transition-all
                            duration-150
                            ease-linear
                            truncate
                        `}
                        >
                            {label}
                        </label>
                    </>
                    }
                    {
                        multiline ? renderTextArea(ref) : renderInput(ref)
                    }
                </fieldset>
                {error &&
                    <Typography textColor={TextColor.SUPPORT_900} fontSize={FontSize.SM} fontFamily={FontFamily.NORMAL}>
                        {helperText}
                    </Typography>
                }
            </div>
        )
    })

export default memo(TextField);