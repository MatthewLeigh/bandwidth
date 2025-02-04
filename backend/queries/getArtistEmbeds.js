const getArtistEmbeds = `
    SELECT
        SpotifyEmbed,
        YouTubeEmbed
    FROM
        Artist
    WHERE
        ArtistID = ?
`;

module.exports = { getArtistEmbeds };