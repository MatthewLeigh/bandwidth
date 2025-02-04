const singleEventImageURLs = `
    SELECT
        Image.URL AS ImageURL
    FROM
        Event
    LEFT JOIN
        EventImage ON Event.EventID = EventImage.EventID
    LEFT JOIN
        Image ON Image.ImageID = EventImage.ImageID
    WHERE
        Event.EventID = ?
    ORDER BY
        EventImage.DisplayOrder;
`;

module.exports = { singleEventImageURLs };