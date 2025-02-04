const getLogin = `
    SELECT
        UserID
    FROM
        User
    WHERE
        Email = ?
        AND Password = ?
`;

module.exports = { getLogin }