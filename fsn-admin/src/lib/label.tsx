import React, { ReactNode, useMemo } from 'react';
import { BgColor, BorderColor, TextColor } from '@/enum/setting';

interface LabelProps {
    children?: ReactNode | string;
    startIcon?: ReactNode;
    endIcon?: ReactNode;
    color?: 'primary' | 'secondary' | 'info' | 'warning' | 'error' | 'success' | 'default';
    variant?: 'filled' | 'outlined' | 'ghost';
}

const Label: React.FC<LabelProps> = ({ children, color = 'default', variant = 'filled', startIcon, endIcon }) => {

    const colorAttitude = useMemo(() => {
        return {
            'filled': {
                'error': `
                ${BgColor.SUPPORT_900}
                ${TextColor.WHITE}   
                ${BorderColor.SUPPORT_900}
                `,
                'secondary': `
                ${BgColor.SECONDARY_900}
                ${TextColor.WHITE}      
                ${BorderColor.SECONDARY_900}
                `,
                'warning': `
                ${BgColor.SECONDARY_900}
                ${TextColor.WHITE}      
                ${BorderColor.SECONDARY_900}
                `,
                'primary': `
                ${BgColor.PRIMARY_800}
                ${TextColor.WHITE}      
                ${BorderColor.PRIMARY_800}
                `,
                'info': `
                ${BgColor.PRIMARY_200}
                ${TextColor.GREY_900}      
                ${BorderColor.PRIMARY_200}
                `,
                'success': `
                ${BgColor.SUCCESS_900}
                ${TextColor.WHITE}      
                ${BorderColor.SUCCESS_900}
                `,
                'default': `
                ${BgColor.SUPPORT_200}
                ${TextColor.GREY_700}      
                ${BorderColor.SUPPORT_200}
                `},
            'outlined': {
                'error': `
                ${BgColor.WHITE}
                ${TextColor.SUPPORT_900}   
                ${BorderColor.SUPPORT_900}
                `,
                'secondary': `
                ${BgColor.WHITE}
                ${TextColor.SECONDARY_900}      
                ${BorderColor.SECONDARY_900}
                `,
                'warning': `
                ${BgColor.WHITE}
                ${TextColor.SECONDARY_900}         
                ${BorderColor.SECONDARY_900}
                `,
                'primary': `
                ${BgColor.WHITE}
                ${TextColor.PRIMARY_900}        
                ${BorderColor.PRIMARY_900}
                `,
                'info': `
                ${BgColor.WHITE}
                ${TextColor.PRIMARY_300}         
                ${BorderColor.PRIMARY_300}
                `,
                'success': `
                ${BgColor.WHITE}
                ${TextColor.SUCCESS_900}        
                ${BorderColor.SUCCESS_900}
                `,
                'default': `
                ${BgColor.WHITE}
                ${TextColor.SUPPORT_200}        
                ${BorderColor.SUPPORT_200}
                `},
            'ghost': {
                'error': `
                ${BgColor.SUPPORT_400}
                ${TextColor.GREY_900}        
                ${BorderColor.SUPPORT_400}
                `,
                'secondary': `
                ${BgColor.SECONDARY_400}
                ${TextColor.GREY_900}    
                ${BorderColor.SECONDARY_400}
                `,
                'warning': `
                ${BgColor.SECONDARY_400}
                ${TextColor.GREY_900}     
                ${BorderColor.SECONDARY_400}
                `,
                'primary': `
                ${BgColor.PRIMARY_400}
                ${TextColor.GREY_900}    
                ${BorderColor.PRIMARY_400}
                `,
                'info': `
                ${BgColor.PRIMARY_100}
                ${TextColor.GREY_900}      
                ${BorderColor.PRIMARY_100}
                `,
                'success': `
                ${BgColor.SUCCESS_400}
                ${TextColor.GREY_900}     
                ${BorderColor.SUCCESS_400}
                `,
                'default': `
                ${BgColor.SUPPORT_200}
                ${TextColor.GREY_900}    
                ${BorderColor.SUPPORT_200}
                `},
        };
    }, []);

    return (
        <span className={`${startIcon ? 'pl-2' : ''} ${endIcon ? 'pr-2' : ''} ${colorAttitude[variant][color]} px-3 py-1 rounded-full border-[1.5px] text-sm text-center ${children?.toLocaleString().length as number < 30 ? 'inline-block min-w-0 whitespace-nowrap': ''} `}>
            {startIcon && <div style={{ marginRight: '0.75rem' }}>{startIcon}</div>}
            {children}
            {endIcon && <div style={{ marginLeft: '0.75rem' }}>{endIcon}</div>}
        </span>
    );
};

export default Label;

