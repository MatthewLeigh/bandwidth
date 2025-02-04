const getFocusArtistDetails = `
    SELECT
        Title,
        Description,
        State,
        Country,
        YearFounded,
        Featured
    FROM
        Artist
    WHERE
        ArtistID = ?;
`;

module.exports = { getFocusArtistDetails };