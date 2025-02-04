const singleArtistImageURLs = `
    SELECT
        Image.URL AS ImageURL
    FROM
        Artist
    LEFT JOIN
        ArtistImage ON Artist.ArtistID = ArtistImage.ArtistID
    LEFT JOIN
        Image ON Image.ImageID = ArtistImage.ImageID
    WHERE
        Artist.ArtistID = ?
    ORDER BY
        ArtistImage.DisplayOrder;
`;

module.exports = { singleArtistImageURLs };