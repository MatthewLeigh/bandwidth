const getIsUserLikedArtistComment = `
    SELECT
        CASE
            WHEN EXISTS (
                SELECT
                    1
                FROM
                    ArtistCommentLike
                WHERE
                    ArtistCommentID = ?
                    AND UserID = ?
            ) THEN TRUE ELSE FALSE
        END AS isUserLikedComment;
`;

const getIsUserLikedVenueComment = `
    SELECT
        CASE
            WHEN EXISTS (
                SELECT
                    1
                FROM
                    VenueCommentLike
                WHERE
                    VenueCommentID = ?
                    AND UserID = ?
            ) THEN TRUE ELSE FALSE
        END AS isUserLikedComment;
`;

const getIsUserLikedEventComment = `
    SELECT
        CASE
            WHEN EXISTS (
                SELECT
                    1
                FROM
                    EventCommentLike
                WHERE
                    EventCommentID = ?
                    AND UserID = ?
            ) THEN TRUE ELSE FALSE
        END AS isUserLikedComment;
`;

module.exports = {
    getIsUserLikedArtistComment,
    getIsUserLikedVenueComment,
    getIsUserLikedEventComment
}