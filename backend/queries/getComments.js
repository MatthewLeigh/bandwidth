const getArtistComments = `
    SELECT
        ArtistComment.ArtistCommentID AS CommentID,
        ArtistComment.UserID,
        User.FirstName,
        User.LastName,
        Image.URL AS UserImg,
        ArtistComment.DateTime,
        ArtistComment.Comment,
        COUNT(ArtistCommentLike.ArtistCommentID) AS Likes,
        ArtistComment.IsEdited
    FROM
        ArtistComment
    LEFT JOIN
        User ON ArtistComment.UserID = User.UserID
    LEFT JOIN
        UserImage ON User.UserID = UserImage.UserID
    LEFT JOIN
        Image ON UserImage.ImageID = Image.ImageID
    LEFT JOIN
        ArtistCommentLike ON ArtistComment.ArtistCommentID = ArtistCommentLike.ArtistCommentID
    WHERE
        ArtistComment.ArtistID = ?
    GROUP BY
        ArtistComment.ArtistCommentID,
        ArtistComment.UserID,
        User.FirstName,
         User.LastName,
        Image.URL,
        ArtistComment.DateTime,
        ArtistComment.Comment
    ORDER BY
        ArtistComment.DateTime DESC;
`;

const getVenueComments = `
    SELECT
        VenueComment.VenueCommentID AS CommentID,
        VenueComment.UserID,
        User.FirstName,
        User.LastName,
        Image.URL AS UserImg,
        VenueComment.DateTime,
        VenueComment.Comment,
        COUNT(VenueCommentLike.VenueCommentID) AS Likes,
        VenueComment.IsEdited
    FROM
        VenueComment
    LEFT JOIN
        User ON VenueComment.UserID = User.UserID
    LEFT JOIN
        UserImage ON User.UserID = UserImage.UserID
    LEFT JOIN
        Image ON UserImage.ImageID = Image.ImageID
    LEFT JOIN
        VenueCommentLike ON VenueComment.VenueCommentID = VenueCommentLike.VenueCommentID
    WHERE
        VenueComment.VenueID = ?
    GROUP BY
        VenueComment.VenueCommentID,
        VenueComment.UserID,
        User.FirstName,
        User.LastName,
        Image.URL,
        VenueComment.DateTime,
        VenueComment.Comment
    ORDER BY
    VenueComment.DateTime DESC;
`;

const getEventComments = `
    SELECT
        EventComment.EventCommentID AS CommentID,
        EventComment.UserID,
        User.FirstName,
        User.LastName,
        Image.URL AS UserImg,
        EventComment.DateTime,
        EventComment.Comment,
        COUNT(EventCommentLike.EventCommentID) AS Likes,
        EventComment.IsEdited

    FROM
        EventComment
    LEFT JOIN
        User ON EventComment.UserID = User.UserID
    LEFT JOIN
        UserImage ON User.UserID = UserImage.UserID
    LEFT JOIN
        Image ON UserImage.ImageID = Image.ImageID
    LEFT JOIN
        EventCommentLike ON EventComment.EventCommentID = EventCommentLike.EventCommentID
    WHERE
        EventComment.EventID = ?
    GROUP BY
        EventComment.EventCommentID,
        EventComment.UserID,
        User.FirstName,
        User.LastName,
        Image.URL,
        EventComment.DateTime,
        EventComment.Comment
    ORDER BY
        EventComment.DateTime DESC;
`;

module.exports = {
    getArtistComments,
    getVenueComments,
    getEventComments
}