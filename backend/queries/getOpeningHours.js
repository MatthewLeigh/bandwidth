const getOpeningHours = `
    SELECT
        *
    FROM
        VenueOpeningHours
    WHERE
        VenueID = ?;
`;

module.exports = { getOpeningHours };