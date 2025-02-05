const express = require('express');
const cors = require('cors');
const sqlite3 = require('sqlite3').verbose();

const app = express();
const PORT = 3000;
const HOST = 'https://bandwidth-22xp.onrender.com';

// Enable CORS
app.use(cors());

// Enable JSON Parsing
app.use(express.json());
app.use(express.urlencoded({ extended: true }));

// Cache Images for an Hour
app.use(express.static('public', {
    setHeaders: (res, path) => {
        if (
            path.endsWith('.jpg') ||
            path.endsWith('.png')
        ) {
            res.set('Cache-Control', 'public, max-age=3600');
        }
    }
}));

// Connect to the SQLite database
const db = new sqlite3.Database('./database/bandwidth-db.db', (err) => {
    if (err) {
        console.error('Error connecting to the database: ', err.message);
        return;
    }
    console.log('Connected to the SQLite database');
});

// GET: All Artist IDs
const { allArtistIds } = require('./queries/allArtistIds');

app.get('/api/all-artist-ids', (req, res) => {
    db.query(allArtistIds, (err, result) => {
        if (err) {
            console.error('Database query error:', err);
            res.status(500).send(err);
        } else {
            res.json({ result });
        }
    });
});

// GET: All Venue IDs
const { allVenueIds } = require('./queries/allVenueIds');

app.get('/api/all-venue-ids', (req, res) => {
    db.query(allVenueIds, (err, result) => {
        if (err) {
            console.error('Database query error:', err);
            res.status(500).send(err);
        } else {
            res.json({ result });
        }
    });
});

// GET: Featured Event IDs
const { featuredEventIds } = require('./queries/featuredEventIds');

app.get('/api/featured-event-ids', (req, res) => {
    db.query(featuredEventIds, [1], (err, result) => {
        if (err) {
            console.error('Database query error:', err);
            res.status(500).send(err);
        } else {
            const ids = result.map(item => item.Id);
            res.json({ ids });
        }
    });
});

// GET: Featured Artist IDs
const { featuredArtistIds } = require('./queries/featuredArtistIds');

app.get('/api/featured-artist-ids', (req, res) => {
    db.query(featuredArtistIds, [1], (err, result) => {
        if (err) {
            console.error('Database query error:', err);
            res.status(500).send(err);
        } else {
            const ids = result.map(item => item.Id);
            res.json({ ids });
        }
    });
});

// GET: Featured Venue IDs
const { featuredVenueIds } = require('./queries/featuredVenueIds');

app.get('/api/featured-venue-ids', (req, res) => {
    db.query(featuredVenueIds, [1], (err, result) => {
        if (err) {
            console.error('Database query error:', err);
            res.status(500).send(err);
        } else {
            const ids = result.map(item => item.Id);
            res.json({ ids });
        }
    });
});

// GET: Upcoming Event IDs
const { upcomingEventIds } = require('./queries/upcomingEventIds');

app.get('/api/upcoming-event-ids/:userId', (req, res) => {
    const userId = req.params.userId;

    db.query(upcomingEventIds, [userId, userId], (err, result) => {
        if (err) {
            console.error('Database query error:', err);
            res.status(500).send(err);
        } else {
            res.json(result);

        }
    });
});

// GET: User Saved Event IDs
const { userSavedEventIds } = require('./queries/userSavedEventIds');

app.get('/api/user-saved-event-ids/:userId', (req, res) => {
    const userId = req.params.userId;

    db.query(userSavedEventIds, [userId], (err, result) => {
        if (err) {
            console.error('Database query error:', err);
            res.status(500).send(err);
        } else {
            const ids = result.map(item => item.Id);
            res.json({ ids });
        }
    });
});

// GET: User Recently Viewed Event IDs
const { userRecentlyViewedEventIds } = require('./queries/userRecentlyViewedEventIds');

app.get('/api/user-recently-viewed-event-ids/:userId', (req, res) => {
    const userId = req.params.userId;

    db.query(userRecentlyViewedEventIds, [userId], (err, result) => {
        if (err) {
            console.error('Database query error:', err);
            res.status(500).send(err);
        } else {
            const ids = result.map(item => item.Id);
            res.json({ ids });
        }
    });
});

// GET: User Favourite Artist IDs
const { userFavouriteArtistIds } = require('./queries/userFavouriteArtistIds');

