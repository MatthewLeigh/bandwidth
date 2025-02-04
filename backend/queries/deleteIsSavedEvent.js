const deleteIsSavedEvent = `
    DELETE FROM
        UserSavedEvent
    WHERE
        UserID = ?
        AND EventID = ?;
`;

module.exports = { deleteIsSavedEvent }