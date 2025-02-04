const eventImageIds = `
    SELECT
        Event.VenueID,
        GROUP_CONCAT(
            DISTINCT Performance.ArtistID
            ORDER BY Performance.SetListPosition ASC
            SEPARATOR ','
        ) AS ArtistIDs
    FROM
        Event
    LEFT JOIN
        Performance ON Event.EventID = Performance.EventID
    WHERE
        Event.EventID = ?;
`;

module.exports = { eventImageIds };