app.get('/api/user-favourite-artist-ids/:userId', (req, res) => {
    const userId = req.params.userId;

    db.query(userFavouriteArtistIds, [userId], (err, result) => {
        if (err) {
            console.error('Database query error:', err);
            res.status(500).send(err);
        } else {
            const ids = result.map(item => item.Id);
            res.json({ ids });
        }
    });
});

// GET: User Favourite Venue IDs
const { userFavouriteVenueIds } = require('./queries/userFavouriteVenueIds');

app.get('/api/user-favourite-venue-ids/:userId', (req, res) => {
    const userId = req.params.userId;

    db.query(userFavouriteVenueIds, [userId], (err, result) => {
        if (err) {
            console.error('Database query error:', err);
            res.status(500).send(err);
        } else {
            const ids = result.map(item => item.Id);
            res.json({ ids });
        }
    });
});

// GET: All Banner Details
const { allBannerDetails } = require('./queries/allBannerDetails');

app.get('/api/all-banner-details', (req, res) => {
    db.query(allBannerDetails, (err, result) => {
        if (err) {
            console.error('Database query error:', err);
            res.status(500).send(err);
        } else {
            res.json(result);
        }
    });
});

// GET: Single Venue Focus Card Details
const { singleVenueFocusCardDetails } = require('./queries/singleVenueFocusCardDetails');

app.get('/api/single-venue-focus-card-details/:id', (req, res) => {
    const venueId = req.params.id;

    db.query(singleVenueFocusCardDetails, [venueId], (err, result) => {
        if (err) {
            console.error('Database query error:', err);
            res.status(500).send(err);
        } else {
            res.json(result);
        }
    });
});

// GET: Single Artist Focus Card Details
const { singleArtistFocusCardDetails } = require('./queries/singleArtistFocusCardDetails');

app.get('/api/single-artist-focus-card-details/:id', (req, res) => {
    const artistId = req.params.id;

    db.query(singleArtistFocusCardDetails, [artistId], (err, result) => {
        if (err) {
            console.error('Database query error:', err);
            res.status(500).send(err);
        } else {
            res.json(result);
        }
    });
});

// GET: Single Event Focus Card Details
const { singleEventFocusCardDetails } = require('./queries/singleEventFocusCardDetails');

app.get('/api/single-event-focus-card-details/:id', (req, res) => {
    const eventId = req.params.id;

    db.query(singleEventFocusCardDetails, [eventId], (err, result) => {
        if (err) {
            console.error('Database query error:', err);
            res.status(500).send(err);
        } else {
            res.json(result);
        }
    });
});

// GET: Event Image IDs
const { eventImageIds } = require('./queries/eventImageIds');

app.get('/api/event-image-ids/:id', (req, res) => {
    const eventId = req.params.id;

    db.query(eventImageIds, [eventId], (err, result) => {
        if (err) {
            console.error('Database query error:', err);
            res.status(500).send(err);
        } else {
            res.json(result);
        }
    });
});

// GET: Focus Event Details
const { focusEventDetails } = require('./queries/focusEventDetails');

app.get('/api/focus-event-details/:id', (req, res) => {
    const eventId = req.params.id;

    db.query(focusEventDetails, [eventId], (err, result) => {
        if (err) {
            console.error('Database query error:', err);
            res.status(500).send(err);
        } else {
            res.json(result);
        }
    });
});

// GET: Single Artist Image URLs
const { singleArtistImageURLs } = require('./queries/singleArtistImageURLs');

app.get('/api/single-artist-image-urls/:id', (req, res) => {
    const artistId = req.params.id;

    db.query(singleArtistImageURLs, [artistId], (err, result) => {
        if (err) {
            console.error('Database query error:', err);
            res.status(500).send(err);
        } else {
            const urls = result.map(item => item.ImageURL);
            res.json({ urls });
        }
    });
});

// GET: Single Event Image URLs
const { singleEventImageURLs } = require('./queries/singleEventImageURLs');

app.get('/api/single-event-image-urls/:id', (req, res) => {
    const eventId = req.params.id;

    db.query(singleEventImageURLs, [eventId], (err, result) => {
        if (err) {
            console.error('Database query error:', err);
            res.status(500).send(err);
        } else {
            const urls = result.map(item => item.ImageURL);
            res.json({ urls });
        }
    });
});

// GET: Single Venue Image URLs
const { singleVenueImageURLs } = require('./queries/singleVenueImageURLs');

