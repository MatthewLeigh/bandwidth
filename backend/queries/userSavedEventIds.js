const userSavedEventIds = `
    SELECT
        EventID AS Id
    FROM
        UserSavedEvent
    WHERE
        UserID = ?;
`;

module.exports = { userSavedEventIds };