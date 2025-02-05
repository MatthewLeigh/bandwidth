const allBannerDetails = `
    SELECT
        Image.Url AS ImageURL,
        Banner.FocusType,
        Banner.FocusId
    FROM
        Banner
    LEFT JOIN
        Image ON Banner.ImageId = Image.ImageId
    ORDER BY
        RANDOM();
`;

module.exports = { allBannerDetails };