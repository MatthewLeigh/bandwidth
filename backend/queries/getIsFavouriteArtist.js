const getIsFavouriteArtist = `
    SELECT
        CASE
            WHEN EXISTS (
                SELECT 
                    1
                FROM
                    UserFavouriteArtist
                WHERE
                    UserFavouriteArtist.UserID = ?
                    AND UserFavouriteArtist.ArtistID = ?
            ) THEN TRUE ELSE FALSE
        END AS isFavourite
`;

module.exports = { getIsFavouriteArtist }