app.get('/api/single-venue-image-urls/:id', (req, res) => {
    const venueId = req.params.id;

    db.query(singleVenueImageURLs, [venueId], (err, result) => {
        if (err) {
            console.error('Database query error:', err);
            res.status(500).send(err);
        } else {
            const urls = result.map(item => item.ImageURL);
            res.json({ urls });
        }
    });
});

// GET: Ticket Prices for Event
const { getTicketPricesForEvent } = require('./queries/getTicketPricesForEvent');

app.get('/api/ticket-prices-for-event/:id', (req, res) => {
    const eventId = req.params.id;

    db.query(getTicketPricesForEvent, [eventId], (err, result) => {
        if (err) {
            console.error('Database query error:', err);
            res.status(500).send(err);
        } else {
            res.json(result);
        }
    });
});

// GET: Event Avatar Card Artist Details
const { getEventAvatarCardArtistDetails } = require('./queries/getEventAvatarCardArtistDetails');

app.get('/api/event-avatar-card-artist-details/:id', (req, res) => {
    const eventId = req.params.id;

    db.query(getEventAvatarCardArtistDetails, [eventId], (err, result) => {
        if (err) {
            console.error('Database query error:', err);
            res.status(500).send(err);
        } else {
            res.json(result);
        }
    });
});

// GET: Event Avatar Card Venue Details
const { getEventAvatarCardVenueDetails } = require('./queries/getEventAvatarCardVenueDetails');

app.get('/api/event-avatar-card-venue-details/:id', (req, res) => {
    const eventId = req.params.id;

    db.query(getEventAvatarCardVenueDetails, [eventId], (err, result) => {
        if (err) {
            console.error('Database query error:', err);
            res.status(500).send(err);
        } else {
            res.json(result);
        }
    });
});

// GET: Focus Artist Details
const { getFocusArtistDetails } = require('./queries/getFocusArtistDetails');

app.get('/api/focus-artist-details/:id', (req, res) => {
    const artistId = req.params.id;

    db.query(getFocusArtistDetails, [artistId], (err, result) => {
        if (err) {
            console.error('Database query error:', err);
            res.status(500).send(err);
        } else {
            res.json(result);
        }
    });
});

// GET: Upcoming Events for Artist
const { getUpcomingEventsForArtist } = require('./queries/getUpcomingEventsForArtist');

app.get('/api/upcoming-events-for-artist/:id', (req, res) => {
    const artistId = req.params.id;

    db.query(getUpcomingEventsForArtist, [artistId], (err, result) => {
        if (err) {
            console.error('Database query error:', err);
            res.status(500).send(err);
        } else {
            res.json(result);
        }
    });
});

// GET: Artist Socials
const { getArtistSocials } = require('./queries/getArtistSocials');

app.get('/api/artist-socials/:id', (req, res) => {
    const artistId = req.params.id;

    db.query(getArtistSocials, [artistId], (err, result) => {
        if (err) {
            console.error('Database query error:', err);
            res.status(500).send(err);
        } else {
            res.json(result);
        }
    });
});

// GET: Artist Embeds
const { getArtistEmbeds } = require('./queries/getArtistEmbeds');

app.get('/api/artist-embeds/:id', (req, res) => {
    const artistId = req.params.id;

    db.query(getArtistEmbeds, [artistId], (err, result) => {
        if (err) {
            console.error('Database query error:', err);
            res.status(500).send(err);
        } else {
            res.json(result);
        }
    });
});

// GET: Random Banner Details
const { getRandomBannerDetails } = require('./queries/getRandomBannerDetails');

app.get('/api/random-banner-details', (req, res) => {
    db.query(getRandomBannerDetails, (err, result) => {
        if (err) {
            console.error('Database query error:', err);
            res.status(500).send(err);
        } else {
            res.json(result);
        }
    });
});

// GET: Focus Venue Details
const { getFocusVenueDetails } = require('./queries/getFocusVenueDetails');

app.get('/api/focus-venue-details/:id', (req, res) => {
    const venueId = req.params.id;

    db.query(getFocusVenueDetails, [venueId], (err, result) => {
        if (err) {
            console.error('Database query error:', err);
            res.status(500).send(err);
        } else {
            res.json(result);
        }
    });
});

// GET: Venue Opening Hours
const { getOpeningHours } = require('./queries/getOpeningHours');

app.get('/api/venue-opening-hours/:id', (req, res) => {
    const venueId = req.params.id;

    db.query(getOpeningHours, [venueId], (err, result) => {
        if (err) {
            console.error('Database query error:', err);
            res.status(500).send(err);
        } else {
            res.json(result);
        }
    });
});

