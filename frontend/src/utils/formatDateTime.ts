// Takes an ISO Formatted DateTime string: (E.g., "2025-01-05T14:48:00.000Z") and formats it 
// relative to the current DateTime. DateTime's older than 1 week are displayed as the absolute
// date and time.
//
//   Examples:
//
// - If 30 minutes ago, the '30min ago'
// - If 2 hours 40 minutes ago, then '2h ago'
// - If 4 days and 3 hours ago, then '3d ago'
// - If 8 days ago, then the absolute date in the format 'Jan 5, 2025'

export function formatDateTimeRelative(dateTime: string) : string {

    // Get Current DateTime.
    const now = new Date();

    // Calculate how much time has passed.
    const diff = now.getTime() - new Date(dateTime).getTime();
    const diffMinutes = Math.floor(diff / (1000 * 60));
    const diffHours = Math.floor(diff / (1000 * 60 * 60));
    const diffDays = Math.floor(diff / (1000 * 60 * 60 * 24));

    // If less than 7 days, return relative time strings.
    if (diffMinutes < 60) return `${diffMinutes}min ago`;
    else if (diffHours < 24) return `${diffHours}h ago`;
    else if (diffDays < 7) return `${diffDays}d ago`;

    // If 7 days or more, return DateTime formatted with the below options.
    const options: Intl.DateTimeFormatOptions = {
        year: 'numeric',
        month: 'short',
        day: 'numeric',
    };

    return new Date(dateTime).toLocaleDateString(undefined, options);
}



// Dates are retrieved from database in "YYYY-MM-DD" format.
// export Function formats dates for display in a long form (e.g., "2025-01-14" -> "January 14, 2025")
export function formatDateLong(date: string) : string {

    // Set formatting options.
    const options: Intl.DateTimeFormatOptions = {
        month: 'short',
        day: 'numeric',
        weekday: 'long'
    };

    return new Date(date).toLocaleDateString(undefined, options);
}


export function convertIsoDateTimeToDate(date: Date) : string {

    const year = date.getFullYear();
    const month = String(date.getMonth() + 1).padStart(2, '0');
    const day = String(date.getDate()).padStart(2, '0');

    return `${year}-${month}-${day}`;
}

export function convertIsoDateTimeStringToDate(date: string) : string {

    const localDate = new Date(date);
    return convertIsoDateTimeToDate(localDate);
}

// Overloaded function to format an ISO DateTime string to a long date string.
export function formatIsoDateTimeToDateLong(date: Date): string;
export function formatIsoDateTimeToDateLong(date: string): string;
export function formatIsoDateTimeToDateLong(date: Date | string): string {

    if (date instanceof Date) {
        const converted = convertIsoDateTimeToDate(date);
        return formatDateLong(converted);

    } else {
        const converted = convertIsoDateTimeStringToDate(date);
        return formatDateLong(converted);
    }
}

export function getTodayAsDate() : string {
    const today = new Date();
    return convertIsoDateTimeToDate(today);
}