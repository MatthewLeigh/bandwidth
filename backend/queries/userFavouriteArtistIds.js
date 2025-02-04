const userFavouriteArtistIds = `
    SELECT
        ArtistId AS Id
    FROM
        UserFavouriteArtist
    WHERE
        UserID = ?;
`;

module.exports = { userFavouriteArtistIds };