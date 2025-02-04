const getIsSavedEvent = `
    SELECT
        CASE
            WHEN EXISTS (
                SELECT 
                    1
                FROM
                    UserSavedEvent
                WHERE
                    UserSavedEvent.UserID = ?
                    AND UserSavedEvent.EventID = ?
            ) THEN TRUE ELSE FALSE
        END AS isSaved
`;

module.exports = { getIsSavedEvent }