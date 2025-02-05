const postArtistComment = `
    INSERT INTO ArtistComment (ArtistID, UserID, DateTime, Comment)
    VALUES ( ?, ?, Date('now'), ?);
`;

const postVenueComment = `
    INSERT INTO VenueComment (VenueID, UserID, DateTime, Comment)
    VALUES ( ?, ?, Date('now'), ?);
`;

const postEventComment = `
    INSERT INTO EventComment (EventID, UserID, DateTime, Comment)
    VALUES ( ?, ?, Date('now'), ?);
`;

module.exports = {
    postArtistComment,
    postVenueComment,
    postEventComment
}