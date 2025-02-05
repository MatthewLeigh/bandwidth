const allVenueIds = `
    SELECT
        Venue.VenueID,
        Venue.Title,
        Venue.City,
        Venue.Featured,
        CASE
            WHEN EXISTS (
                SELECT
                    1
                FROM
                    Performance
                JOIN
                    Event ON Event.EventID = Performance.EventID
                WHERE
                    Event.VenueID = Venue.VenueID
                    AND Event.Date > DATE('now')
            ) THEN TRUE ELSE FALSE
        END AS hasUpcomingEvent
    FROM
        Venue;
`;

module.exports = { allVenueIds };