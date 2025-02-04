const deleteIsFavouriteVenue = `
    DELETE FROM
        UserFavouriteVenue
    WHERE
        UserID = ?
        AND VenueID = ?;
`;

module.exports = { deleteIsFavouriteVenue }