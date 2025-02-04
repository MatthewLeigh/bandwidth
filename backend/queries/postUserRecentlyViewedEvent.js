const postUserRecentlyViewedEvent = `
    INSERT INTO UserRecentlyViewedEvent (UserID, EventID, DateTimeViewed)
    VALUES (?, ?, NOW())
    ON DUPLICATE KEY UPDATE DateTimeViewed = VALUES(DateTimeViewed);
`;

module.exports = { postUserRecentlyViewedEvent };