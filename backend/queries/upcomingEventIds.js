const upcomingEventIds = `
    SELECT
        Event.EventID as Id,
        Event.Date as Date,
        MIN(EventPrice.Price) as Price,
        CASE
            WHEN EXISTS (
                SELECT
                    1
                FROM
                    UserFavouriteVenue
                WHERE
                    UserFavouriteVenue.UserID = 1
                    AND UserFavouriteVenue.VenueID = Event.VenueID
            ) THEN TRUE ELSE FALSE
        END AS isUserFavouriteVenue,
        CASE
            WHEN EXISTS (
                SELECT
                    1
                FROM
                    UserFavouriteArtist
                JOIN
                    Performance ON Performance.ArtistID = UserFavouriteArtist.ArtistID
                WHERE
                    UserFavouriteArtist.UserID = 1
                    AND Performance.EventID = Event.EventID
            ) THEN TRUE ELSE FALSE
        END AS isUserFavouriteArtist
    FROM
        Event
    LEFT JOIN
        EventPrice ON Event.EventID = EventPrice.EventID
    GROUP BY
        Event.EventID, Event.Date, Event.VenueID
    ORDER BY
        Event.Date ASC,
        Event.EventID ASC,
        MIN(EventPrice.Price) ASC;
`;

module.exports = { upcomingEventIds };