// GET: Upcoming Events for Venue
const { getUpcomingEventsForVenue } = require('./queries/getUpcomingEventsForVenue');

app.get('/api/upcoming-events-for-venue/:id', (req, res) => {
    const venueId = req.params.id;

    db.query(getUpcomingEventsForVenue, [venueId], (err, result) => {
        if (err) {
            console.error('Database query error:', err);
            res.status(500).send(err);
        } else {
            res.json(result);
        }
    });
});

// GET: Venue Socials
const { getVenueSocials } = require('./queries/getVenueSocials');

app.get('/api/venue-socials/:id', (req, res) => {
    const venueId = req.params.id;

    db.query(getVenueSocials, [venueId], (err, result) => {
        if (err) {
            console.error('Database query error:', err);
            res.status(500).send(err);
        } else {
            res.json(result);
        }
    });
});

// GET: User Details
const { getUserDetails } = require('./queries/getUserDetails');

app.get('/api/user-details/:id', (req, res) => {
    const userId = req.params.id;

    db.query(getUserDetails, [userId], (err, result) => {
        if (err) {
            console.error('Database query error:', err);
            res.status(500).send(err);
        } else {
            res.json(result);
        }
    });
});

// GET: Is Favourite Venue
const { getIsFavouriteVenue } = require('./queries/getIsFavouriteVenue');

app.get('/api/get/venue/is-favourite/:userId/:venueId', (req, res) => {
    const userId = req.params.userId;
    const venueId = req.params.venueId;

    db.query(getIsFavouriteVenue, [userId, venueId], (err, result) => {
        if (err) {
            console.error('Database query error:', err);
            res.status(500).send(err);
        } else {
            res.json(result);
        }
    });
});

// POST: Is Favourite Venue
const { postIsFavouriteVenue } = require('./queries/postIsFavouriteVenue');

app.post('/api/post/venue/is-favourite/:userId/:venueId', (req, res) => {
    const userId = req.params.userId;
    const venueId = req.params.venueId;

    db.query(postIsFavouriteVenue, [userId, venueId], (err, result) => {
        if (err) {
            console.error('Database query error:', err);
            res.status(500).send(err);
        } else {
            res.json(result);
        }
    });
});

// DELETE: Is Favourite Venue
const { deleteIsFavouriteVenue } = require('./queries/deleteIsFavouriteVenue');

app.delete('/api/delete/venue/is-favourite/:userId/:venueId', (req, res) => {
    const userId = req.params.userId;
    const venueId = req.params.venueId;

    db.query(deleteIsFavouriteVenue, [userId, venueId], (err, result) => {
        if (err) {
            console.error('Database query error:', err);
            res.status(500).send(err);
        } else {
            res.json(result);
        }
    });
});

// GET: Is Favourite Artist
const { getIsFavouriteArtist } = require('./queries/getIsFavouriteArtist');

app.get('/api/get/artist/is-favourite/:userId/:artistId', (req, res) => {
    const userId = req.params.userId;
    const artistId = req.params.artistId;

    db.query(getIsFavouriteArtist, [userId, artistId], (err, result) => {
        if (err) {
            console.error('Database query error:', err);
            res.status(500).send(err);
        } else {
            res.json(result);
        }
    });
});

// POST: Is Favourite Artist
const { postIsFavouriteArtist } = require('./queries/postIsFavouriteArtist');

app.post('/api/post/artist/is-favourite/:userId/:artistId', (req, res) => {
    const userId = req.params.userId;
    const artistId = req.params.artistId;

    db.query(postIsFavouriteArtist, [userId, artistId], (err, result) => {
        if (err) {
            console.error('Database query error:', err);
            res.status(500).send(err);
        } else {
            res.json(result);
        }
    });
});

// DELETE: Is Favourite Artist
const { deleteIsFavouriteArtist } = require('./queries/deleteIsFavouriteArtist');

app.delete('/api/delete/artist/is-favourite/:userId/:artistId', (req, res) => {
    const userId = req.params.userId;
    const artistId = req.params.artistId;

    db.query(deleteIsFavouriteArtist, [userId, artistId], (err, result) => {
        if (err) {
            console.error('Database query error:', err);
            res.status(500).send(err);
        } else {
            res.json(result);
        }
    });
});

