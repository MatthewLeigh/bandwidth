const featuredVenueIds = `
    SELECT
        Venue.VenueID as Id
    FROM
        Venue
    WHERE
        Venue.Featured = 1;
`;

module.exports = { featuredVenueIds };