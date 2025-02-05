const allArtistIds = `
    SELECT
        Artist.ArtistID,
        Artist.Title,
        Artist.Country,
        Artist.State,
        Artist.Featured,
        CASE
            WHEN EXISTS (
                SELECT
                    1
                FROM
                    Performance
                JOIN
                    Event ON Event.EventID = Performance.EventID
                WHERE
                    Performance.ArtistID = Artist.ArtistID
                    AND Event.Date > DATE('now')
            ) THEN TRUE ELSE FALSE
        END AS hasUpcomingEvent
    FROM
        Artist;
`;

module.exports = { allArtistIds };