// GET: Is Saved Event
const { getIsSavedEvent } = require('./queries/getIsSavedEvent');

app.get('/api/get/event/is-saved/:userId/:eventId', (req, res) => {
    const userId = req.params.userId;
    const eventId = req.params.eventId;

    db.query(getIsSavedEvent, [userId, eventId], (err, result) => {
        if (err) {
            console.error('Database query error:', err);
            res.status(500).send(err);
        } else {
            res.json(result);
        }
    });
});

// POST: Is Saved Event
const { postIsSavedEvent } = require('./queries/postIsSavedEvent');

app.post('/api/post/event/is-saved/:userId/:eventId', (req, res) => {
    const userId = req.params.userId;
    const eventId = req.params.eventId;

    db.query(postIsSavedEvent, [userId, eventId], (err, result) => {
        if (err) {
            console.error('Database query error:', err);
            res.status(500).send(err);
        } else {
            res.json(result);
        }
    });
});

// DELETE: Is Saved Event
const { deleteIsSavedEvent } = require('./queries/deleteIsSavedEvent');

app.delete('/api/delete/event/is-saved/:userId/:eventId', (req, res) => {
    const userId = req.params.userId;
    const eventId = req.params.eventId;

    db.query(deleteIsSavedEvent, [userId, eventId], (err, result) => {
        if (err) {
            console.error('Database query error:', err);
            res.status(500).send(err);
        } else {
            res.json(result);
        }
    });
});




// POST: Comment
const { postArtistComment, postVenueComment, postEventComment } = require('./queries/postComment');

app.post('/api/post/artist/comment/:focusId/:userId', (req, res) => {
    const artistId = req.params.focusId;
    const userId = req.params.userId;
    const { comment } = req.body;

    if (!comment) {
        return res.status(400).json({ error: "Comment is required." });
    }

    db.query(postArtistComment, [artistId, userId, comment], (err, result) => {
        if (err) {
            console.error('Database query error:', err);
            res.status(500).json({ error: "Database error" });
        } else {
            res.status(200).json({ message: "Comment posted successfully" });
        }
    });
});

app.post('/api/post/venue/comment/:focusId/:userId', (req, res) => {
    const venueId = req.params.focusId;
    const userId = req.params.userId;
    const { comment } = req.body;

    if (!comment) {
        return res.status(400).json({ error: "Comment is required." });
    }

    db.query(postVenueComment, [venueId, userId, comment], (err, result) => {
        if (err) {
            console.error('Database query error:', err);
            res.status(500).json({ error: "Database error" });
        } else {
            res.status(200).json({ message: "Comment posted successfully" });
        }
    });
});

app.post('/api/post/event/comment/:focusId/:userId', (req, res) => {
    const eventId = req.params.focusId;
    const userId = req.params.userId;
    const { comment } = req.body;

    if (!comment) {
        return res.status(400).json({ error: "Comment is required." });
    }

    db.query(postEventComment, [eventId, userId, comment], (err, result) => {
        if (err) {
            console.error('Database query error:', err);
            res.status(500).json({ error: "Database error" });
        } else {
            res.status(200).json({ message: "Comment posted successfully" });
        }
    });
});

// GET: Comments
const { getArtistComments, getVenueComments, getEventComments } = require('./queries/getComments');

app.get('/api/get/artist/comments/:focusId', (req, res) => {
    const artistId = req.params.focusId;

    db.query(getArtistComments, [artistId], (err, result) => {
        if (err) {
            console.error('Database query error:', err);
            res.status(500).send(err);
        } else {
            res.json(result);
        }
    });
});

app.get('/api/get/venue/comments/:focusId', (req, res) => {
    const venueId = req.params.focusId;

    db.query(getVenueComments, [venueId], (err, result) => {
        if (err) {
            console.error('Database query error:', err);
            res.status(500).send(err);
        } else {
            res.json(result);
        }
    });
});

app.get('/api/get/event/comments/:focusId', (req, res) => {
    const eventId = req.params.focusId;

    db.query(getEventComments, [eventId], (err, result) => {
        if (err) {
            console.error('Database query error:', err);
            res.status(500).send(err);
        } else {
            res.json(result);
        }
    });
});


// DELETE: Comment
const { deleteArtistComment, deleteVenueComment, deleteEventComment } = require('./queries/deleteComment');

