import { Focus } from "./Focus";

export class VenueSearchItem {
    constructor(
        public focus: Focus,
        public title: string,
        public city: string,
        public isFeatured: boolean,
        public hasUpcomingEvents: boolean
    ) {}
}