const getUserDetails = `
    SELECT
        User.FirstName,
        User.LastName,
        User.Email,
        User.Country,
        User.State,
        Image.URL as ImageURL
    FROM
        User
    LEFT JOIN
        UserImage ON User.UserID = UserImage.UserID
    LEFT JOIN
        Image ON UserImage.ImageID = Image.ImageID
    WHERE
        User.UserID = ?;
`;

module.exports = { getUserDetails };