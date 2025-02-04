const focusEventDetails = `
    SELECT
        Event.Title,
        Event.Description,
        Event.Featured,
        Event.Date,
        Event.StartTime,
        Event.VenueID,
        Venue.Title AS VenueTitle,
        Stage.Title AS StageTitle,
        Event.OriginalPostURL,
        Event.TicketSaleURL
    FROM
        Event
    LEFT JOIN
        Venue ON Event.VenueID = Venue.VenueID
    LEFT JOIN
        Stage ON Event.StageID = Stage.StageID
    WHERE
        Event.EventID = ?;
`;

module.exports = { focusEventDetails };