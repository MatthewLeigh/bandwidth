const featuredArtistIds = `
    SELECT
        Artist.ArtistID as Id
    FROM
        Artist
    WHERE
        Artist.Featured = 1;
`;

module.exports = { featuredArtistIds };