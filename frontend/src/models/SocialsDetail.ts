export enum SocialPlatform {
    Website = 'Website',
    Facebook = 'Facebook',
    Instagram = 'Instagram',
    Twitter = 'Twitter',
    YouTube = 'YouTube',
    Bandcamp = 'Bandcamp',
    SoundCloud = 'SoundCloud',
    TikTok = 'TikTok'
}

export const platformIcons: { [key in SocialPlatform]: string } = {
    [SocialPlatform.Website]: '/bandwidth/icons/website.svg',
    [SocialPlatform.Facebook]: '/bandwidth/icons/facebook.svg',
    [SocialPlatform.Instagram]: '/bandwidth/icons/instagram.svg',
    [SocialPlatform.Twitter]: '/bandwidth/icons/twitter.svg',
    [SocialPlatform.YouTube]: '/bandwidth/icons/youtube.svg',
    [SocialPlatform.Bandcamp]: '/bandwidth/icons/bandcamp.svg',
    [SocialPlatform.SoundCloud]: '/bandwidth/icons/soundcloud.svg',
    [SocialPlatform.TikTok]: '/bandwidth/icons/tiktok.svg'
};

export class SocialsDetail {
    constructor(
        public platform: SocialPlatform,
        public handle: string,
        public url: string
    ) {}
}