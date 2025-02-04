const getEventAvatarCardArtistDetails = `
    SELECT
        Image.URL,
        Artist.ArtistID,
        Artist.Title,
        Performance.PerformanceStartTime,
        Performance.SetListPosition
    FROM
        Event
    LEFT JOIN
        Performance ON Event.EventID = Performance.EventID
    LEFT JOIN
        Artist ON Performance.ArtistID = Artist.ArtistID
    LEFT JOIN
        ArtistImage ON Artist.ArtistID = ArtistImage.ArtistID
    LEFT JOIN
        Image on ArtistImage.ImageID = Image.ImageID
    WHERE
        Event.EventID = ?
        AND ArtistImage.DisplayOrder = 1
    ORDER BY
        Performance.SetListPosition;
`;

module.exports = { getEventAvatarCardArtistDetails };