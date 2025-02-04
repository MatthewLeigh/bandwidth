const singleEventFocusCardDetails = `
    SELECT
        Event.Title,
        Event.Date,
        Venue.Title AS VenueTitle,
        GROUP_CONCAT(
            DISTINCT Artist.Title
            ORDER BY Performance.SetListPosition ASC
            SEPARATOR ' · '
        ) AS ArtistList,
        Image.URL AS ImageURL
    FROM
        Event
    LEFT JOIN
        Venue ON Event.VenueID = Venue.VenueID
    LEFT JOIN
        Performance ON Event.EventID = Performance.EventID
    LEFT JOIN
        Artist ON Performance.ArtistID = Artist.ArtistID
    LEFT JOIN
        EventImage ON Event.EventID = EventImage.EventID
    LEFT JOIN
        Image ON EventImage.ImageID = Image.ImageID
    WHERE
        Event.EventID = ?;
`;

module.exports = { singleEventFocusCardDetails };