app.delete('/api/delete/artist/comment/:commentId', (req, res) => {
    const artistId = req.params.commentId;

    db.query(deleteArtistComment, [artistId], (err, result) => {
        if (err) {
            console.error('Database query error:', err);
            res.status(500).json({ error: "Database error" });
        } else {
            res.status(200).json({ message: "Comment deleted successfully" });
        }
    });
});

app.delete('/api/delete/venue/comment/:commentId', (req, res) => {
    const venueId = req.params.commentId;

    db.query(deleteVenueComment, [venueId], (err, result) => {
        if (err) {
            console.error('Database query error:', err);
            res.status(500).json({ error: "Database error" });
        } else {
            res.status(200).json({ message: "Comment deleted successfully" });
        }
    });
});

app.delete('/api/delete/event/comment/:commentId', (req, res) => {
    const eventId = req.params.commentId;

    db.query(deleteEventComment, [eventId], (err, result) => {
        if (err) {
            console.error('Database query error:', err);
            res.status(500).json({ error: "Database error" });
        } else {
            res.status(200).json({ message: "Comment deleted successfully" });
        }
    });
});


// POST : CommentLike
const { postArtistCommentLike, postVenueCommentLike, postEventCommentLike } = require('./queries/postCommentLike');

app.post('/api/post/artist/like-comment/:commentId/:userId', (req, res) => {
    const commentId = req.params.commentId;
    const userId = req.params.userId;

    db.query(postArtistCommentLike, [commentId, userId], (err, result) => {
        if (err) {
            console.error('Database query error:', err);
            res.status(500).json({ error: "Database error" });
        } else {
            res.status(200).json({ message: "Comment Like Successful" });
        }
    });
});

app.post('/api/post/venue/like-comment/:commentId/:userId', (req, res) => {
    const commentId = req.params.commentId;
    const userId = req.params.userId;

    db.query(postVenueCommentLike, [commentId, userId], (err, result) => {
        if (err) {
            console.error('Database query error:', err);
            res.status(500).json({ error: "Database error" });
        } else {
            res.status(200).json({ message: "Comment Like Successful" });
        }
    });
});

app.post('/api/post/event/like-comment/:commentId/:userId', (req, res) => {
    const commentId = req.params.commentId;
    const userId = req.params.userId;

    db.query(postEventCommentLike, [commentId, userId], (err, result) => {
        if (err) {
            console.error('Database query error:', err);
            res.status(500).json({ error: "Database error" });
        } else {
            res.status(200).json({ message: "Comment Like Successful" });
        }
    });
});



// DELETE : CommentLike

const { deleteArtistCommentLike, deleteVenueCommentLike, deleteEventCommentLike } = require('./queries/deleteCommentLike');

app.delete('/api/delete/artist/unlike-comment/:commentId/:userId', (req, res) => {
    const commentId = req.params.commentId;
    const userId = req.params.userId;

    db.query(deleteArtistCommentLike, [commentId, userId], (err, result) => {
        if (err) {
            console.error('Database query error:', err);
            res.status(500).json({ error: "Database error" });
        } else {
            res.status(200).json({ message: "Comment Unlike Successful" });
        }
    });
});

app.delete('/api/delete/venue/unlike-comment/:commentId/:userId', (req, res) => {
    const commentId = req.params.commentId;
    const userId = req.params.userId;

    db.query(deleteVenueCommentLike, [commentId, userId], (err, result) => {
        if (err) {
            console.error('Database query error:', err);
            res.status(500).json({ error: "Database error" });
        } else {
            res.status(200).json({ message: "Comment Unlike Successful" });
        }
    });
});

app.delete('/api/delete/event/unlike-comment/:commentId/:userId', (req, res) => {
    const commentId = req.params.commentId;
    const userId = req.params.userId;

    db.query(deleteEventCommentLike, [commentId, userId], (err, result) => {
        if (err) {
            console.error('Database query error:', err);
            res.status(500).json({ error: "Database error" });
        } else {
            res.status(200).json({ message: "Comment Unlike Successful" });
        }
    });
});


// GET : isUserLikedComment

const { getIsUserLikedArtistComment, getIsUserLikedVenueComment, getIsUserLikedEventComment } = require('./queries/getIsUserLikedComment');

app.get('/api/get/artist/is-user-liked-comment/:commentId/:userId', (req, res) => {
    const commentId = req.params.commentId;
    const userId = req.params.userId;

    db.query(getIsUserLikedArtistComment, [commentId, userId], (err, result) => {
        if (err) {
            console.error('Database query error:', err);
            res.status(500).json({ error: "Database error" });
        } else {
            res.json(result);
        }
    });
});

