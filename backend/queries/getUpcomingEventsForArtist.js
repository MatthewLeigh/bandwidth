const getUpcomingEventsForArtist = `
    SELECT
        Performance.EventID
    FROM
        Event
	LEFT JOIN
		Performance ON Event.EventID = Performance.EventID
    WHERE
        Performance.ArtistID = ?
        AND Event.Date > CURDATE()
    ORDER BY
        Event.Date ASC;
`;

module.exports = { getUpcomingEventsForArtist };