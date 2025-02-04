const getUpcomingEventsForVenue = `
    SELECT
        EventID
    FROM
        Event
    WHERE
        VenueID = ?
        AND Date > CURDATE()
    ORDER BY
        Date ASC
    LIMIT 10;
`;

module.exports = { getUpcomingEventsForVenue };