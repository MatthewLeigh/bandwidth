const postArtistCommentLike = `
    INSERT INTO ArtistCommentLike ( ArtistCommentID, UserID )
    VALUES ( ?, ? );
`;

const postVenueCommentLike = `
    INSERT INTO VenueCommentLike ( VenueCommentID, UserID )
    VALUES ( ?, ? );
`;

const postEventCommentLike = `
    INSERT INTO EventCommentLike ( EventCommentID, UserID )
    VALUES ( ?, ? );
`;

module.exports = {
    postArtistCommentLike,
    postVenueCommentLike,
    postEventCommentLike
}