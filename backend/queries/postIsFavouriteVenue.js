const postIsFavouriteVenue = `
    INSERT INTO UserFavouriteVenue ( UserID, VenueID )
    VALUES ( ?, ? );
`;

module.exports = { postIsFavouriteVenue }