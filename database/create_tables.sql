
CREATE TABLE IF NOT EXISTS User (
    UserID INT NOT NULL AUTO_INCREMENT,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(255) NOT NULL UNIQUE,
    Password VARCHAR(50) NOT NULL,
    Country VARCHAR(50) NOT NULL,
    State VARCHAR(50) NOT NULL,
    PRIMARY KEY (UserID)
) ENGINE = InnoDB AUTO_INCREMENT = 1;

CREATE TABLE IF NOT EXISTS Venue (
    VenueID INT NOT NULL AUTO_INCREMENT,
    Title VARCHAR(255) NOT NULL,
    Description TEXT,
    StreetAddress VARCHAR(255) NOT NULL,
    City VARCHAR(50) NOT NULL,
    State VARCHAR(50) NOT NULL,
    PostCode VARCHAR(10) NOT NULL,
    Website VARCHAR(255),
    Featured BOOLEAN NOT NULL,
    PRIMARY KEY (VenueID)
) ENGINE = InnoDB AUTO_INCREMENT = 1;

CREATE TABLE IF NOT EXISTS Stage (
    StageID INT NOT NULL AUTO_INCREMENT,
    VenueID INT NOT NULL,
    Title VARCHAR(50) NOT NULL,
    Description TEXT,
    Capacity INT NOT NULL,
    PRIMARY KEY (StageID),
    FOREIGN KEY (VenueID) REFERENCES Venue(VenueID)
) ENGINE = InnoDB AUTO_INCREMENT = 1;

CREATE TABLE IF NOT EXISTS VenueSocials (
    VenueID INT NOT NULL,
    Platform ENUM(
        'Website',
        'Facebook',
        'Twitter',
        'Instagram',
        'TikTok',
        'SoundCloud',
        'Spotify',
        'Bandcamp',
        'YouTube'
    ) NOT NULL,
    Handle VARCHAR(255) NOT NULL,
    URL VARCHAR(510) NOT NULL,
    PRIMARY KEY (VenueID, Platform),
    FOREIGN KEY (VenueID) REFERENCES Venue(VenueID)
) ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS VenueOpeningHours (
    VenueID INT NOT NULL,
    MonOpen TIME,
    MonClose TIME,
    TueOpen TIME,
    TueClose TIME,
    WedOpen TIME,
    WedClose TIME,
    ThurOpen TIME,
    ThurClose TIME,
    FriOpen TIME,
    FriClose TIME,
    SatOpen TIME,
    SatClose TIME,
    SunOpen TIME,
    SunClose TIME
) ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS Artist (
    ArtistID INT NOT NULL AUTO_INCREMENT,
    Title VARCHAR(50) NOT NULL,
    Country VARCHAR(50) NOT NULL,
    State VARCHAR(50) NOT NULL,
    YearFounded YEAR,
    Description TEXT,
    SpotifyEmbed TEXT,
    YouTubeEmbed TEXT,
    Featured BOOLEAN NOT NULL,
    PRIMARY KEY (ArtistID)
) ENGINE = InnoDB AUTO_INCREMENT = 1;

