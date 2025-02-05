const singleVenueFocusCardDetails = `
    SELECT
        Venue.Title,
        Venue.StreetAddress,
        Venue.City,
        Venue.State,
        Venue.PostCode,
        COALESCE(Image.URL, '') AS ImageURL,
        (
            SELECT COUNT(DISTINCT Event.EventID)
            FROM Event
            WHERE Event.VenueID = Venue.VenueID
            AND Event.Date >= DATE('now')
        ) AS EventCount
    FROM
        Venue
    LEFT JOIN
        VenueImage ON Venue.VenueID = VenueImage.VenueID
    LEFT JOIN
        Image ON Image.ImageID = VenueImage.ImageID
    WHERE
        Venue.VenueID = ?
    ORDER BY
        VenueImage.DisplayOrder
    LIMIT 1;
`;

module.exports = { singleVenueFocusCardDetails };