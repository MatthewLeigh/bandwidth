const postArtistComment = `
    INSERT INTO ArtistComment (ArtistID, UserID, DateTime, Comment)
    VALUES ( ?, ?, NOW(), ?);
`;

const postVenueComment = `
    INSERT INTO VenueComment (VenueID, UserID, DateTime, Comment)
    VALUES ( ?, ?, NOW(), ?);
`;

const postEventComment = `
    INSERT INTO EventComment (EventID, UserID, DateTime, Comment)
    VALUES ( ?, ?, NOW(), ?);
`;

module.exports = {
    postArtistComment,
    postVenueComment,
    postEventComment
}