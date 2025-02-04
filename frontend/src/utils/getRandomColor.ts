export enum Contrast {
    Light = 'light',
    Dark = 'dark',
}

function isContrastingLight(color: string): boolean {
    const r = parseInt(color.slice(1, 3), 16) / 255;
    const g = parseInt(color.slice(3, 5), 16) / 255;
    const b = parseInt(color.slice(5, 7), 16) / 255;

    const luminance = 0.2126 * r + 0.7152 * g + 0.0722 * b;

    return luminance > 0.5;
}

function isContrastingDark(color: string): boolean {
    return !isContrastingLight(color);
}

function seededRandom(seed: string): () => number {
    let hash = Array.from(seed).reduce((acc, char) => {
        return char.charCodeAt(0) + ((acc << 5) - acc);
    }, 0);

    return () => {
        const x = Math.sin(hash++) * 10000;
        return x - Math.floor(x);
    };
}

function getRandomColor(contrast: Contrast, seed: string): string {
    const letters = '0123456789ABCDEF';
    let color = '#';
    let passCheck = false;
    const random = seededRandom(seed);

    while (!passCheck) {
        color = '#';
        for (let i = 0; i < 6; i++) {
            color += letters[Math.floor(random() * 16)];
        }

        if (contrast === Contrast.Light) passCheck = isContrastingLight(color);
        else if (contrast === Contrast.Dark) passCheck = isContrastingDark(color);
    }

    return color;
}

export default getRandomColor;
