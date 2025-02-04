const getFocusVenueDetails = `
    SELECT
        Title,
        Description,
        StreetAddress,
        City,
        State,
        PostCode,
        Website,
        Featured
    FROM
        Venue
    WHERE
        VenueID = ?;
`;

module.exports = { getFocusVenueDetails };