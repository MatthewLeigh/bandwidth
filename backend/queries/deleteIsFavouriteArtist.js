const deleteIsFavouriteArtist = `
    DELETE FROM
        UserFavouriteArtist
    WHERE
        UserID = ?
        AND ArtistID = ?;
`;

module.exports = { deleteIsFavouriteArtist }