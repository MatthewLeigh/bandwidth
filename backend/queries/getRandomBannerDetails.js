const getRandomBannerDetails = `
    SELECT
        Image.URL AS ImgUrl,
        Banner.FocusType,
        Banner.FocusId
    FROM
        Banner
    LEFT JOIN
        Image ON Banner.ImageId = Image.ImageId
    ORDER BY
        RANDOM()
    LIMIT 1
`;

module.exports = { getRandomBannerDetails };