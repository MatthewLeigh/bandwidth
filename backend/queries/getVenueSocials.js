const getVenueSocials = `
    SELECT
        Platform,
        Handle,
        URL
    FROM
        VenueSocials
    WHERE
        VenueID = ?;
`;

module.exports = { getVenueSocials };