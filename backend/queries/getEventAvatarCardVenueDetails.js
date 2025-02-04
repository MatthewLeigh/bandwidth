const getEventAvatarCardVenueDetails = `
    SELECT
        Image.URL,
        Venue.VenueID,
        Venue.Title,
        Event.StartTime
    FROM
        Event
    LEFT JOIN
        Venue ON Event.VenueID = Venue.VenueID
	LEFT JOIN
		VenueImage ON Venue.VenueID = VenueImage.VenueID
	LEFT JOIN
		Image ON VenueImage.ImageID = Image.ImageID
	WHERE
		EventID = ?
        AND VenueImage.DisplayOrder = 1;
`;

module.exports = { getEventAvatarCardVenueDetails };