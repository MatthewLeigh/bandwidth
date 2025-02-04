const postIsFavouriteArtist = `
    INSERT INTO UserFavouriteArtist ( UserID, ArtistID )
    VALUES ( ?, ? );
`;

module.exports = { postIsFavouriteArtist }