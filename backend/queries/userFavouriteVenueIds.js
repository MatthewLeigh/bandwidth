const userFavouriteVenueIds = `
    SELECT
        VenueId AS Id
    FROM
        UserFavouriteVenue
    WHERE
        UserID = ?;
`;

module.exports = { userFavouriteVenueIds };