CREATE TABLE IF NOT EXISTS ArtistSocials (
    ArtistID INT NOT NULL,
    Platform ENUM(
        'Website',
        'Facebook',
        'Twitter',
        'Instagram',
        'TikTok',
        'SoundCloud',
        'Spotify',
        'Bandcamp',
        'YouTube'
    ) NOT NULL,
    Handle VARCHAR(255) NOT NULL,
    URL VARCHAR(510) NOT NULL,
    PRIMARY KEY (ArtistID, Platform),
    FOREIGN KEY (ArtistID) REFERENCES Artist(ArtistID)
) ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS Event (
    EventID INT NOT NULL AUTO_INCREMENT,
    VenueID INT NOT NULL,
    StageID INT NOT NULL,
    Title VARCHAR(50) NOT NULL,
    Description TEXT,
    Date DATE NOT NULL,
    StartTime TIME NOT NULL,
    EndTime TIME NOT NULL,
    Featured BOOLEAN NOT NULL,
    Verified BOOLEAN NOT NULL,
    OriginalPostURL VARCHAR(255) NOT NULL,
    TicketSaleURL VARCHAR(255) NOT NULL,
    Hits INT NOT NULL DEFAULT 0,
    PRIMARY KEY (EventID),
    FOREIGN KEY (VenueID) REFERENCES Venue(VenueID),
    FOREIGN KEY (VenueID, StageID) REFERENCES Stage(VenueID, StageID) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1;

CREATE TABLE IF NOT EXISTS EventPrice (
    EventID INT NOT NULL,
    TicketType VARCHAR(50) NOT NULL,
    Price DECIMAL(10, 2) NOT NULL,
    PRIMARY KEY (EventID, TicketType),
    FOREIGN KEY (EventID) REFERENCES Event(EventID)
) ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS Performance (
    EventID INT NOT NULL,
    ArtistID INT NOT NULL,
    SetListPosition INT NOT NULL,
    PerformanceStartTime TIME,
    PRIMARY KEY (EventID, ArtistID),
    FOREIGN KEY (EventID) REFERENCES Event(EventID),
    FOREIGN KEY (ArtistID) REFERENCES Artist(ArtistID)
) ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS UserSavedEvent (
    UserID INT NOT NULL,
    EventID INT NOT NULL,
    PRIMARY KEY (UserID, EventID),
    FOREIGN KEY (UserID) REFERENCES User(UserID),
    FOREIGN KEY (EventID) REFERENCES Event(EventID)
) ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS UserRecentlyViewedEvent (
    UserID INT NOT NULL,
    EventID INT NOT NULL,
    DateTimeViewed DATETIME NOT NULL,
    PRIMARY KEY (UserID, EventID),
    FOREIGN KEY (UserID) REFERENCES User(UserID),
    FOREIGN KEY (EventID) REFERENCES Event(EventID)
) ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS UserFavouriteArtist (
    UserID INT NOT NULL,
    ArtistID INT NOT NULL,
    PRIMARY KEY (UserID, ArtistID),
    FOREIGN KEY (UserID) REFERENCES User(UserID),
    FOREIGN KEY (ArtistID) REFERENCES Artist(ArtistID)
) ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS UserFavouriteVenue (
    UserID INT NOT NULL,
    VenueID INT NOT NULL,
    PRIMARY KEY (UserID, VenueID),
    FOREIGN KEY (UserID) REFERENCES User(UserID),
    FOREIGN KEY (VenueID) REFERENCES Venue(VenueID)
) ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS Image (
    ImageID INT NOT NULL AUTO_INCREMENT,
    URL VARCHAR(255) NOT NULL,
    PRIMARY KEY (ImageID)
) ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS EventImage (
    EventID INT NOT NULL,
    ImageID INT NOT NULL,
    DisplayOrder INT NOT NULL,
    PRIMARY KEY (EventID, ImageID),
    FOREIGN KEY (EventID) REFERENCES Event(EventID),
    FOREIGN KEY (ImageID) References Image(ImageID)
) ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS VenueImage (
    VenueID INT NOT NULL,
    ImageID INT NOT NULL,
    DisplayOrder INT NOT NULL,
    PRIMARY KEY (VenueID, ImageID),
    FOREIGN KEY (VenueID) REFERENCES Venue(VenueID),
    FOREIGN KEY (ImageID) References Image(ImageID)
) ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS ArtistImage (
    ArtistID INT NOT NULL,
    ImageID INT NOT NULL,
    DisplayOrder INT NOT NULL,
    PRIMARY KEY (ArtistID, ImageID),
    FOREIGN KEY (ArtistID) REFERENCES Artist(ArtistID),
    FOREIGN KEY (ImageID) REFERENCES Image(ImageID)
) ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS UserImage (
    UserID INT NOT NULL,
    ImageID INT NOT NULL,
    PRIMARY KEY (UserID, ImageID),
    FOREIGN KEY (UserID) REFERENCES User(UserID),
    FOREIGN KEY (ImageID) REFERENCES Image(ImageID)
) ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS Banner (
    BannerID INT NOT NULL,
    ImageID INT NOT NULL,
    FocusType ENUM('event', 'artist', 'venue') NOT NULL,
    FocusID INT NOT NULL,
    PRIMARY KEY (BannerID, ImageID),
    FOREIGN KEY (ImageID) REFERENCES Image(ImageID)
) ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS EventComment (
    EventCommentID INT NOT NULL AUTO_INCREMENT,
    EventID INT NOT NULL,
    UserID INT NOT NULL,
    DateTime DateTime NOT NULL,
    Comment TEXT NOT NULL,
    IsEdited BOOL DEFAULT 0,
    PRIMARY KEY (EventCommentID),
    FOREIGN KEY (EventID) REFERENCES Event(EventID),
    FOREIGN KEY (UserID) REFERENCES User(UserID)
) ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS ArtistComment (
    ArtistCommentID INT NOT NULL AUTO_INCREMENT,
    ArtistID INT NOT NULL,
    UserID INT NOT NULL,
    DateTime DateTime NOT NULL,
    Comment TEXT NOT NULL,
    IsEdited BOOL DEFAULT 0,
    PRIMARY KEY (ArtistCommentID),
    FOREIGN KEY (ArtistID) REFERENCES Artist(ArtistID),
    FOREIGN KEY (UserID) REFERENCES User(UserID)
) ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS VenueComment (
    VenueCommentID INT NOT NULL AUTO_INCREMENT,
    VenueID INT NOT NULL,
    UserID INT NOT NULL,
    DateTime DateTime NOT NULL,
    Comment TEXT NOT NULL,
    IsEdited BOOL DEFAULT 0,
    PRIMARY KEY (VenueCommentID),
    FOREIGN KEY (VenueID) REFERENCES Venue(VenueID),
    FOREIGN KEY (UserID) REFERENCES User(UserID)
) ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS EventCommentLike (
    EventCommentID INT NOT NULL,
    UserID INT NOT NULL,
    PRIMARY KEY (EventCommentID, UserID),
    FOREIGN KEY (EventCommentID) REFERENCES EventComment(EventCommentID) ON DELETE CASCADE,
    FOREIGN KEY (UserID) REFERENCES User(UserID)
) ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS ArtistCommentLike (
    ArtistCommentID INT NOT NULL,
    UserID INT NOT NULL,
    PRIMARY KEY (ArtistCommentID, UserID),
    FOREIGN KEY (ArtistCommentID) REFERENCES ArtistComment(ArtistCommentID) ON DELETE CASCADE,
    FOREIGN KEY (UserID) REFERENCES User(UserID)
) ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS VenueCommentLike (
    VenueCommentID INT NOT NULL,
    UserID INT NOT NULL,
    PRIMARY KEY (VenueCommentID, UserID),
    FOREIGN KEY (VenueCommentID) REFERENCES VenueComment(VenueCommentID) ON DELETE CASCADE,
    FOREIGN KEY (UserID) REFERENCES User(UserID)
) ENGINE = InnoDB;