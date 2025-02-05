const postUserRecentlyViewedEvent = `
    INSERT INTO UserRecentlyViewedEvent (UserID, EventID, DateTimeViewed)
    VALUES (?, ?, Date('now'))
    ON DUPLICATE KEY UPDATE DateTimeViewed = VALUES(DateTimeViewed);
`;

module.exports = { postUserRecentlyViewedEvent };