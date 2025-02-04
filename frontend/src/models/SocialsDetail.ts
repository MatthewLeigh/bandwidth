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
    [SocialPlatform.Website]: '/icons/website.svg',
    [SocialPlatform.Facebook]: '/icons/facebook.svg',
    [SocialPlatform.Instagram]: '/icons/instagram.svg',
    [SocialPlatform.Twitter]: '/icons/twitter.svg',
    [SocialPlatform.YouTube]: '/icons/youtube.svg',
    [SocialPlatform.Bandcamp]: '/icons/bandcamp.svg',
    [SocialPlatform.SoundCloud]: '/icons/soundcloud.svg',
    [SocialPlatform.TikTok]: '/icons/tiktok.svg'
};

export class SocialsDetail {
    constructor(
        public platform: SocialPlatform,
        public handle: string,
        public url: string
    ) {}
}