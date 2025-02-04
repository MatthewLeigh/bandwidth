import { FocusType } from "./FocusType";

export class EventSearchItem {
    constructor(
        public id: number,
        public type: FocusType,
        public date: string,
        public price: number,
        public isUserFavouriteVenue: boolean,
        public isUserFavouriteArtist: boolean
    ) {}
}