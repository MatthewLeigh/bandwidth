const deleteArtistComment = `
    DELETE FROM
        ArtistComment
    WHERE
        ArtistCommentID = ?;
`;

const deleteVenueComment = `
    DELETE FROM
        VenueComment
    WHERE
        VenueCommentID = ?;
`;

const deleteEventComment = `
    DELETE FROM
        EventComment
    WHERE
        EventCommentID = ?;
`;

module.exports = {
    deleteArtistComment,
    deleteVenueComment,
    deleteEventComment
}