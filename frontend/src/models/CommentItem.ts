export class CommentItem {
    constructor(
        public commentId: number,
        public userId: number,
        public userFirstName: string,
        public userLastName: string,
        public userImg: string,
        public dateTime: string,
        public comment: string,
        public likes: number,
        public isEdited: boolean
    ) {}
}