const singleArtistFocusCardDetails = `
    SELECT
        Artist.Title,
        Artist.Country,
        Artist.State,
        COALESCE(Image.URL, '') AS ImageURL,
        (
            SELECT COUNT(DISTINCT Performance.EventID)
            FROM Performance
            JOIN Event ON Performance.EventID = Event.EventID
            WHERE Performance.ArtistID = Artist.ArtistID
            AND Event.Date >= CURDATE()
        ) AS EventCount
    FROM
        Artist
    LEFT JOIN
        ArtistImage ON Artist.ArtistID = ArtistImage.ArtistID
    LEFT JOIN
        Image ON Image.ImageID = ArtistImage.ImageID
    WHERE
        Artist.ArtistID = ?
    ORDER BY
        ArtistImage.DisplayOrder
    LIMIT 1;
`;

module.exports = { singleArtistFocusCardDetails };