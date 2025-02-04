const featuredEventIds = `
    SELECT
        Event.EventID as Id
    FROM
        Event
    WHERE
        Event.Featured = 1;
`;

module.exports = { featuredEventIds };