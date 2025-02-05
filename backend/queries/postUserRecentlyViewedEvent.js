const postUserRecentlyViewedEvent = `
    INSERT OR REPLACE INTO UserRecentlyViewedEvent (UserID, EventID, DateTimeViewed)
    VALUES (?, ?, Date('now'));
`;

module.exports = { postUserRecentlyViewedEvent };