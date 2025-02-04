const deleteArtistCommentLike = `
    DELETE FROM
        ArtistCommentLike
    WHERE
        ArtistCommentID = ?
        AND UserID = ?;
`;

const deleteVenueCommentLike = `
    DELETE FROM
        VenueCommentLike
    WHERE
        VenueCommentID = ?
        AND UserID = ?;
`;

const deleteEventCommentLike = `
    DELETE FROM
        EventCommentLike
    WHERE
        EventCommentID = ?
        AND UserID = ?;
`;

module.exports = {
    deleteArtistCommentLike,
    deleteVenueCommentLike,
    deleteEventCommentLike
}