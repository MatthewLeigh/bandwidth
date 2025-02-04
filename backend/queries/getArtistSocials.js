const getArtistSocials = `
    SELECT
        Platform,
        Handle,
        URL
    FROM
        ArtistSocials
    WHERE
        ArtistID = ?;
`;

module.exports = { getArtistSocials };