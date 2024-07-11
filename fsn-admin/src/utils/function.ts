import { format } from "date-fns";

export function fDateTime(date: string) {
    if (date) {
        return format(new Date(date), 'dd/MM/yyyy HH:mm:ss');
    }
    return null;
}
export function fDate(date: string) {
    if (date) {
        return format(new Date(date), 'dd/MM/yyyy');
    }
    return null;
}

export function replaceWordsWithAsterisks(inputString: string) {
    if (inputString.length <= 3) {
        return inputString;
    }
    var lastThreeCharacters = inputString.slice(-3);
    var replacedString = '*'.repeat(inputString.length - 3) + lastThreeCharacters;
    return replacedString;
}

export function removeCountryCode(phoneNumber: string, countryCode: string) {
    if (phoneNumber && countryCode && phoneNumber.startsWith(countryCode)) {
        return phoneNumber.substring(countryCode.length);
    }
    return phoneNumber
}

export function convertImageUrl(url: string): string {
    const baseAPI = process.env.NEXT_PUBLIC_CONSUMER_SERVICE;
    const baseURL = baseAPI?.slice(0, -7);    
    if (url.startsWith('http')) {
        return url;
    }
    return `${baseURL}/uploads/${url}`;
}