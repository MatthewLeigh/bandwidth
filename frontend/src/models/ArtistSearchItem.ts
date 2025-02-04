import { Focus } from "./Focus";

export class ArtistSearchItem {
    constructor(
        public focus: Focus,
        public title: string,
        public country: string,
        public state: string,
        public isFeatured: boolean,
        public hasUpcomingEvents: boolean
    ) {}
}