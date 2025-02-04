const getIsFavouriteVenue = `
    SELECT
        CASE
            WHEN EXISTS (
                SELECT 
                    1
                FROM
                    UserFavouriteVenue
                WHERE
                    UserFavouriteVenue.UserID = ?
                    AND UserFavouriteVenue.VenueID = ?
            ) THEN TRUE ELSE FALSE
        END AS isFavourite
`;

module.exports = { getIsFavouriteVenue }