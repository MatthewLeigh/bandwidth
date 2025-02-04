import { Focus } from "./Focus";

export class AvatarCardDetails {
    constructor(
        public imgUrl: string,
        public hasImgError: boolean = false,
        public title: string,
        public startTime: string,
        public setListPosition: number,
        public focus: Focus,
    ) {}
}