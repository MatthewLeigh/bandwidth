const getTicketPricesForEvent = `
    SELECT
        TicketType,
        Price
    FROM
        EventPrice
    WHERE
        EventID = ?;
`

module.exports = { getTicketPricesForEvent };