app.get('/api/get/venue/is-user-liked-comment/:commentId/:userId', (req, res) => {
    const commentId = req.params.commentId;
    const userId = req.params.userId;

    db.query(getIsUserLikedVenueComment, [commentId, userId], (err, result) => {
        if (err) {
            console.error('Database query error:', err);
            res.status(500).json({ error: "Database error" });
        } else {
            res.json(result);
        }
    });
});

app.get('/api/get/event/is-user-liked-comment/:commentId/:userId', (req, res) => {
    const commentId = req.params.commentId;
    const userId = req.params.userId;

    db.query(getIsUserLikedEventComment, [commentId, userId], (err, result) => {
        if (err) {
            console.error('Database query error:', err);
            res.status(500).json({ error: "Database error" });
        } else {
            res.json(result);
        }
    });
});



// PUT: Comment
const { putArtistComment, putVenueComment, putEventComment } = require('./queries/putComment');

app.put('/api/put/artist/comment/:commentId', (req, res) => {
    const commentId = req.params.commentId;
    const { comment } = req.body;

    if (!comment) {
        return res.status(400).json({ error: "Comment is required." });
    }

    db.query(putArtistComment, [comment, commentId], (err, result) => {
        if (err) {
            console.error('Database query error:', err);
            res.status(500).json({ error: "Database error" });
        } else {
            res.status(200).json({ message: "Comment updated successfully" });
        }
    });
});

app.put('/api/put/venue/comment/:commentId', (req, res) => {
    const commentId = req.params.commentId;
    const { comment } = req.body;

    if (!comment) {
        return res.status(400).json({ error: "Comment is required." });
    }

    db.query(putVenueComment, [comment, commentId], (err, result) => {
        if (err) {
            console.error('Database query error:', err);
            res.status(500).json({ error: "Database error" });
        } else {
            res.status(200).json({ message: "Comment updated successfully" });
        }
    });
});

app.put('/api/put/event/comment/:commentId', (req, res) => {
    const commentId = req.params.commentId;
    const { comment } = req.body;

    if (!comment) {
        return res.status(400).json({ error: "Comment is required." });
    }

    db.query(putEventComment, [comment, commentId], (err, result) => {
        if (err) {
            console.error('Database query error:', err);
            res.status(500).json({ error: "Database error" });
        } else {
            res.status(200).json({ message: "Comment updated successfully" });
        }
    });
});

// Get Login
const { getLogin } = require('./queries/getLogin');
app.get('/api/get/login/:email/:password', (req, res) => {
    const email = req.params.email;
    const password = req.params.password;

    db.query(getLogin, [email, password], (err, result) => {
        if (err) {
            console.error('Database query error:', err);
            res.status(500).json({ error: "Database error" });

        } else if (result.length === 0) {
            res.status(404).json({ error: "User not found" });

        } else {
            res.status(200).json(result);
        }
    });
});

// Post Signup
const { postSignup, postSignupImage } = require('./queries/postSignup');
app.post('/api/post/signup', (req, res) => {
    const { firstName, lastName, email, password, country, state } = req.body;
    let newUserId = -1;

    db.query(postSignup, [firstName, lastName, email, password, country, state], (err, result) => {
        if (err) {
            console.error('Database query error:', err);
            res.status(500).json({ error: "Database error" });

        } else {
            newUserId = result.insertId;

            db.query(postSignupImage, [newUserId], (err, result) => {
                if (err) {
                    console.error('Database query error:', err);
                    res.status(500).json({ error: "Database error" });

                } else {
                    res.status(200).json({ userId: newUserId });
                }
            });
        }
    });
});

// Post User Recently Viewed Event
const { postUserRecentlyViewedEvent } = require('./queries/postUserRecentlyViewedEvent');
app.post('/api/post/user-recently-viewed-event/:userId/:eventId', (req, res) => {
    const userId = req.params.userId;
    const eventId = req.params.eventId;

    db.query(postUserRecentlyViewedEvent, [userId, eventId], (err, result) => {
        if (err) {
            console.error('Database query error:', err);
            res.status(500).json({ error: "Database error" });

        } else {
            res.status(200).json({ message: "Event added to recently viewed" });
        }
    });
});


// Start the server
app.listen(PORT, () => {
    console.log(`Server is running on ${HOST}:${PORT}`);
});
