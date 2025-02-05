const putArtistComment = `
    UPDATE
        ArtistComment
    SET
        Comment = ?,
        DateTime = Date('now'),
        IsEdited = 1
    WHERE
        ArtistCommentID = ?;
`;

const putVenueComment = `
    UPDATE
        VenueComment
    SET
        Comment = ?,
        DateTime = Date('now'),
        IsEdited = 1
    WHERE
        VenueCommentID = ?;
`;

const putEventComment = `
    UPDATE
        EventComment
    SET
        Comment = ?,
        DateTime = Date('now'),
        IsEdited = 1
    WHERE
        EventCommentID = ?;
`;

module.exports = {
    putArtistComment,
    putVenueComment,
    putEventComment
}