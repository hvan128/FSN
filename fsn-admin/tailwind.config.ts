import type { Config } from 'tailwindcss'
import plugin from 'tailwindcss/plugin'

const config: Config = {
  content: [
    './src/**/*.{js,ts,jsx,tsx,mdx}',
  ],
  theme: {
    screens: {
      'xs': '0px',
      'sm': '600px',
      'md': '900px',
      'lg': '1200px',
      'xl': '1536px',
    },
    fontSize: {
      'xs': ['0.75rem', { /* 12px */
        lineHeight: '1rem', /* 16px */
      }],
      'sm': ['0.875rem', { /* 14px */
        lineHeight: '1.25rem', /* 20px */
      }],
      'base': ['1rem', { /* 16px */
        lineHeight: '1.5rem', /* 24px */
      }],
      'lg': ['1.125rem', { /* 18px */
        lineHeight: '1.75rem', /* 28px */
      }],
      'xl': ['1.25rem', { /* 20px */
        lineHeight: '1.75rem', /* 28px */
      }],
      '2xl': ['1.5rem', { /* 24px */
        lineHeight: '2rem', /* 32px */
      }],
      '3xl': ['1.875rem', { /* 30px */
        lineHeight: '2.25rem', /* 36px */
      }],
      '4xl': ['2.25rem', { /* 36px */
        lineHeight: '2.5rem', /* 40px */
      }],
      '5xl': ['3rem', { /* 48px */
        lineHeight: '1rem',
      }],
      '6xl': ['3.75rem', { /* 60px */
        lineHeight: '1',
      }],
      '7xl': ['4.5rem', { /* 72px */
        lineHeight: '1',
      }],
      '8xl': ['6rem', { /* 96px */
        lineHeight: '1',
      }],
      '9xl': ['8rem', { /* 128px */
        lineHeight: '1rem',
      }],
    },
    colors: {
      transparent: 'transparent',
      white: '#fff',
      grey: {
        c900: '#1F1F1F',
        c800: '#323232',
        c700: '#575757',
        c600: '#6D6D6D',
        c500: '#878787',
        c400: '#ACACAC',
        c300: '#C7C7C7',
        c200: '#DBDBDB',
        c100: '#F1F1F1',
        c50: '#F9F9F9',
      },
      primary: {
        c900: '#285069',
        c800: '#256A95',
        c700: '#2D7D9F',
        c600: '#477D97',
        c500: '#607D90',
        c400: '#8FA9B8',
        c300: '#C0D8E3',
        c200: '#D1E7EE',
        c100: '#E2F3F9',
        c50: '#F4F9FB',
      },
      secondary: {
        c900: '#904432',
        c800: '#CA5E42',
        c700: '#FF8A69',
        c600: '#FB967A',
        c500: '#FFA88F',
        c400: '#FFB39D',
        c300: '#FFC2B0',
        c200: '#FFD2C6',
        c100: '#FFE5E0',
        c50: '#FFF1EE',
      },
      support: {
        c900: '#FF4E64',
        c800: '#FF7183',
        c700: '#FF8D9C',
        c600: '#FFA4B0',
        c500: '#FFB6C0',
        c400: '#FCE9EA',
        c300: '#FDF3F4',
        c200: '#FFE5E5'
      },
      success: {
        c900: '#1B5E20',
        c800: '#2E7D32',
        c700: '#388E3C',
        c600: '#43A047',
        c500: '#4CAF50',
        c400: '#66BB6A',
        c300: '#81C784',
        c200: '#A5D6A7',
        c100: '#C8E6C9',
        c50: '#E8F5E9',
      },
      overlay: '#000000',
    },
    extend: {
      backgroundImage: {
        'gradient-radial': 'radial-gradient(var(--tw-gradient-stops))',
        'gradient-conic':
          'conic-gradient(from 180deg at 50% 50%, var(--tw-gradient-stops))',
      },
      spacing: {
        '1': '4px',
        '2': '8px',
        '3': '12px',
        '4': '16px',
        '5': '24px',
        '6': '32px',
      },
      fontFamily: {
        thin: ["thin", "thin"],
        extralight: ["extralight", "extralight"],
        light: ["light", "light"],
        normal: ["normal", "normal"],
        medium: ["medium", "light"],
        semibold: ["semibold", "semibold"],
        bold: ["bold", "bold"],
        extrabold: ["extrabold", "extrabold"],
        blackbold: ["blackbold", "blackbold"],
      },
      borderRadius: {
        '4xl': '2rem',
      },
      keyframes: {
        pulse: {
          '0%': { opacity: '1' },
          '50%': { opacity: '0.2' },
          '100%': { opacity: '1' },       
        },
      },
      animation: {
        'pulse': 'pulse 2s cubic-bezier(0.4, 0, 0.6, 1) infinite',
      },
    },
  },
  plugins: [
    plugin(function ({ addBase, theme }) {

    })
  ]
}
export default config
