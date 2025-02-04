const singleVenueImageURLs = `
    SELECT
        Image.URL AS ImageURL
    FROM
        Venue
    LEFT JOIN
        VenueImage ON Venue.VenueID = VenueImage.VenueID
    LEFT JOIN
        Image ON Image.ImageID = VenueImage.ImageID
    WHERE
        Venue.VenueID = ?
    ORDER BY
        VenueImage.DisplayOrder;
`;

module.exports = { singleVenueImageURLs };