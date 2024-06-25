import { BgColor, BorderColor, FOCUS, HOVER, TextColor } from '@/enum/setting';
import React, { useMemo, memo, forwardRef } from 'react';

type Props = {
    children?: React.ReactNode,
    startIcon?: React.ReactNode,
    endIcon?: React.ReactNode,
    className?: string,
    onClick?: React.MouseEventHandler,
    type?: "submit" | "button" | "reset"
    variant?: 'outline' | 'contained' | 'other'
    fullWidth?: boolean
    color?: 'primary' | 'secondary' | 'warning' | 'error' | 'info'
    disabled?: boolean
}

const Button = forwardRef<HTMLButtonElement, Props & React.HTMLAttributes<HTMLButtonElement>>(
    function Button(
        {
            children,
            startIcon,
            endIcon,
            className = '',
            type = 'button',
            onClick,
            variant = 'contained',
            fullWidth = false,
            disabled,
            color = 'primary',
            ...args
        },
        ref
    ) {
        const colorAttitude = useMemo(() => {
            return {
                'error': `
                ${BgColor.SUPPORT_900}
                ${TextColor.WHITE}      
                ${HOVER.BgColor.SUPPORT}
                ${HOVER.BorderColor.SUPPORT}
                ${FOCUS.BorderColor.SUPPORT}
                ${BorderColor.SUPPORT_900}
                `,
                'secondary': `
                ${BgColor.SECONDARY_900}
                ${TextColor.WHITE}      
                ${HOVER.BgColor.SECONDARY}
                ${HOVER.BorderColor.SECONDARY}
                ${FOCUS.BorderColor.SECONDARY}
                ${BorderColor.SECONDARY_900}
                `,
                'warning': `
                ${BgColor.SECONDARY_900}
                ${TextColor.WHITE}      
                ${HOVER.BgColor.SECONDARY}
                ${HOVER.BorderColor.SECONDARY}
                ${FOCUS.BorderColor.SECONDARY}
                ${BorderColor.SECONDARY_900}
                `,
                'primary': `
                ${BgColor.PRIMARY_800}
                ${TextColor.WHITE}      
                ${HOVER.BgColor.PRIMARY}
                ${HOVER.BorderColor.PRIMARY}
                ${FOCUS.BorderColor.PRIMARY}
                ${BorderColor.PRIMARY_800}
                `,
                'info': `
                ${BgColor.PRIMARY_100}
                ${TextColor.GREY_700}      
                ${HOVER.BgColor.PRIMARY}
                ${HOVER.BorderColor.PRIMARY}
                ${FOCUS.BorderColor.PRIMARY}
                ${BorderColor.PRIMARY_100}
                `
            }
        }, [])
        return (
            <button
                {...args}
                ref={ref}
                type={type}
                className={`
                group 
                min-w-[4rem]
                px-4 py-2
                text-sm sm:text-sm md:text-base lg:text-lg xl:text-lg text-center
                flex flex-row justify-center items-center gap-2 transition-all
                border-2 rounded-full
                ${fullWidth ? `w-full` : `w-[auto]`}
                ${disabled ? `
                    ${BgColor.GREY_400}
                    ${TextColor.WHITE}
                    ${BorderColor.GREY_400}
                ` : `
                    ${colorAttitude[color]}
                    focus:scale-105 hover:scale-105 
                    `
                    }
                ${variant === 'outline' ? BgColor.TRANSPARENT : ''}
                ${className}
            `}
                onClick={onClick}
                disabled={disabled}
            >
                {startIcon}
                {children}
                {endIcon}
            </button>
        )
    })

export default memo(Button);