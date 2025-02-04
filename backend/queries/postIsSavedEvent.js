const postIsSavedEvent = `
    INSERT INTO UserSavedEvent ( UserID, EventID )
    VALUES ( ?, ? );
`;

module.exports = { postIsSavedEvent }