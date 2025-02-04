const getRandomBannerDetails = `
    SELECT
        Image.Url AS ImgUrl,
        Banner.FocusType,
        Banner.FocusId
    FROM
        Banner
    LEFT JOIN
        Image ON Banner.ImageId = Image.ImageId
    ORDER BY
        RAND()
    LIMIT 1
`;

module.exports = { getRandomBannerDetails };