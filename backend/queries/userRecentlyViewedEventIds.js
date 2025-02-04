const userRecentlyViewedEventIds = `
    SELECT
        EventID AS Id
    FROM
        UserRecentlyViewedEvent
    WHERE
        UserID = ?
    ORDER BY
        DateTimeViewed DESC
    LIMIT 12;
`;

module.exports = { userRecentlyViewedEventIds };