-- User
INSERT INTO User (FirstName, LastName, Email, Password, Country, State) VALUES
    ('Matthew', 'Cross', '101828627@student.swin.edu.au', 'password', 'Australia', 'Victoria');

-- Venue
INSERT INTO Venue (Title, Description, StreetAddress, City, State, PostCode, Website, Featured) VALUES
    (
        'The Gasometer Hotel',
        "Located in Collingwood's vibrant northern quarter on Smith Street, The Gasometer is your go-to live music venue. With an eclectic lineup spanning genres and a rich history intertwined with Melbourne's musical fabric, we're the place where unforgettable nights are made. Rock, indie, punk, electronic, folk, dance – our stage hosts it all, making sure there's something for every music lover. As the rhythms fill the air, grab a beer and join the community that knows there's no resisting a show at The Gaso.",
        '484 Smith St',
        'Collingwood',
        'VIC',
        '3066',
        'https://www.thegasometerhotel.com.au/shows',
        1
    ),
    (
        'The Corner Hotel',
        'The Corner Hotel in the Melbourne suburb of Richmond, Victoria, Australia, is a remodelled 19th-century pub which has been a live music venue since the 1940s and, since 1995, a popular rock music venue and rooftop bar.',
        '57 Swan St',
        'Richmond',
        'VIC',
        '3121',
        'https://cornerhotel.com/gigs/',
        0
    ),
    (
        'The Tote',
        "After 20,000 angry music fans hit the streets to protest new licensing laws that led to The Tote's closure in 2010, this beloved church of punk rock reopened six months later. Now, this crusty jewel in the crown of Melbourne's rock scene is just doing what it does best – beer garden BBQs, hazy late nights and heaving, sweaty rock 'n' roll.",
        '71 Johnston St',
        'Collingwood',
        'VIC',
        '3066',
        'https://thetotehotel.com/gig-guide/',
        0
    ),
    (
        'The Retreat Hotel',
        "Welcome to The Retreat Hotel, Brunswick's home of live music. You’ll find us at 280 Sydney Rd, Brunswick VIC 3056.\n\nThere's something for everyone at The Retreat!\n\nWe have live music and entertainment playing throughout the pub seven days a week, across the front bar and the band room. Check out all our upcoming gigs here.\n\nWe've also got a huge beer garden that can accommodate big and small groups alike. We have a great range of drinks + tap beers, and a kitchen serving delicious pub meals and weekly specials. \n\nThe Retreat kitchen is open from 12pm Monday - Sunday, with our new snack menu available from 2pm Monday - Wednesday. View the menu here.\n\nOut late? DJs play until 3am every Friday and Saturday night!\n\nUnderage patrons are welcome at the venue as long as they are accompanied by a legal guardian, but must leave the venue by 10pm or after the gig has finished. Please let a member of staff know when you arrive.",
        '280 Sydney Rd',
        'Brunswick',
        'VIC',
        '3056',
        'https://retreathotelbrunswick.com.au/events',
        1
    ),
    (
        'Hotel Esplanade (The Espy)',
        "Whether you want to enjoy a good meal, kick back with some drinks or take in a gig, there’s only one place to be – Hotel Esplanade, the best pub in St Kilda. Fine food, functions, fun gigs and five levels of different bars, Hotel Esplanade has historically been one of the most popular bars in St Kilda.\n\nWhatever bar scene you prefer, whatever tipples you enjoy, you’ll find everything you could desire under one roof at Hotel Esplanade. We operate 12 different bars across 5 levels, with hand-picked wines, classic and custom cocktails, more craft beers than you could ever imagine and spirits from our very own in-house barrel-ageing program. We even show live sports in the Public Bar, with every live AFL kick-off the season show on our TVs.\n\nIt is this widespread range of bars and drinks, coupled with our excellent customer service that has earned us our stellar reputation as one of the leading St Kilda bars.",
        '11 The Esplanade',
        'St Kilda',
        'VIC',
        '3182',
        'https://hotelesplanade.com.au/espy-live/',
        1
    ),
    (
        'The Night Cat',
        "Established in 1994, The Night Cat is a Fitzroy institution. It has been a genre-focused venue since first opening, specialising in Funk, Soul, Latin, Disco, Hip Hop and R&B.\n\nPresenting artists in a unique 360-degree format, the venue has been the launchpad for several iconic Australian bands including The Cat Empire and The Bamboos. Continuing in this tradition, in recent years the venue has contributed to the development of artists like 30/70 and Allysha Joy, Zeitgeist Freedom Energy Exchange, DubFx and Honey.\n\nTimeless in style, the central performance space allows audiences a clear view of the stage from anywhere in the venue, as well as an up close and intimate experience with performers. With no pillars to obstruct views, huge recent production upgrades and exemplary venue management, The Night Cat offers a seamless audience experience from ticketing, to minimal bar queues and the classic Meyer sound system.\n\nPast performers include: King Gizzard And The Lizard Wizard, Nightmares On Wax (UK), Sister Nancy, Nai Palm, Incognito (UK), Shigeto (USA), Sampa The Great, Azymuth & Marcos Valle (BRZ), Melbourne Ska Orchestra, Mildlife, You Am I, Amyl and The Sniffers, Lonnie Liston Smith (USA), Kylie Auldist, Osaka Monaurail (JPN), The Pharcyde (USA), ZFEX, Mulatu Astatke (ETH), Floating Points (UK), The Teskey Brothers, Dead Prez (USA), DJ Jazzy Jeff (USA), Allen Stone (USA), Victor Wooten (USA), Wet Leg (UK).",
        '137-141 Johnston St',
        'Fitzroy',
        'VIC',
        '3065',
        'https://www.thenightcat.com.au/shows',
        0
    );

-- Stages
INSERT INTO Stage (VenueID, Title, Description, Capacity) VALUES

    -- The Gasometer
    (1, 'Downstairs', 'The main stage at The Gasometer Hotel.', 280),
    (1, 'Upstairs', 'Upstairs at The Gasometer Hotel.', 70),

    -- The Corner Hotel
    (2, 'Main Stage', 'The main stage at The Corner Hotel.', 800),

    -- The Tote
    (3, 'Main Stage', 'The main stage at The Tote.', 408),
    (3, 'Cobra Bar', 'The cobra bar at The Tote.', 100),
    (3, 'Front Bar', 'The front bar at The Tote.', 50),

    -- The Retreat Hotel
    (4, 'Main Stage', 'The one and only.', 125),

    -- Hotel Esplanade
    (5, 'Gershwin Room', 'The Gershwin Room at The Espy.', 500),
    (5, 'The Basement', 'The basement bar at The Espy.', 60),

    -- The Night Cat
    (6, 'Main Stage', 'Center stage at The Night Cat', 700);


-- Venue Socials
INSERT INTO VenueSocials (VenueID, Platform, Handle, URL) VALUES

    -- The Gasometer
    (1, 'Website', 'thegasometerhotel.com.au', 'https://www.thegasometerhotel.com.au/'),
    (1, 'Facebook', 'The Gasometer Hotel', 'https://www.facebook.com/TheGasometerHotel'),
    (1, 'Instagram', 'thegasometer', 'https://www.instagram.com/thegasometer/'),

    -- The Corner Hotel
    (2, 'Website', 'cornerhotel.com', 'https://cornerhotel.com/'),
    (2, 'Facebook', 'Corner Hotel', 'https://www.facebook.com/thecornerhotel'),
    (2, 'Instagram', 'cornerhotel', 'https://www.instagram.com/cornerhotel'),

    -- The Tote
    (3, 'Website', 'thetotehotel.com', 'https://thetotehotel.com/'),
    (3, 'Facebook', 'The Tote', 'https://www.facebook.com/thetotehotel/'),
    (3, 'Instagram', 'thetotehotel', 'https://www.instagram.com/thetotehotel/'),
    (3, 'YouTube', 'thetotehotel661', 'https://www.youtube.com/@thetotehotel661'),

    -- The Retreat Hotel
    (4, 'Website', 'retreathotelbrunswick.com.au', 'https://retreathotelbrunswick.com.au/'),
    (4, 'Facebook', 'The Retreat Hotel', 'https://www.facebook.com/theretreathotel'),
    (4, 'Instagram', 'retreat_hotel_brunswick', 'https://www.instagram.com/retreat_hotel_brunswick/?hl=en'),

    -- Hotel Esplanade
    (5, 'Website', 'hotelesplanade.com.au', 'https://hotelesplanade.com.au/'),
    (5, 'Facebook', 'The Espy', 'https://hotelesplanade.com.au/'),
    (5, 'Instagram', 'hotelesplanadestkilda', 'https://www.instagram.com/hotelesplanadestkilda/?hl=en'),

    -- The Night Cat
    (6, 'Website', 'thenightcat.com.au', 'https://www.thenightcat.com.au/'),
    (6, 'Facebook', 'The Night Cat', 'https://www.facebook.com/thenightcatofficial'),
    (6, 'Instagram', 'thenightcat_fitzroy', 'https://www.instagram.com/thenightcat_fitzroy/?hl=en');

-- Venue Opening Hours
INSERT INTO VenueOpeningHours (
    VenueID,
    MonOpen, MonClose,
    TueOpen, TueClose,
    WedOpen, WedClose,
    ThurOpen, ThurClose,
    FriOpen, FriClose,
    SatOpen, SatClose,
    SunOpen, SunClose
) VALUES
(
    -- The Gasometer
    1,
    '00:00:00', '00:00:00',  -- Monday (Closed)
    '00:00:00', '00:00:00',  -- Tuesday (Closed)
    '16:00:00', '23:00:00',  -- Wednesday
    '16:00:00', '00:00:00',  -- Thursday
    '16:00:00', '03:00:00',  -- Friday
    '16:00:00', '03:00:00',  -- Saturday
    '16:00:00', '23:00:00'   -- Sunday
),
(
    -- The Corner Hotel
    2,
    '16:00:00', '23:59:59',  -- Monday
    '12:00:00', '23:59:59',  -- Tuesday
    '12:00:00', '23:59:59',  -- Wednesday
    '12:00:00', '23:59:59',  -- Thursday
    '12:00:00', '23:59:59',  -- Friday
    '12:00:00', '23:59:59',  -- Saturday
    '12:00:00', '23:59:59'   -- Sunday
),
(
    -- The Tote
    3,
    '00:00:00', '00:00:00',  -- Monday (Closed)
    '16:00:00', '23:59:59',  -- Tuesday
    '16:00:00', '23:59:59',  -- Wednesday
    '16:00:00', '23:59:59',  -- Thursday
    '12:00:00', '03:00:00',  -- Friday
    '12:00:00', '03:00:00',  -- Saturday
    '12:00:00', '23:59:59'   -- Sunday
),
(
    -- The Retreat Hotel
    4,
    '15:00:00', '01:00:00',  -- Monday
    '15:00:00', '01:00:00',  -- Tuesday
    '15:00:00', '01:00:00',  -- Wednesday
    '12:00:00', '01:00:00',  -- Thursday
    '12:00:00', '03:00:00',  -- Friday
    '12:00:00', '03:00:00',  -- Saturday
    '12:00:00', '01:00:00'   -- Sunday
),
(
    -- Hotel Esplanade
    5,
    '12:00:00', '23:59:59',  -- Monday
    '12:00:00', '23:59:59',  -- Tuesday
    '12:00:00', '23:59:59',  -- Wednesday
    '12:00:00', '23:59:59',  -- Thursday
    '12:00:00', '23:59:59',  -- Friday
    '12:00:00', '23:59:59',  -- Saturday
    '12:00:00', '23:59:59'   -- Sunday
),
(
    -- The Night Cat (MADE UP)
    6,
    '00:00:00', '00:00:00',  -- Monday (Closed)
    '16:00:00', '23:59:59',  -- Tuesday
    '16:00:00', '23:59:59',  -- Wednesday
    '16:00:00', '23:59:59',  -- Thursday
    '12:00:00', '03:00:00',  -- Friday
    '12:00:00', '03:00:00',  -- Saturday
    '12:00:00', '23:59:59'   -- Sunday
);

-- Artist
INSERT INTO Artist (Title, Country, State, YearFounded, Description, SpotifyEmbed, YouTubeEmbed, Featured) VALUES

    -- 1: The Amazing Devil
    (
        'The Amazing Devil',
        'United Kingdom',
        'London',
        2013,
        'The Amazing Devil are a British folk band from London, England. They are known for their dark and haunting music.',
        'https://open.spotify.com/embed/artist/3cWRLr14V7jBctYNGaSM0S',
        'https://www.youtube.com/embed/p3wFZfpMQmM?si=M61qRBrV1pKOGeHM',
        1
    ),

    -- 2: Amber Drift
    (
        'Amber Drift',
        'Australia',
        'Victoria',
        2017,
        'Amber Drift are an Australian rock band from Melbourne, Victoria. They are known for their energetic live performances.',
        'https://open.spotify.com/embed/artist/063ti2u3HXw80TtW04TMlx',
        'https://www.youtube.com/embed/ZdFut-utlL4?si=yvroxzmFG6p7urf2',
        0
    ),

    -- 3: Gand of Youths
    (
        'Gang of Youths',
        'Australia',
        'New South Wales',
        2011,
        'Gang of Youths are an Australian rock band from Sydney, New South Wales. They are known for their powerful and emotional music.',
        'https://open.spotify.com/embed/artist/3YQKmKGau1PzlVlkL1iodx',
        'https://www.youtube.com/embed/6xW3A6d1P0U?si=1',
        1
    ),

    -- 4: Tash Sultana
    (
        'Tash Sultana',
        'Australia',
        'Victoria',
        2013,
        'Tash Sultana is an Australian singer-songwriter and multi-instrumentalist from Melbourne, Victoria. They are known for their unique blend of genres and live looping performances.',
        'https://open.spotify.com/embed/artist/6zVFRTB0Y1whWyH7ZNmywf',
        'https://www.youtube.com/embed/1z8Anr8U92I?si=2',
        1
    ),

    -- 5: Courtney Barnett
    (
        'Courtney Barnett',
        'Australia',
        'Victoria',
        2012,
        'Courtney Barnett is an Australian singer-songwriter and guitarist from Melbourne, Victoria. She is known for her witty and introspective lyrics.',
        'https://open.spotify.com/embed/artist/3gd8FJtBJtkRxdfbTu19U2',
        'https://www.youtube.com/embed/TID0jzGwFYY?si=3',
        0
    ),

    -- 6: King Gizzard & the Lizard Wizard
    (
        'King Gizzard & the Lizard Wizard',
        'Australia',
        'Victoria',
        2010,
        'King Gizzard & the Lizard Wizard are an Australian rock band from Melbourne, Victoria. They are known for their prolific output and eclectic musical style.',
        'https://open.spotify.com/embed/artist/6XYvaoDGE0VmRt83Jss9Sn',
        'https://www.youtube.com/embed/6f78_Tf4Tdk?si=4',
        1
    ),

    -- 7: The Teskey Brothers
    (
        'The Teskey Brothers',
        'Australia',
        'Victoria',
        2008,
        'The Teskey Brothers are an Australian blues rock band from Melbourne, Victoria. They are known for their soulful sound and powerful live performances.',
        'https://open.spotify.com/embed/artist/1bqxdqvUtPWZri43cKHac8',
        'https://www.youtube.com/embed/1iAYhQsQhSY?si=5',
        0
    ),

    -- 8: Vance Joy
    (
        'Vance Joy',
        'Australia',
        'Victoria',
        2013,
        'Vance Joy is an Australian singer-songwriter from Melbourne, Victoria. He is known for his hit single "Riptide" and his folk-pop sound.',
        'https://open.spotify.com/embed/artist/6XyY86QOPPrYVGvF9ch6wz',
        'https://www.youtube.com/embed/uJ_1HMAGb4k?si=6',
        1
    ),

    -- 9: Tame Impala
    (
        'Tame Impala',
        'Australia',
        'Western Australia',
        2007,
        'Tame Impala is an Australian psychedelic music project led by multi-instrumentalist Kevin Parker from Perth, Western Australia. They are known for their innovative sound and production.',
        'https://open.spotify.com/embed/artist/5INjqkS1o8h1imAzPqGZBb',
        'https://www.youtube.com/embed/wQvM1hZyZ6Y?si=7',
        1
    ),

    -- 10: The Cat Empire
    (
        'The Cat Empire',
        'Australia',
        'Victoria',
        1999,
        'The Cat Empire are an Australian ska and jazz band from Melbourne, Victoria. They are known for their energetic live performances and eclectic musical style.',
        'https://open.spotify.com/embed/artist/4vGrte8FDu062Ntj0RsPiZ',
        'https://www.youtube.com/embed/4xjPODksI08?si=8',
        0
    ),

    -- 11: The Jungle Giants
    (
        'The Jungle Giants',
        'Australia',
        'Queensland',
        2011,
        'The Jungle Giants are an Australian indie rock band from Brisbane, Queensland. They are known for their catchy melodies and energetic live shows.',
        'https://open.spotify.com/embed/artist/2QsynagSdAqZj3U9HgDzjD',
        'https://www.youtube.com/embed/8mGZyXqkq1I?si=9',
        1
    ),

    -- 12: Ball Park Music
    (
        'Ball Park Music',
        'Australia',
        'Queensland',
        2008,
        'Ball Park Music are an Australian indie rock band from Brisbane, Queensland. They are known for their quirky and catchy songs.',
        'https://open.spotify.com/embed/artist/0HlxL5hisLf59ETEPM3lTg',
        'https://www.youtube.com/embed/5xQF0gerTtM?si=10',
        0
    ),

    -- 13: Teether & Kuya Neil
    (
        'Teether & Kuya Neil',
        'Australia',
        'Melbourne',
        2020,
        'When rapper Teether & producer Kuya Neil began to collaborate in late 2020, two powerful forces in the Naarm/Melbourne underground came together to create something rare and special. At 26, Teether already has a deep dive catalogue of solo releases to his name, largely released via the X Amount collective of which he is a founding member. There are also collaborative projects like Too Birds and even atmospheric metal bands stretching back to the early 2010s.\n\nKuya Neil is just as prolific. His CV ranges from membership of NZ “family rap ensemble” Fanau Spa, to collaboration with local heroes Papaphilia and Various Asses, to his work with Melbourne Sound School. Together, Teether & Kuya Neil make future-focused rap informed by modern club styles like footwork, gqom and bass music. Teether’s nonchalant but vivid words infuse Neil’s disorientating, hyper-modern production. As Dave Ruby Howe writes on Unearthed, “brain bending beats all round.',
        'https://open.spotify.com/embed/artist/4rWywJgjoeVMO8LY87xYZo?utm_source=generator',
        'https://www.youtube.com/embed/tMvp5NqhyQ8?si=of8ZbKQIaW8Lr4Co',
        0
    ),

    -- 14: Dear Matilda
    (
        'Dear Matilda',
        'Australia',
        'Melbourne',
        2023,
        'Dear Matilda, known on stage for their explosive energy and lyrical dynamite, are dropping their new single “Anymore” this October.\n\nFront woman, Gabrielle Matilda, with her open and honest lyrics and a dynamic voice bursting with passion says “the song is about reflecting on a broken relationship, being vulnerable and honest enough to yourself to admit that it’s not working, but also, how much it burns to say goodbye to someone you did really care for.”\n\n“Anymore” is a marking a thrilling new direction for the band, with previous releases until now leaning towards acoustic punk, or more recently, pop on their self produced “Drive Me Crazy”. The new track “Anymore” pumps you up with thumping kicks, distortion galore and a whole lotta “get out of my face energy”.',
        'https://open.spotify.com/embed/artist/6Hy5Kaq0jNhO8byILBTr0I?utm_source=generator',
        'https://www.youtube.com/embed/uEbPrdu1wyc?si=-XdrNIGJSPCn57jL',
        0
    ),

    -- 15: Tiarnie
    (
        'Tiarnie',
        'Australia',
        'Melbounre',
        2020,
        "Over-thinker, over-feeler, over-sharer; Tiarnie evokes emotion with her honest and raw lyrics, intricate guitar riffs and punchy percussion.\n\nTiarnie navigates the complications and heartbreaks of this halfway age where you're expected to act like you know what's going on/what you want to do with life/who you are - but the only thing you seem to be good at is writing sad songs in your messy bedroom at 2am.\n\nTiarnie has released two EP’s - ‘Consistently Inconsistent’ (2020) and ‘for Geoff Dyer’ (2021) - garnering the attention of Triple J, FBI radio and EMI Records. Tiarnie has supported reputable artists such as Kingswood, The Vanns, Ali Barter, Eliza and the Delusionals, The Rubens, Debbies and Sputnik Sweetheart.\n\nLast year, Tiarnie booked a one-way ticket to a reclusive cabin in Canada, songwriting as a form of therapy & dipping to NYC for open mic nights. Now back home, Tiarnie has just moved to Naarm and is itching to show you her new sound.\n\nSad girl acoustic album soon x",
        'https://open.spotify.com/embed/artist/1q1h99hjLcsnuG92jaC8Tq?utm_source=generator',
        'https://www.youtube.com/embed/DfUNgrPnFVI?si=8h_6Zr9yfK123PvP',
        0
    ),

    -- 16: Get Jaxxed
    (
        'Get Jaxxed',
        'Australia',
        'Melbourne',
        2025,
        'Get Jaxxed',
        'https://open.spotify.com/embed/artist/3pet0u87jkGKNJJEcTNr1M?utm_source=generator',
        null,
        0
    ),

    -- 17: GBH
    (
        'GBH',
        'England',
        'Birmingham',
        1978,
        "GBH, originally known as Charged GBH, is an influential English punk rock band formed in 1978 in Birmingham. Pioneers of the UK82 street punk movement, GBH is renowned for their aggressive sound and politically charged lyrics. Their debut album, City Baby Attacked by Rats (1982), and its follow-up City Babys Revenge (1983) are considered classics in the punk genre. Over the years, GBH's raw energy and steadfast dedication to their punk roots have earned them a dedicated following worldwide, influencing a wide range of bands from metal to punk. Despite lineup changes, the band continues to tour and release new music, with their latest album Momentum released in 2017 on Hellcat Records.",
        'https://open.spotify.com/embed/artist/0yqupKw0GMDWXHpsxCPysY?utm_source=generator',
        'https://www.youtube.com/embed/sX7HqF9wAIE?si=29ul4AsgTMylfVWT',
        0
    ),

    -- 18: Destruktor
    (
        'Destruktor',
        'Bendigo',
        'Australia',
        1997,
        'Description',
        'https://open.spotify.com/embed/artist/33HNLzoPrvtYiT6LPOHKut?utm_source=generator',
        'https://www.youtube.com/embed/-2ZDVXcg-Hs?si=n0yAalsQrM25QJgZ',
        0
    ),

    -- 19: Voidfall
    (
        'Voidfall',
        'Australia',
        'Melbourne',
        2015,
        'Voidfall is a five-piece old-school death metal band from Melbourne, heavily influenced by early 90s Swedish death metal, with elements of English doom death metal and Scandinavian black metal. Their debut album, "No God But Death," was released in 2023.',
        'https://open.spotify.com/embed/artist/1k3adcGlmC5WziJPL9lnVV',
        'https://www.youtube.com/embed/KVRG93RNBeo',
        0
    ),

    -- 20: Sufferance
    (
        'Sufferance',
        'Australia',
        'Melbourne',
        2015,
        'Sufferance is a Melbourne-based metalcore band known for their crushing breakdowns, atmospheric melodies, and emotionally charged lyrics. They have built a strong local following through intense live shows and a dedication to DIY ethics. Their latest album, "Endless Collapse," was released in 2023.',
        'https://open.spotify.com/embed/artist/4YZABC123DEF',
        'https://www.youtube.com/embed/ABC98765432',
        0
    ),

    -- 21: ABIGAIL
    (
        'ABIGAIL',
        'Japan',
        'Tokyo',
        1992,
        'ABIGAIL is a Japanese black/thrash metal band formed in Tokyo in 1992. Known as "The Most Evil Band in Japan," they blend raw black metal aggression with speed-thrash intensity. Their underground cult status has grown internationally, with numerous releases showcasing their unfiltered, chaotic sound. Their debut album, "Intercourse & Lust," was released in 1997.',
        'https://open.spotify.com/embed/artist/2ABC345XYZ678',
        'https://www.youtube.com/embed/XYZ98765432',
        0
    ),

    -- 22: STALKER
    (
        'STALKER',
        'New Zealand',
        'Wellington',
        2016,
        'STALKER is a New Zealand-based speed metal band formed in Wellington in 2016. Drawing heavy influence from 80s thrash and traditional heavy metal, they are known for their blistering guitar riffs, high-energy performances, and aggressive vocal delivery. Their debut album, "Shadow of the Sword," was released in 2017.',
        'https://open.spotify.com/embed/artist/5DEF678XYZ123',
        'https://www.youtube.com/embed/XYZ54321098',
        0
    ),

    -- 23: Austere
    (
        'Austere',
        'Australia',
        'New South Wales',
        2005,
        'Austere is an Australian black metal band formed in New South Wales in 2005. The band is known for its melancholic and atmospheric sound, combining elements of depressive black metal with emotional, introspective lyrics. They have garnered a loyal following within the underground scene with albums like "To Lay Like Old Ashes" and "Withering Illusions and Desolation."',
        'https://open.spotify.com/embed/artist/3UeUAbcvNrd3z7szkhwA4M',
        'https://www.youtube.com/embed/7dyolw-PWOk',
        0
    ),

    -- 24: Skuggor
    (
        'Skuggor',
        'Sweden',
        'Västra Götaland',
        2007,
        'Skuggor is a Swedish black metal band that formed in 2007 in Västra Götaland. Their music is characterized by raw and atmospheric black metal elements, blending dark melodies with fierce aggression. The band has been noted for its ability to create haunting and immersive soundscapes, with albums such as "Mörka Vägar" showcasing their ability to evoke both despair and intensity.',
        'https://open.spotify.com/embed/artist/1Xb0uIz0nv7kKtvfP4z0yR',
        'https://www.youtube.com/embed/K1q16yYp9U0',
        0
    ),

    -- 25: Paroxysmal Descent
    (
        'Paroxysmal Descent',
        'Australia',
        'New South Wales',
        2014,
        'Paroxysmal Descent is an Australian death metal band from New South Wales, formed in 2014. The band blends elements of brutal death metal with technical and atmospheric passages, creating a sound that is both intense and intricate. Their debut album, "Obsidian," released in 2017, established them as a force in the underground death metal scene.',
        'https://open.spotify.com/embed/artist/3fE8e9A2kqEgEhp2vV8Qj5',
        'https://www.youtube.com/embed/Mw5RxTk29mI',
        0
    ),

    -- 26: Rum Jungle
    (
        'Rum Jungle',
        'Australia',
        'New South Wales',
        2018,
        'Rum Jungle is a Newcastle-based band known for blending reggae-rock, alt-pop, and psychedelic grooves. Their infectious anthems and laid-back vibes have earned them a dedicated fanbase. Their debut album, "Recency Bias," is set to release on February 21, 2025.',
        'https://open.spotify.com/embed/artist/3Pzu17LKdfktc4pVsTk8YS',
        'https://www.youtube.com/embed/XYZ12345678',
        0
    ),

    -- 27: Letters to Lions
    (
        'Letters to Lions',
        'Australia',
        'New South Wales',
        2015,
        'Letters to Lions is an indie rock band from Sydney, known for energetic performances and catchy melodies. Since forming in 2015, they have released several EPs and built a strong following in the Australian music scene.',
        'https://open.spotify.com/embed/artist/3fE8e9A2kqEgEhp2vV8Qj5',
        'https://www.youtube.com/embed/ABC98765432',
        0
    ),

    -- 28: Underlay
    (
        'Underlay',
        'Australia',
        'Victoria',
        2020,
        'Underlay is a Melbourne-based band blending alternative rock and psychedelic influences. Since forming in 2020, they have quickly gained attention for their unique sound and engaging live performances.',
        'https://open.spotify.com/embed/artist/4gH8e9A2kqEgEhp2vV8Qj6',
        'https://www.youtube.com/embed/DEF12345678',
        0
    ),

    -- 29: Winter McQuinn
    (
        'Winter McQuinn',
        'Australia',
        'Victoria',
        2019,
        'Winter McQuinn is a Melbourne-based singer-songwriter known for his soulful voice and introspective lyrics. Since 2019, he has captivated audiences with his blend of folk and indie music.',
        'https://open.spotify.com/embed/artist/5hI8e9A2kqEgEhp2vV8Qj7',
        'https://www.youtube.com/embed/GHI12345678',
        0
    ),

    -- 30: Acacia Pip
    (
        'Acacia Pip',
        'Australia',
        'Victoria',
        2021,
        'Acacia Pip is an emerging artist from Melbourne, blending pop and electronic elements. Since her debut in 2021, she has gained attention for her catchy tunes and dynamic performances.',
        'https://open.spotify.com/embed/artist/6jI8e9A2kqEgEhp2vV8Qj8',
        'https://www.youtube.com/embed/JKL12345678',
        0
    ),

    -- 31: Richy Mitch & The Coal Miners
    (
        'Richy Mitch & The Coal Miners',
        'United States',
        'Montana',
        2017,
        'Richy Mitch & The Coal Miners is an indie folk band from Montana, known for their heartfelt lyrics and atmospheric sound. Since forming in 2017, they have gained a global following through their self-produced albums and viral online presence.',
        'https://open.spotify.com/embed/artist/0E39u6czWMiDFjdoqQ2sSH',
        'https://www.youtube.com/embed/XYZ12345678',
        0
    ),

    -- 32: South Summit
    (
        'South Summit',
        'Australia',
        'Western Australia',
        2020,
        'South Summit is a Perth-based alternative rock band blending indie, reggae, and psychedelic influences. Formed in 2020, they have quickly gained recognition for their soulful melodies and high-energy performances.',
        'https://open.spotify.com/embed/artist/3JpF7ED8uPA3kWu97v8JDY',
        'https://www.youtube.com/embed/ABC98765432',
        0
    ),

    -- 33: Kurilpa Reach
    (
        'Kurilpa Reach',
        'Australia',
        'Queensland',
        2018,
        'Kurilpa Reach is a Brisbane-based band fusing reggae, funk, and rock, creating an infectious groove-driven sound. Since their formation in 2018, they have built a strong fanbase with their dynamic live performances.',
        'https://open.spotify.com/embed/artist/6CmI9Ab35Y3M6NJeWpvZLt',
        'https://www.youtube.com/embed/DEF12345678',
        0
    ),

    -- 34: Placebo
    (
        'Placebo',
        'United Kingdom',
        'London',
        1994,
        'Placebo is a British alternative rock band formed in London in 1994. Known for their androgynous image and distinctive sound, they have released several critically acclaimed albums, including "Without You I’m Nothing" and "Meds."',
        'https://open.spotify.com/embed/artist/3ZztVuWxHzNpl0THurTFCv',
        'https://www.youtube.com/embed/GHI12345678',
        0
    ),

    -- 35: Black Market Music
    (
        'Black Market Music',
        'Australia',
        'Victoria',
        2015,
        'Black Market Music is a Melbourne-based rock band known for their blues-infused alternative rock sound. Since forming in 2015, they have built a reputation for their raw, high-energy performances.',
        'https://open.spotify.com/embed/artist/7pI8e9A2kqEgEhp2vV8Qj9',
        'https://www.youtube.com/embed/JKL12345678',
        0
    ),

    -- 36: Gena Rose Bruce
    (
        'Gena Rose Bruce',
        'Australia',
        'Victoria',
        2019,
        'Gena Rose Bruce is a Melbourne-based singer-songwriter known for her moody, atmospheric indie rock with introspective lyrics and haunting vocals. Her debut album, "Can’t Make You Love Me," released in 2019, received critical acclaim.',
        'https://open.spotify.com/embed/artist/4E7xnJBDtSHEhQhhI76IUV',
        'https://www.youtube.com/embed/XYZ12345678',
        0
    ),

    -- 37: Kristen Hersh
    (
        'Kristen Hersh',
        'United States',
        'Rhode Island',
        1980,
        'Kristen Hersh is an American singer-songwriter and guitarist, best known as the frontwoman of alternative rock band Throwing Muses. Since the 1980s, she has maintained a prolific solo career, blending folk, rock, and deeply personal storytelling.',
        'https://open.spotify.com/embed/artist/2XBxuGqzzZtNt9H6DcIqJ8',
        'https://www.youtube.com/embed/ABC98765432',
        0
    ),

    -- 38: Shihad
    (
        'Shihad',
        'New Zealand',
        'Wellington',
        1988,
        'Shihad is a New Zealand rock band formed in 1988, known for their hard-hitting alternative and industrial rock sound. With multiple platinum albums and a dedicated following, they are one of New Zealand’s most successful rock acts.',
        'https://open.spotify.com/embed/artist/5XkbuUwCJKJLX9HP7Zlffg',
        'https://www.youtube.com/embed/DEF12345678',
        0
    ),

    -- 39: Todd Rundgren
    (
        'Todd Rundgren',
        'United States',
        'Pennsylvania',
        1967,
        'Todd Rundgren is an American multi-instrumentalist, songwriter, and producer known for his eclectic career spanning rock, pop, and electronic music. Since the 1960s, he has produced numerous classic albums and is widely regarded as a musical innovator.',
        'https://open.spotify.com/embed/artist/0rlKlAYR9iUlrhJv6i0hNi',
        'https://www.youtube.com/embed/GHI12345678',
        0
    ),

    -- 40: Queen Omega & The Royal Souls
    (
        'Queen Omega & The Royal Souls',
        'Trinidad and Tobago',
        'Port of Spain',
        2000,
        'Queen Omega is a Trinidadian reggae artist blending conscious lyrics with powerful melodies. Backed by The Royal Souls, she has been a prominent figure in modern reggae since the early 2000s, gaining international recognition.',
        'https://open.spotify.com/embed/artist/7rsh5qJUtBS1zQWyFDRJlH',
        'https://www.youtube.com/embed/JKL12345678',
        0
    ),

    -- 41: Housewife’s Choice
    (
        'Housewife’s Choice',
        'Australia',
        'Victoria',
        2012,
        'Housewife’s Choice is a Melbourne-based reggae and ska band known for their infectious grooves and high-energy performances. Since forming in 2012, they have become a staple in the Australian reggae scene.',
        'https://open.spotify.com/embed/artist/6V8c9bD2eTuk2LRhN89QAz',
        'https://www.youtube.com/embed/MNO12345678',
        0
    ),

    -- 42: Troublemekka
    (
        'Troublemekka',
        'Australia',
        'New South Wales',
        2015,
        'Troublemekka is a Sydney-based reggae, dancehall, and hip-hop artist known for blending smooth melodies with socially conscious lyrics. He has been an influential figure in Australia’s reggae and dancehall scene since 2015.',
        'https://open.spotify.com/embed/artist/5RQmJeRfD3Wly8fGBO1kK9',
        'https://www.youtube.com/embed/PQR12345678',
        0
    ),

    -- 43: Itations
    (
        'Itations',
        'Australia',
        'Victoria',
        2018,
        'Itations is a Melbourne-based roots reggae band, blending traditional reggae rhythms with contemporary influences. Since their formation in 2018, they have gained a reputation for their deep grooves and positive message.',
        'https://open.spotify.com/embed/artist/3Xyq9GkHUT6vFqZLWp9I1B',
        'https://www.youtube.com/embed/STU12345678',
        0
    ),

    -- 44: DAILY J
    (
        'DAILY J',
        'Australia',
        'South Australia',
        2016,
        'DAILY J is an indie rock band from Adelaide, blending dreamy pop melodies with smooth guitar work. Their laid-back yet infectious sound has garnered a strong following in the Australian indie scene.',
        'https://open.spotify.com/embed/artist/5xWvNeYf2s02J2LhBMTjyx',
        'https://www.youtube.com/embed/XYZ12345678',
        0
    ),

    -- 45: Faceless Burial
    (
        'Faceless Burial',
        'Australia',
        'Victoria',
        2014,
        'Faceless Burial is a death metal band from Melbourne known for their murky, old-school death metal sound with intricate compositions. Their relentless riffing and cavernous vocals have earned them a strong reputation in the underground metal scene.',
        'https://open.spotify.com/embed/artist/1W7e6McdNRquXxOAwXjPjN',
        'https://www.youtube.com/embed/ABC12345678',
        0
    ),

    -- 46: Gutless
    (
        'Gutless',
        'Australia',
        'Victoria',
        2018,
        'Gutless is a Melbourne-based death metal band delivering raw, uncompromising old-school brutality. Their guttural vocals and relentless riffing have made them a rising force in Australia’s extreme metal scene.',
        'https://open.spotify.com/embed/artist/6AvwEUpJXZSk1g5NIVDRWl',
        'https://www.youtube.com/embed/DEF12345678',
        0
    ),

    -- 47: Pestilential Shadows
    (
        'Pestilential Shadows',
        'Australia',
        'New South Wales',
        2003,
        'Pestilential Shadows is a black metal band from New South Wales, known for their dark, atmospheric sound and deeply occult themes. They have been a significant part of Australia’s black metal scene since the early 2000s.',
        'https://open.spotify.com/embed/artist/4uGCTOw2EqIWdQwvJKYdLg',
        'https://www.youtube.com/embed/GHI12345678',
        0
    ),

    -- 48: Werewolves
    (
        'Werewolves',
        'Australia',
        'Victoria',
        2019,
        'Werewolves is a brutal death metal band from Melbourne, known for their unrelenting speed, savage riffs, and darkly humorous lyrics. Their aggressive sound has made them a standout act in modern extreme metal.',
        'https://open.spotify.com/embed/artist/3m6yfMQtxcMXGR7TZGdrrc',
        'https://www.youtube.com/embed/JKL12345678',
        0
    ),

    -- 49: Pizza Death
    (
        'Pizza Death',
        'Australia',
        'Victoria',
        2020,
        'Pizza Death is a Melbourne-based crossover thrash band with a tongue-in-cheek attitude and fast, energetic riffs. Their blend of thrash, grind, and humor has made them a cult favorite in the local metal scene.',
        'https://open.spotify.com/embed/artist/7rLbXUL56CqKpX9FxM2HXF',
        'https://www.youtube.com/embed/MNO12345678',
        0
    ),

    -- 50: Munitions
    (
        'Munitions',
        'Australia',
        'Victoria',
        2015,
        'Munitions is a Melbourne-based death metal band delivering crushing riffs and relentless blast beats. Their uncompromising sound and intense live shows have earned them recognition in Australia’s underground metal scene.',
        'https://open.spotify.com/embed/artist/6YyRqDQLRoGJjfUWrkZMTG',
        'https://www.youtube.com/embed/PQR12345678',
        0
    ),

    -- 51: Vexation
    (
        'Vexation',
        'Australia',
        'Victoria',
        2021,
        'Vexation is a rising blackened thrash metal band from Melbourne, known for their aggressive riffing and raw intensity. Despite being a newer act, they have quickly gained a reputation for their ferocious live performances.',
        'https://open.spotify.com/embed/artist/3zXWkIqL7XbF1tB9J8QFvM',
        'https://www.youtube.com/embed/STU12345678',
        0
    ),

    -- 52: Midnight Odyssey
    (
        'Midnight Odyssey',
        'Australia',
        'Queensland',
        2007,
        'Midnight Odyssey is an atmospheric black metal and ambient project from Queensland, blending cosmic themes with haunting melodies and vast soundscapes. Their ethereal compositions have made them a unique force in the global black metal scene.',
        'https://open.spotify.com/embed/artist/2P2Kv8loEKMszjXBe8Ptkk',
        'https://www.youtube.com/embed/VWX12345678',
        0
    ),

    -- 53: Goat Shaman
    (
        'Goat Shaman',
        'Australia',
        'Victoria',
        2019,
        'Goat Shaman is a Melbourne-based doom metal band known for their slow, crushing riffs and occult-inspired atmosphere. Their heavy, hypnotic sound has drawn comparisons to classic doom and stoner metal acts.',
        'https://open.spotify.com/embed/artist/4XZ7YZ4vPg8q9HRT9JxNvk',
        'https://www.youtube.com/embed/YZX12345678',
        0
    ),

    -- 54: Redferrin
    (
        'Redferrin',
        'United States',
        'Tennessee',
        2020,
        'Redferrin is a Nashville-based country and hip-hop fusion artist known for blending modern rap beats with traditional country storytelling. His energetic performances and catchy hooks have earned him a growing fanbase in the country-rap scene.',
        'https://open.spotify.com/embed/artist/5XhZfhVo16CJoNUo3my07d',
        'https://www.youtube.com/embed/ABC12345678',
        0
    ),

    -- 55: CERES
    (
        'CERES',
        'Australia',
        'Victoria',
        2012,
        'CERES is an indie rock band from Melbourne known for their emotionally charged lyrics and anthemic melodies. Their heartfelt songwriting and dynamic live performances have made them a staple in the Australian indie scene.',
        'https://open.spotify.com/embed/artist/0XzH18wCRob8AcFGWKLJFK',
        'https://www.youtube.com/embed/DEF12345678',
        0
    ),

    -- 56: Great Gable
    (
        'Great Gable',
        'Australia',
        'Western Australia',
        2015,
        'Great Gable is an indie rock band from Perth known for their smooth guitar tones, dreamy vocals, and laid-back grooves. Their sun-soaked melodies have resonated with audiences across Australia and beyond.',
        'https://open.spotify.com/embed/artist/6Zgrksos0zXctbDQWSzUcP',
        'https://www.youtube.com/embed/GHI12345678',
        0
    ),

    -- 57: Amble
    (
        'Amble',
        'Australia',
        'Victoria',
        2019,
        'Amble is a Melbourne-based indie folk band known for their intricate harmonies and poetic lyricism. Their intimate and heartfelt sound has drawn comparisons to artists like Bon Iver and Angus & Julia Stone.',
        'https://open.spotify.com/embed/artist/7fHJK8ZPQb6s9XyqX9XY8L',
        'https://www.youtube.com/embed/JKL12345678',
        0
    ),

    -- 58: Barry Adamson
    (
        'Barry Adamson',
        'United Kingdom',
        'England',
        1988,
        'Barry Adamson is a British musician and composer known for his cinematic blend of jazz, rock, and electronic music. A former member of Magazine and Nick Cave & The Bad Seeds, his solo work spans noir-inspired soundscapes and darkly poetic songwriting.',
        'https://open.spotify.com/embed/artist/5GNsUHrklm3kq8Wt6aUO2X',
        'https://www.youtube.com/embed/MNO12345678',
        0
    ),

    -- 59: The Wreckery
    (
        'The Wreckery',
        'Australia',
        'Victoria',
        1985,
        'The Wreckery is an Australian post-punk and blues-rock band formed in Melbourne, known for their dark, brooding sound and intense live performances. Fronted by Hugo Race, their music blends gothic atmosphere with raw, bluesy energy.',
        'https://open.spotify.com/embed/artist/4b7YrHPLz5gXUwQg3K8A8T',
        'https://www.youtube.com/embed/PQR12345678',
        0
    ),

    -- 60: The Beths
    (
        'The Beths',
        'New Zealand',
        'Auckland',
        2014,
        'The Beths are an indie rock band from Auckland known for their infectious melodies, energetic guitar work, and witty, emotionally resonant lyrics. Their upbeat sound and tight harmonies have earned them international acclaim.',
        'https://open.spotify.com/embed/artist/2LJXRz2sG3H9z1v3pxfgmP',
        'https://www.youtube.com/embed/STU12345678',
        0
    ),

    -- 61: Plastic Section
    (
        'Plastic Section',
        'Australia',
        'Victoria',
        2010,
        'Plastic Section is a Melbourne-based garage rock and rockabilly band known for their raw, high-energy sound. Influenced by 50s and 60s rock and roll, they bring a retro yet fresh approach to their music.',
        'https://open.spotify.com/embed/artist/4k3hJLPcN7hX5RzP2K8Y8X',
        'https://www.youtube.com/embed/ABC12345678',
        0
    ),

    -- 62: The Earthquakes
    (
        'The Earthquakes',
        'Australia',
        'Victoria',
        2015,
        'The Earthquakes are a Melbourne-based punk rock band delivering fast, aggressive riffs and politically charged lyrics. Their high-energy performances have gained them a strong underground following.',
        'https://open.spotify.com/embed/artist/5mNXYaZPQ9gXUwTq8R8A7K',
        'https://www.youtube.com/embed/DEF12345678',
        0
    ),

    -- 63: Fever Shack
    (
        'Fever Shack',
        'Australia',
        'Victoria',
        2018,
        'Fever Shack is a Melbourne punk and garage rock band known for their rowdy live shows and distorted, lo-fi sound. They channel raw energy into their performances, reminiscent of classic 70s punk.',
        'https://open.spotify.com/embed/artist/7HLPQb6s9XYXJK8ZPY8L5G',
        'https://www.youtube.com/embed/GHI12345678',
        0
    ),

    -- 64: No Way Out
    (
        'No Way Out',
        'Australia',
        'New South Wales',
        2017,
        'No Way Out is a hardcore punk band from Sydney, delivering aggressive breakdowns and raw vocals. Their music tackles themes of resistance and personal struggle, making them a staple in the Australian hardcore scene.',
        'https://open.spotify.com/embed/artist/2LJXRz2sG3H9z1v3pxfgmP',
        'https://www.youtube.com/embed/JKL12345678',
        0
    ),

    -- 65: Heat
    (
        'Heat',
        'Australia',
        'Victoria',
        2019,
        'Heat is a Melbourne-based rock band blending elements of post-punk and alternative rock. Their moody, atmospheric sound is driven by reverb-heavy guitars and introspective lyrics.',
        'https://open.spotify.com/embed/artist/4b7YrHPLz5gXUwQg3K8A8T',
        'https://www.youtube.com/embed/MNO12345678',
        0
    ),

    -- 66: Judged By 12
    (
        'Judged By 12',
        'Australia',
        'Victoria',
        2021,
        'Judged By 12 is a Melbourne-based hardcore punk band known for their aggressive sound and socially charged lyrics. Their fast-paced riffs and intense live performances have made them a rising name in the local scene.',
        'https://open.spotify.com/embed/artist/5GNsUHrklm3kq8Wt6aUO2X',
        'https://www.youtube.com/embed/PQR12345678',
        0
    ),

    -- 67: Timepeace
    (
        'Timepeace',
        'Australia',
        'Victoria',
        2020,
        'Timepeace is a psychedelic rock band from Melbourne, blending dreamy guitar tones with a retro 60s and 70s-inspired aesthetic. Their music creates a hypnotic, immersive listening experience.',
        'https://open.spotify.com/embed/artist/6Zgrksos0zXctbDQWSzUcP',
        'https://www.youtube.com/embed/STU12345678',
        0
    ),

    -- 68: Wet Kiss
    (
        'Wet Kiss',
        'Australia',
        'Victoria',
        2016,
        'Wet Kiss is an Australian garage rock band known for their stripped-back sound and catchy hooks. Their blend of lo-fi production and energetic live performances has earned them a growing fanbase in the indie rock scene.',
        'https://open.spotify.com/embed/artist/2aWl7Kss7B1OqTcHj3lEhv',
        'https://www.youtube.com/embed/ABC12345678',
        0
    ),

    -- 69: The 5.6.7.8\'s
    (
        'The 5.6.7.8\'s',
        'Japan',
        'Tokyo',
        1986,
        'The 5.6.7.8\'s are a Japanese rockabilly and surf rock band that formed in the late 1980s. Their energetic performances and mix of 50s rockabilly, surf, and punk rock elements have made them iconic in the underground music scene.',
        'https://open.spotify.com/embed/artist/7JvXaIfhUlXgOCrfBf4s61',
        'https://www.youtube.com/embed/DEF12345678',
        0
    ),

    -- 70: Clay J Gladstone
    (
        'Clay J Gladstone',
        'Australia',
        'Victoria',
        2018,
        'Clay J Gladstone is a Melbourne-based singer-songwriter blending alt-country, folk, and rock. His soulful voice and poetic lyrics have made him a standout in the Australian indie and Americana scenes.',
        'https://open.spotify.com/embed/artist/6Bb4a9BQ0EXe7S2xD5IuR0',
        'https://www.youtube.com/embed/GHI12345678',
        0
    ),

    -- 71: Delivery
    (
        'Delivery',
        'Australia',
        'Victoria',
        2017,
        'Delivery is a Melbourne-based rock band combining elements of punk, garage rock, and power pop. Their sound is marked by punchy guitar riffs and catchy melodies that resonate with fans of high-energy rock music.',
        'https://open.spotify.com/embed/artist/0ZknJlcRPvduKxS1tmJ5RJ',
        'https://www.youtube.com/embed/JKL12345678',
        0
    ),

    -- 72: DEIPHAGO
    (
        'DEIPHAGO',
        'Philippines',
        'Cebu City',
        2003,
        'DEIPHAGO is a Filipino blackened death metal band known for their ferocious and blasphemous sound. Their aggressive, high-speed playing and dark, nihilistic themes have made them a respected name in extreme metal worldwide.',
        'https://open.spotify.com/embed/artist/4sbxP0pe1STmhdAvnmpDQf',
        'https://www.youtube.com/embed/MNO12345678',
        0
    ),

    -- 73: Void Christ
    (
        'Void Christ',
        'Australia',
        'New South Wales',
        2014,
        'Void Christ is an Australian black metal band that combines atmospheric and melodic elements with raw, aggressive black metal. Their introspective lyrics and atmospheric soundscapes have earned them praise in the underground metal community.',
        'https://open.spotify.com/embed/artist/5vSKlsqHD2OKdUzQgMbI1T',
        'https://www.youtube.com/embed/PQR12345678',
        0
    ),

    -- 74: Gutalax
    (
        'Gutalax',
        'Czech Republic',
        'Prague',
        2007,
        'Gutalax is a Czech goregrind band known for their graphic, grotesque lyrics and fast, crushing sound. Their music blends grindcore with elements of death metal and is characterized by blast beats and heavy distortion.',
        'https://open.spotify.com/embed/artist/3KgtnHlHt7s7zFjInshGhT',
        'https://www.youtube.com/embed/STU12345678',
        0
    ),

    -- 75: Lachlan Denton
    (
        'Lachlan Denton',
        'Australia',
        'Victoria',
        2010,
        'Lachlan Denton is an Australian indie-folk singer-songwriter known for his heartfelt lyrics and melodic guitar work. His solo work and collaborations have established him as a key figure in Melbourne’s indie music scene.',
        'https://open.spotify.com/embed/artist/3R4yDZT9vEfmFv8h7Gqz3H',
        'https://www.youtube.com/embed/ABC98765432',
        0
    ),

    -- 76: Brian El Dorado and The Tuesday People
    (
        'Brian El Dorado and The Tuesday People',
        'Australia',
        'Victoria',
        2015,
        'Brian El Dorado and The Tuesday People are a Melbourne-based band blending funk, soul, and rock influences. Their high-energy performances and groove-laden sound have made them a favorite in the local live music circuit.',
        'https://open.spotify.com/embed/artist/5Klv8LxXpD7TtrP2qLMFJH',
        'https://www.youtube.com/embed/DEF98765432',
        0
    ),

    -- 77: Zevon Lee
    (
        'Zevon Lee',
        'Australia',
        'Victoria',
        2018,
        'Zevon Lee is an Australian indie-rock musician drawing inspiration from blues, folk, and classic rock. His soulful voice and evocative songwriting set him apart in the local alternative music scene.',
        'https://open.spotify.com/embed/artist/4TpyKWhHt6Ys4dU8Gm9C3J',
        'https://www.youtube.com/embed/GHI98765432',
        0
    ),

    -- 78: Nitida Atkinson
    (
        'Nitida Atkinson',
        'Australia',
        'Victoria',
        2020,
        'Nitida Atkinson is an emerging singer-songwriter known for her fusion of folk, jazz, and contemporary influences. Her soulful vocals and introspective lyrics have captivated audiences in Melbourne’s indie music community.',
        'https://open.spotify.com/embed/artist/2Xys6pQY8E4VmKD6RqFz7J',
        'https://www.youtube.com/embed/JKL98765432',
        0
    ),

    -- 79: Austin Mackay
    (
        'Austin Mackay',
        'Australia',
        'New South Wales',
        2019,
        'Austin Mackay is an Australian folk-pop artist whose acoustic-driven sound and heartfelt lyrics have earned him a dedicated following. His music blends storytelling with catchy melodies, making him a rising star in the Australian indie scene.',
        'https://open.spotify.com/embed/artist/6PzN2D5WcHYX3JzF7KZ4NQ',
        'https://www.youtube.com/embed/MNO98765432',
        0
    ),

    -- 80: Quality Used Cars
    (
        'Quality Used Cars',
        'Australia',
        'Victoria',
        2016,
        'Quality Used Cars is a Melbourne-based indie rock band known for their jangly guitar tones and witty, observational lyrics. Their sound is a nostalgic mix of folk, garage rock, and alternative pop.',
        'https://open.spotify.com/embed/artist/7YtrQG3FtC5wVcN8pTZ9WQ',
        'https://www.youtube.com/embed/PQR98765432',
        0
    ),

    -- 81: LARGE MIRAGE
    (
        'LARGE MIRAGE',
        'Australia',
        'Victoria',
        2019,
        'LARGE MIRAGE is an indie-psych rock band from Melbourne, blending dreamy soundscapes with groovy rhythms. Their hypnotic live performances and layered instrumentation have garnered them a loyal following in the underground scene.',
        'https://open.spotify.com/embed/artist/6A8FJX5KzgMT9QvJ7K3LZN',
        'https://www.youtube.com/embed/LMN98765432',
        0
    ),

    -- 82: HOLiDAY MYSTICS
    (
        'HOLiDAY MYSTICS',
        'Australia',
        'Victoria',
        2021,
        'HOLiDAY MYSTICS is a synth-pop and indie-electronic duo from Melbourne, known for their nostalgic 80s-inspired sound and infectious melodies. Their music fuses dreamy vocals with lush synthesizers, creating an immersive sonic experience.',
        'https://open.spotify.com/embed/artist/5XzFvP3WZV8DqYTK9LJQWQ',
        'https://www.youtube.com/embed/OPQ98765432',
        0
    ),

    -- 83: Ramona Sky
    (
        'Ramona Sky',
        'Australia',
        'Victoria',
        2017,
        'Ramona Sky is a high-energy funk-rock band from Melbourne, blending bluesy guitar riffs with soulful vocals. Their dynamic performances and infectious grooves make them a standout act in the local live music scene.',
        'https://open.spotify.com/embed/artist/4T8RyJXH9P5VZL3M8YJQ2D',
        'https://www.youtube.com/embed/RST98765432',
        0
    ),

    -- 84: Gwyn Ashton
    (
        'Gwyn Ashton',
        'Australia',
        'South Australia',
        1991,
        'Gwyn Ashton is a blues-rock guitarist and singer-songwriter, renowned for his fiery slide guitar and raw, emotive performances. With a career spanning decades, he has shared stages with legends like BB King and played festivals worldwide.',
        'https://open.spotify.com/embed/artist/2L9FJQX6ZG7TMR2Q8LKPZT',
        'https://www.youtube.com/embed/UVW98765432',
        0
    ),

    -- 85: Gavin Bowles & The Distractions
    (
        'Gavin Bowles & The Distractions',
        'Australia',
        'New South Wales',
        2018,
        'Gavin Bowles & The Distractions are a power-pop and alt-rock band, known for their sharp songwriting and anthemic choruses. Their music blends classic rock influences with a modern edge, making them a staple in Australia’s indie rock scene.',
        'https://open.spotify.com/embed/artist/7X5ZJQP9TY7DMRL8NQJKPT',
        'https://www.youtube.com/embed/XYZ98765432',
        0
    ),

    -- 86: Terra Rouge
    (
        'Terra Rouge',
        'Australia',
        'Victoria',
        2020,
        'Terra Rouge is a Melbourne-based alternative rock band with a brooding, atmospheric sound. Their music incorporates elements of post-rock and shoegaze, creating rich textures and emotional depth in their songwriting.',
        'https://open.spotify.com/embed/artist/8X9ZKQ3JL7DMNP8YTKQZWP',
        'https://www.youtube.com/embed/ABC87654321',
        0
    ),

    -- 87: Incident Response Select All
    (
        'Incident Response Select All',
        'Australia',
        'Victoria',
        2022,
        'Incident Response Select All is a Melbourne-based experimental rock band blending elements of post-punk, noise rock, and electronic music. Their dynamic live performances and unconventional soundscapes have earned them a dedicated underground following.',
        'https://open.spotify.com/embed/artist/6X8ZJQ5KZG7TMR9Q8LKPZT',
        'https://www.youtube.com/embed/XYZ12345678',
        0
    ),

    -- 88: B-sides
    (
        'B-sides',
        'Australia',
        'New South Wales',
        2019,
        'B-sides is an indie rock band from Sydney, known for their jangly guitar riffs, catchy hooks, and introspective lyrics. They draw influence from 90s alternative rock and modern indie-pop, creating a nostalgic yet fresh sound.',
        'https://open.spotify.com/embed/artist/5X7FJQ3WZV8DMPYTK9LKPZT',
        'https://www.youtube.com/embed/LMN98765432',
        0
    ),

    -- 89: FELONY.
    (
        'FELONY.',
        'Australia',
        'Victoria',
        2021,
        'FELONY. is a high-energy punk rock band from Melbourne, delivering aggressive riffs, politically charged lyrics, and an unapologetic attitude. Their DIY ethos and raw sound have made them a staple in the local punk scene.',
        'https://open.spotify.com/embed/artist/4T9RyJXH9P5VZL3M8YJQ2D',
        'https://www.youtube.com/embed/RST98765432',
        0
    ),

    -- 90: Grassy Strings
    (
        'Grassy Strings',
        'Australia',
        'Queensland',
        2018,
        'Grassy Strings is an indie-folk band from Brisbane, known for their rich vocal harmonies and acoustic-driven melodies. Their heartfelt songwriting and warm instrumentation create a soothing yet captivating listening experience.',
        'https://open.spotify.com/embed/artist/2L9FJQX6ZG7TMR2Q8LKPZT',
        'https://www.youtube.com/embed/UVW98765432',
        0
    ),

    -- 91: The Pheasantry Band
    (
        'The Pheasantry Band',
        'Australia',
        'Victoria',
        2020,
        'The Pheasantry Band is a blues-rock and country-infused group from Melbourne, known for their storytelling lyrics and groovy, roots-inspired instrumentation. Their energetic performances have gained them a growing audience in the Australian live music scene.',
        'https://open.spotify.com/embed/artist/8X9ZKQ3JL7DMNP8YTKQZWP',
        'https://www.youtube.com/embed/ABC87654321',
        0
    ),

    -- 92: Ashley Naylor
    (
        'Ashley Naylor',
        'Australia',
        'Victoria',
        1995,
        'Ashley Naylor is a Melbourne-based singer-songwriter and guitarist, best known as the frontman of the alternative rock band Even. With a career spanning decades, he is renowned for his melodic songwriting, intricate guitar work, and contributions to numerous Australian rock acts.',
        'https://open.spotify.com/embed/artist/1X3ZKQ8JL7DMNP9YTKQZWP',
        'https://www.youtube.com/embed/DEF87654321',
        0
    ),

    -- 93: Kathleen Halloran
    (
        'Kathleen Halloran',
        'Australia',
        'Victoria',
        2017,
        'Kathleen Halloran is a Melbourne-based guitarist and singer-songwriter blending jazz, folk, and contemporary pop influences. Her virtuosic guitar skills and emotive vocals have made her a sought-after musician in the Australian music scene.',
        'https://open.spotify.com/embed/artist/3X8ZKQ6JL7DMNP2YTKQZWP',
        'https://www.youtube.com/embed/GHI98765432',
        0
    ),

    -- 94: VOXNEON
    (
        'VOXNEON',
        'Australia',
        'New South Wales',
        2015,
        'VOXNEON is a Sydney-based synthwave and new-wave band known for their nostalgic 80s-inspired sound, combining pulsating synthesizers, driving basslines, and atmospheric melodies. Their music pays homage to classic synth-pop while adding a modern twist.',
        'https://open.spotify.com/embed/artist/2L7FJQX6ZG7TMR4Q8LKPZT',
        'https://www.youtube.com/embed/JKL98765432',
        0
    ),

    -- 95: Felipe Baldomir
    (
        'Felipe Baldomir',
        'Uruguay',
        'Montevideo',
        2018,
        'Felipe Baldomir is a singer-songwriter from Uruguay, blending indie-folk and surf rock influences. His soulful voice and heartfelt lyrics have earned him a growing international audience, particularly in Australia, where he frequently tours.',
        'https://open.spotify.com/embed/artist/6X9ZKQ3JL7DMNP8YTKQZWP',
        'https://www.youtube.com/embed/MNO98765432',
        0
    ),

    -- 96: SPEED
    (
        'SPEED',
        'Australia',
        'New South Wales',
        2019,
        'SPEED is a Sydney-based hardcore punk band known for their raw intensity, socially conscious lyrics, and explosive live performances. They have quickly gained a reputation as one of Australia’s most exciting modern hardcore acts.',
        'https://open.spotify.com/embed/artist/4T9RyJXH9P5VZL3M8YJQ2D',
        'https://www.youtube.com/embed/PQR98765432',
        0
    ),

    -- 97: 19-Twenty
    (
        '19-Twenty',
        'Australia',
        'New South Wales',
        2011,
        '19-Twenty is a high-energy blues and roots band from New South Wales, delivering a fusion of foot-stomping rhythms, electrifying guitar work, and raw, passionate vocals. Their infectious live performances have made them festival favorites across Australia.',
        'https://open.spotify.com/embed/artist/7X8ZKQ3JL7DMNP1YTKQZWP',
        'https://www.youtube.com/embed/STU98765432',
        0
    ),

    -- 98: Gavin James
    (
        'Gavin James',
        'Ireland',
        'Dublin',
        2013,
        'Gavin James is an Irish singer-songwriter known for his emotive vocals and heartfelt ballads. Drawing influence from folk, pop, and soul, his music has resonated globally, earning him widespread acclaim and a dedicated fanbase.',
        'https://open.spotify.com/embed/artist/9X9ZKQ3JL7DMNP5YTKQZWP',
        'https://www.youtube.com/embed/UVW98765432',
        0
    ),

    -- 99: Pete McCredie
    (
        'Pete McCredie',
        'Australia',
        'New South Wales',
        2010,
        'Pete McCredie is an Australian singer-songwriter and multi-instrumentalist known for his blend of folk, country, and rock influences. His introspective lyrics and dynamic performances have made him a respected figure in the local music scene.',
        'https://open.spotify.com/embed/artist/1A2B3C4D5E6F7G8H9I0J',
        'https://www.youtube.com/embed/ABC12345678',
        0
    ),

    -- 100: No Sleep Till Texas
    (
        'No Sleep Till Texas',
        'Australia',
        'Queensland',
        2015,
        'No Sleep Till Texas is a country-rock band hailing from Queensland, blending southern rock energy with classic country storytelling. Their infectious hooks and high-energy performances have earned them a loyal following across Australia.',
        'https://open.spotify.com/embed/artist/2B3C4D5E6F7G8H9I0J1A',
        'https://www.youtube.com/embed/DEF23456789',
        0
    ),

    -- 101: Firefly Horns
    (
        'Firefly Horns',
        'Australia',
        'Victoria',
        2018,
        'Firefly Horns is a brass ensemble known for their fusion of jazz, funk, and world music. Based in Melbourne, they bring a vibrant and energetic sound to live performances, making them a favorite at festivals and local venues.',
        'https://open.spotify.com/embed/artist/3C4D5E6F7G8H9I0J1A2B',
        'https://www.youtube.com/embed/GHI34567890',
        0
    ),

    -- 102: David McCredie
    (
        'David McCredie',
        'Australia',
        'New South Wales',
        2012,
        'David McCredie is an Australian folk and blues musician known for his soulful voice and intricate guitar work. His music blends traditional storytelling with modern acoustic influences, making him a staple in the local singer-songwriter scene.',
        'https://open.spotify.com/embed/artist/4D5E6F7G8H9I0J1A2B3C',
        'https://www.youtube.com/embed/JKL45678901',
        0
    ),

    -- 103: Elly McK & The Unbelievers
    (
        'Elly McK & The Unbelievers',
        'Australia',
        'Victoria',
        2016,
        'Elly McK & The Unbelievers is a Melbourne-based indie-folk band led by singer-songwriter Elly McK. Their music features heartfelt lyrics, rich harmonies, and a fusion of folk and alternative rock influences, earning them critical acclaim and a growing fanbase.',
        'https://open.spotify.com/embed/artist/5E6F7G8H9I0J1A2B3C4D',
        'https://www.youtube.com/embed/MNO56789012',
        0
    ),

    -- 104: M. WARD
    (
        'M. WARD',
        'United States',
        'Oregon',
        1999,
        'M. WARD is an American singer-songwriter and guitarist known for his blend of folk, blues, and indie rock. His intricate fingerpicking style and warm, vintage production have made him a standout figure in modern folk music. He has released multiple critically acclaimed albums, including "Transfiguration of Vincent" and "Post-War."',
        'https://open.spotify.com/embed/artist/3SAnKjRk84xUJK8jX4Zq1i',
        'https://www.youtube.com/embed/XYZ12345678',
        0
    ),

    -- 105: Fleetmac Wood
    (
        'Fleetmac Wood',
        'United Kingdom',
        'London',
        2012,
        'Fleetmac Wood is a DJ collective and remix project dedicated to reimagining the music of Fleetwood Mac through electronic and dance remixes. Their unique club nights celebrate the legendary band with exclusive edits and deep cuts, creating an immersive, dancefloor-driven experience.',
        'https://open.spotify.com/embed/artist/4B5D6E7F8G9H0I1J2A3B',
        'https://www.youtube.com/embed/ABC23456789',
        0
    ),

    -- 106: Sun Ra Arkestra
    (
        'Sun Ra Arkestra',
        'United States',
        'Pennsylvania',
        1952,
        'Sun Ra Arkestra is an avant-garde jazz ensemble founded by the legendary Sun Ra. Known for their cosmic philosophy, experimental compositions, and elaborate performances, the Arkestra continues to push the boundaries of jazz under the direction of longtime saxophonist Marshall Allen.',
        'https://open.spotify.com/embed/artist/5C6D7E8F9G0H1I2J3A4B',
        'https://www.youtube.com/embed/DEF34567890',
        0
    ),

    -- 107: Chillinit
    (
        'Chillinit',
        'Australia',
        'New South Wales',
        2018,
        'Chillinit is an Australian rapper and hip-hop artist known for his rapid-fire delivery, clever wordplay, and cannabis-fueled lyricism. As a key figure in Australias underground rap scene, he has gained a massive following with tracks like "Wish You Well Pt. 2" and "420 Queen."',
        'https://open.spotify.com/embed/artist/6D7E8F9G0H1I2J3A4B5C',
        'https://www.youtube.com/embed/GHI45678901',
        0
    ),

    -- 108: Robben Ford Band
    (
        'Robben Ford Band',
        'United States',
        'California',
        1970,
        'Robben Ford is a Grammy-nominated blues, jazz, and rock guitarist known for his soulful playing and collaborations with artists like Joni Mitchell, Miles Davis, and George Harrison. His band delivers masterful performances that blend technical prowess with deep blues roots.',
        'https://open.spotify.com/embed/artist/7E8F9G0H1I2J3A4B5C6D',
        'https://www.youtube.com/embed/JKL56789012',
        0
    ),

    -- 109: Darren Kiely
    (
        'Darren Kiely',
        'Ireland',
        'Cork',
        2021,
        'Darren Kiely is an emerging Irish folk artist whose heartfelt storytelling and rich, melodic vocals have drawn comparisons to traditional Irish singer-songwriters. His music blends folk, pop, and contemporary influences, creating an emotional and authentic listening experience.',
        'https://open.spotify.com/embed/artist/8F9G0H1I2J3A4B5C6D7E',
        'https://www.youtube.com/embed/MNO67890123',
        0
    ),

    -- 110: Kofi Stone
    (
        'Kofi Stone',
        'United Kingdom',
        'Birmingham',
        2018,
        'Kofi Stone is a UK hip-hop artist known for his poetic lyricism, jazz-infused beats, and introspective storytelling. His music blends conscious rap with soulful instrumentation, making him one of the most promising voices in the UK hip-hop scene.',
        'https://open.spotify.com/embed/artist/9G0H1I2J3A4B5C6D7E8F',
        'https://www.youtube.com/embed/PQR78901234',
        0
    );

-- Artist Socials (Most links are crap, but fine for beta)
INSERT INTO ArtistSocials (ArtistID, Platform, Handle, URL) VALUES
    (1, 'Website', 'The Amazing Devil', 'https://www.theamazingdevil.com'),
    (1, 'Facebook', 'TheAmazingDevil', 'https://www.facebook.com/TheAmazingDevil'),
    (1, 'Instagram', 'theamazingdevil', 'https://www.instagram.com/theamazingdevil'),
    (1, 'YouTube', 'The Amazing Devil', 'https://www.youtube.com/channel/UC0oh21xk2KZURgNswcyzJNg'),

    (2, 'Instagram', 'amberdriftband', 'https://www.instagram.com/amberdriftband'),
    (2, 'Facebook', 'AmberDrift', 'https://www.facebook.com/AmberDrift'),

    (3, 'Website', 'Gang of Youths', 'https://www.gangofyouths.com'),
    (3, 'Facebook', 'GangOfYouths', 'https://www.facebook.com/GangOfYouths'),
    (3, 'Twitter', 'GangOfYouths', 'https://twitter.com/GangOfYouths'),
    (3, 'Instagram', 'gangofyouths', 'https://www.instagram.com/gangofyouths'),

    (4, 'Website', 'Tash Sultana', 'https://www.tashsultana.com'),
    (4, 'Facebook', 'TashSultanaOfficial', 'https://www.facebook.com/TashSultanaOfficial'),
    (4, 'Twitter', 'tashsultana', 'https://twitter.com/tashsultana'),
    (4, 'Instagram', 'tashsultanaofficial', 'https://www.instagram.com/tashsultanaofficial'),

    (5, 'Website', 'Courtney Barnett', 'https://www.courtneybarnett.com.au'),
    (5, 'Facebook', 'courtneybarnettmusic', 'https://www.facebook.com/courtneybarnettmusic'),
    (5, 'Twitter', 'courtneymelba', 'https://twitter.com/courtneymelba'),
    (5, 'Instagram', 'courtneymelba', 'https://www.instagram.com/courtneymelba'),

    (6, 'Website', 'King Gizzard & the Lizard Wizard', 'https://www.kinggizzardandthelizardwizard.com'),
    (6, 'Facebook', 'kinggizzardandthelizardwizard', 'https://www.facebook.com/kinggizzardandthelizardwizard'),
    (6, 'Instagram', 'kinggizzard', 'https://www.instagram.com/kinggizzard'),

    (7, 'Website', 'The Teskey Brothers', 'https://www.theteskeybrothers.com'),
    (7, 'Facebook', 'TheTeskeyBrothers', 'https://www.facebook.com/TheTeskeyBrothers'),
    (7, 'Instagram', 'theteskeybrothers', 'https://www.instagram.com/theteskeybrothers'),

    (8, 'Website', 'Vance Joy', 'https://www.vancejoy.com'),
    (8, 'Facebook', 'VanceJoy', 'https://www.facebook.com/VanceJoy'),
    (8, 'Twitter', 'vancejoy', 'https://twitter.com/vancejoy'),
    (8, 'Instagram', 'vancejoy', 'https://www.instagram.com/vancejoy'),

    (9, 'Website', 'Tame Impala', 'https://www.tameimpala.com'),
    (9, 'Facebook', 'tameimpala', 'https://www.facebook.com/tameimpala'),
    (9, 'Twitter', 'tameimpala', 'https://twitter.com/tameimpala'),
    (9, 'Instagram', 'tameimpala', 'https://www.instagram.com/tameimpala'),

    (10, 'Website', 'The Cat Empire', 'https://www.thecatempire.com'),
    (10, 'Facebook', 'thecatempire', 'https://www.facebook.com/thecatempire'),
    (10, 'Instagram', 'thecatempire', 'https://www.instagram.com/thecatempire'),

    (11, 'Website', 'The Jungle Giants', 'https://www.thejunglegiants.com'),
    (11, 'Facebook', 'thejunglegiants', 'https://www.facebook.com/thejunglegiants'),
    (11, 'Twitter', 'TheJungleGiants', 'https://twitter.com/TheJungleGiants'),
    (11, 'Instagram', 'thejunglegiants', 'https://www.instagram.com/thejunglegiants'),

    (12, 'Website', 'Ball Park Music', 'https://www.ballparkmusic.com'),
    (12, 'Facebook', 'BallParkMusic', 'https://www.facebook.com/BallParkMusic'),
    (12, 'Twitter', 'ballparkmusic', 'https://twitter.com/ballparkmusic'),
    (12, 'Instagram', 'ballparkmusic', 'https://www.instagram.com/ballparkmusic');

-- Event
INSERT INTO Event (
    VenueID,
    StageID,
    Title,
    Description,
    Date,
    StartTime,
    EndTime,
    Featured,
    Verified,
    OriginalPostURL,
    TicketSaleURL
) VALUES
    (
        1,
        1,
        'Indie Rock Night',
        'An electrifying night featuring up-and-coming indie rock bands.',
        '2025-03-15',
        '19:00:00',
        '23:00:00',
        TRUE,
        TRUE,
        'https://example.com/event1',
        'https://tickets.example.com/event1'
    ),
    (
        2,
        3,
        'Acoustic Evening',
        'A cozy acoustic session featuring local artists.',
        '2025-03-20',
        '18:00:00',
        '21:30:00',
        FALSE,
        TRUE,
        'https://example.com/event2',
        'https://tickets.example.com/event2'
    ),
    (
        3,
        4,
        'Psychedelic Jam',
        'A mind-bending psychedelic rock event at The Tote.',
        '2025-03-25',
        '20:00:00',
        '01:00:00',
        TRUE,
        TRUE,
        'https://example.com/event3',
        'https://tickets.example.com/event3'
    ),
    (
        1,
        2,
        'Emerging Artists Showcase',
        'Discover the next big thing in music with performances by emerging artists.',
        '2025-03-10',
        '17:30:00',
        '22:00:00',
        TRUE,
        TRUE,
        'https://example.com/event4',
        'https://tickets.example.com/event4'
    ),
    (
        2,
        3,
        'Blues Revival',
        'A soulful evening celebrating the blues genre.',
        '2025-03-15',
        '19:00:00',
        '23:00:00',
        FALSE,
        TRUE,
        'https://example.com/event5',
        'https://tickets.example.com/event5'
    ),
    (
        3,
        5,
        'Underground Metal Fest',
        'A heavy metal extravaganza at The Tote.',
        '2025-03-20',
        '20:00:00',
        '02:00:00',
        TRUE,
        TRUE,
        'https://example.com/event6',
        'https://tickets.example.com/event6'
    ),
    (
        1,
        1,
        'Folk Fusion Night',
        'Experience a blend of traditional and modern folk music.',
        '2025-03-05',
        '18:30:00',
        '22:30:00',
        TRUE,
        TRUE,
        'https://example.com/event7',
        'https://tickets.example.com/event7'
    ),
    (
        2,
        3,
        'Jazz & Wine',
        'An evening of smooth jazz paired with fine wines.',
        '2025-03-10',
        '19:00:00',
        '23:30:00',
        FALSE,
        TRUE,
        'https://example.com/event8',
        'https://tickets.example.com/event8'
    ),
    (
        3,
        6,
        'Open Mic Night',
        'Showcase your talent or enjoy performances from local artists.',
        '2025-03-15',
        '17:00:00',
        '21:00:00',
        FALSE,
        TRUE,
        'https://example.com/event9',
        'https://tickets.example.com/event9'
    ),
    (
        1,
        2,
        'Electronic Beats',
        'A high-energy night featuring electronic dance music.',
        '2025-03-20',
        '20:00:00',
        '02:00:00',
        TRUE,
        TRUE,
        'https://example.com/event10',
        'https://tickets.example.com/event10'
    ),
    (
        2,
        3,
        'Reggae Rhythms',
        'Feel the vibes with a night of reggae music.',
        '2025-03-25',
        '18:00:00',
        '22:00:00',
        TRUE,
        TRUE,
        'https://example.com/event11',
        'https://tickets.example.com/event11'
    ),
    (
        3,
        4,
        'Alternative Rock Bash',
        'An alternative rock event featuring top bands.',
        '2025-03-01',
        '19:30:00',
        '23:30:00',
        TRUE,
        TRUE,
        'https://example.com/event12',
        'https://tickets.example.com/event12'
    ),
    (
        1,
        1,
        'Singer-Songwriter Showcase',
        'Intimate performances by talented singer-songwriters.',
        '2025-03-05',
        '18:00:00',
        '21:00:00',
        FALSE,
        TRUE,
        'https://example.com/event13',
        'https://tickets.example.com/event13'
    ),
    (
        2,
        3,
        'Hip-Hop Night',
        'Groove to the latest and greatest in hip-hop music.',
        '2025-03-10',
        '20:00:00',
        '00:00:00',
        TRUE,
        TRUE,
        'https://example.com/event14',
        'https://tickets.example.com/event14'
    ),
    (
        3,
        5,
        'Blues Rock Explosion',
        'A powerful night blending blues and rock genres.',
        '2025-03-15',
        '19:00:00',
        '23:00:00',
        TRUE,
        TRUE,
        'https://example.com/event15',
        'https://tickets.example.com/event15'
    ),
    (
        1,
        2,
        'Latin Fiesta',
        'Dance the night away with vibrant Latin rhythms.',
        '2025-03-20',
        '19:00:00',
        '23:00:00',
        TRUE,
        TRUE,
        'https://example.com/event16',
        'https://tickets.example.com/event16'
    ),
    (
        2,
        3,
        'Soulful Sundays',
        'Relax with soulful tunes every Sunday evening.',
        '2025-03-25',
        '17:00:00',
        '20:00:00',
        FALSE,
        TRUE,
        'https://example.com/event17',
        'https://tickets.example.com/event17'
    ),
    (
        3,
        6,
        'Karaoke Night',
        'Sing your heart out at our weekly karaoke event.',
        '2025-03-01',
        '18:00:00',
        '22:00:00',
        FALSE,
        TRUE,
        'https://example.com/event18',
        'https://tickets.example.com/event18'
    ),
    (
        1,
        1,
        'Rock Legends Tribute',
        'A tribute night honoring the legends of rock music.',
        '2025-03-05',
        '20:00:00',
        '00:00:00',
        TRUE,
        TRUE,
        'https://example.com/event19',
        'https://tickets.example.com/event19'
    ),
    (
        3,
        5,
        'Final Night Unverified',
        'The last event in our series with unverified status.',
        '2025-03-10',
        '20:00:00',
        '23:00:00',
        TRUE,
        FALSE,
        'https://example.com/event20',
        'https://tickets.example.com/event20'
    );


-- EventPrice
INSERT INTO EventPrice (EventID, TicketType, Price)
VALUES
    (1, 'General Admission', 25.00),
    (1, 'VIP', 50.00),
    (2, 'General Admission', 20.00),
    (2, 'Early Bird', 15.00),
    (3, 'General Admission', 30.00),
    (3, 'VIP', 70.00),
    (4, 'General Admission', 40.00),
    (4, 'VIP', 100.00),
    (5, 'General Admission', 10.00),
    (5, 'Early Bird', 5.00),
    (6, 'General Admission', 35.00),
    (7, 'General Admission', 25.00),
    (7, 'VIP', 60.00),
    (8, 'General Admission', 20.00),
    (8, 'VIP', 45.00),
    (9, 'General Admission', 50.00),
    (9, 'VIP', 120.00),
    (10, 'General Admission', 30.00),
    (11, 'General Admission', 15.00),
    (11, 'Early Bird', 10.00),
    (12, 'General Admission', 40.00),
    (13, 'General Admission', 20.00),
    (14, 'General Admission', 30.00),
    (15, 'General Admission', 25.00),
    (15, 'VIP', 60.00),
    (16, 'General Admission', 20.00),
    (16, 'VIP', 45.00),
    (17, 'General Admission', 10.00),
    (17, 'Early Bird', 5.00),
    (18, 'General Admission', 35.00),
    (19, 'General Admission', 25.00),
    (20, 'General Admission', 30.00),
    (20, 'VIP', 70.00);

-- Performance
INSERT INTO Performance (EventID, ArtistID, SetListPosition, PerformanceStartTime)
VALUES
    -- Event 1
    (1, 3, 1, '19:00:00'),
    (1, 1, 2, '20:00:00'),
    (1, 2, 3, '21:00:00'),

    -- Event 2
    (2, 5, 1, '18:30:00'),
    (2, 4, 2, '19:45:00'),

    -- Event 3
    (3, 7, 1, '20:00:00'),
    (3, 6, 2, '21:15:00'),

    -- Event 4
    (4, 9, 1, '19:00:00'),
    (4, 8, 2, '20:30:00'),
    (4, 10, 3, '22:00:00'),

    -- Event 5
    (5, 11, 1, '17:30:00'),
    (5, 12, 2, '18:45:00'),

    -- Event 6
    (6, 1, 1, '20:00:00'),
    (6, 2, 2, '21:30:00'),

    -- Event 7
    (7, 5, 1, NULL),
    (7, 2, 2, NULL),
    (7, 3, 3, NULL),

    -- Event 8
    (8, 6, 1, '18:00:00'),
    (8, 7, 2, '19:30:00'),

    -- Event 9
    (9, 10, 1, '21:00:00'),
    (9, 9, 2, '22:30:00'),

    -- Event 10
    (10, 12, 1, '20:00:00'),
    (10, 11, 2, '21:15:00'),

    -- Event 11
    (11, 1, 1, '19:30:00'),
    (11, 6, 2, '20:45:00'),
    (11, 8, 3, '22:00:00'),

    -- Event 12
    (12, 3, 1, NULL),
    (12, 4, 2, NULL),

    -- Event 13
    (13, 7, 1, '20:00:00'),
    (13, 2, 2, '21:30:00'),

    -- Event 14
    (14, 9, 1, '19:30:00'),
    (14, 8, 2, '21:00:00'),

    -- Event 15
    (15, 6, 1, '17:30:00'),
    (15, 10, 2, '18:45:00'),

    -- Event 16
    (16, 11, 1, '19:00:00'),
    (16, 12, 2, '20:15:00'),
    (16, 1, 3, '21:30:00'),

    -- Event 17
    (17, 4, 1, NULL),
    (17, 3, 2, NULL),

    -- Event 18
    (18, 5, 1, '18:30:00'),
    (18, 7, 2, '20:00:00'),

    -- Event 19
    (19, 8, 1, '19:00:00'),
    (19, 2, 2, '20:30:00'),

    -- Event 20
    (20, 9, 1, '19:30:00'),
    (20, 1, 2, '21:00:00');

-- UserSavedEvent
INSERT INTO UserSavedEvent (UserID, EventID) VALUES

    -- User 1
    (1, 1),
    (1, 3),
    (1, 5),
    (1, 7),
    (1, 9),
    (1, 11),
    (1, 13),
    (1, 15),
    (1, 17),
    (1, 19);

-- UserRecentlyViewedEvent
INSERT INTO UserRecentlyViewedEvent (UserID, EventID, DateTimeViewed) VALUES

    -- User 1
    (1, 9, '2023-12-01 12:45:00'),
    (1, 4, '2023-12-02 12:43:00'),
    (1, 15, '2023-12-03 12:39:00'),
    (1, 8, '2023-12-04 12:35:00'),
    (1, 3, '2023-12-05 12:30:00'),
    (1, 11, '2023-12-06 12:27:00'),
    (1, 13, '2023-12-07 12:26:00'),
    (1, 19, '2023-12-10 12:24:00');

-- UserFavouriteArtist
INSERT INTO UserFavouriteArtist (UserID, ArtistID) VALUES

    -- User 1
    (1, 1),
    (1, 3),
    (1, 5),
    (1, 7),
    (1, 9),
    (1, 11);

-- UserFavouriteVenue
INSERT INTO UserFavouriteVenue (UserID, VenueID) VALUES

    -- User 1
    (1, 1),
    (1, 3);

-- Image
INSERT INTO Image (URL) VALUES

    -- Venues

    ('https://www.nme.com/wp-content/uploads/2020/04/Gasometer-hotel@2000x1270.jpg'), -- 1: Venue: The Gasometer
    ('https://live.staticflickr.com/782/20559504013_0607ebc138_b.jpg'), -- 2: Venue: The Gasometer
    ('https://www.visitvictoria.com/-/media/images/melbourne/things-to-do/entertainment/live-music/the-corner-hotel/the-corner-hotel_mel_r_1409926_1600x900.jpg?ts=20250530140409&c=product&cw=1600&ch=1200'), -- 3: Venue: The Corner Hotel
    ('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ-dmWA3tpHh-wRE4hMLHFb-UcMPJYHBLytQw&s'), -- 4: Venue: The Tote
    ('https://media.timeout.com/images/103459992/750/422/image.jpg'), -- 5: Venue: The Tote
    ('https://i.redd.it/the-colourful-shopfronts-of-sydney-rd-brunswick-v0-2yaalhf06md91.jpg?width=3459&format=pjpg&auto=webp&s=76ca6880d027636f1adbd06ec6a574fc68a87f88'), -- 6: Venue: The Retreat Hotel
    ('https://images.squarespace-cdn.com/content/v1/59f9239e9f8dce3f3205e681/9ff921df-54ac-4152-8b2d-43b3da836062/IMG_3886.jpg'), -- 7: Venue: The Retreat Hotel
    ('https://hiddencitysecrets.com.au/wp-content/uploads/2019/03/51658223_10156966030323431_6074250157992443904_o.jpg'), -- 8: Venue: Hotel Esplanade
    ('https://images.squarespace-cdn.com/content/v1/605d28ae1c81653a45a0cc68/139e2353-a58d-4e12-96f6-240e47fb93fc/IMG_6574.JPG'), -- 9: Venue: The Night Cat

    -- Artists

    ('https://www.basicstuffmagazine.com/wp-content/uploads/2020/04/N1Ynur1-.jpg'), -- 10: Artist: 1: The Amazing Devil
    ('https://f4.bcbits.com/img/0007510292_10.jpg'), -- 11: Artist: 1: The Amazing Devil
    ('https://assets-au-01.kc-usercontent.com/a74cc67d-6861-022b-4d6d-57679e9d331f/e49ed7a9-9304-42b7-92f1-fe8011952620/Gav_Singing.jpg'), -- 12: Artist: 2: Amber Drift
    ('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSZbm0PR0tL-t3qas5Ivhy_1l7oQlUaxogqUg&s'), -- 13: Artist: 2: Amber Drift
    ('https://live-production.wcms.abc-cdn.net.au/24d7be928193158b555b45190c8fb9c7?impolicy=wcms_crop_resize&cropH=562&cropW=1000&xPos=0&yPos=0&width=862&height=485'), -- 14: Artist: 3: Gang of Youths
    ('https://rmitcatalyst.com/wp-content/uploads/2022/08/8064.jpg'), -- 15: Artist: 3: Gang of Youths
    ('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT44BnArRE3V1Lr0WaLrjaREsn_kb2adbFxpw&s'), -- 16: Artist: 4: Tash Sultana
    ('https://i0.wp.com/www.losbuffo.com/wp-content/uploads/2019/07/cbc750ac825fd9d1845966f23b818b74.jpg?ssl=1'), -- 17: Artist: 4: Tash Sultana
    ('https://images.squarespace-cdn.com/content/v1/5c5b7092b914495766354bb2/1625692356911-RWZBYA6A0DDIVSXR7U7Q/Courtney+Barnett+2021+-+credit+Mia+Mala+McDonald+LOW+RES.jpg?format=2500w'), -- 18: Artist: 5: Courtney Barnett
    ('https://www.rollingstone.com/wp-content/uploads/2021/07/Ian_Laidlaw-20.jpg'), -- 19: Artist: 5: Courtney Barnett
    ('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTIvo_sVaTnNUqeci4nzgGN-TMhWMAVsCsMrw&s'), -- 20: Artist: 6: King Gizzard & the Lizard Wizard
    ('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQhFy8ZctendIK8VCftxnDIaVQ-VVYumpy-SuxZ1cXYVzHc-iXPdiiiS0XGkN5v2Rdmyis&usqp=CAU'), -- 21: Artist: 6: King Gizzard & the Lizard Wizard
    ('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTA-jV5-2yKvf_nMFu2PuUsSTSZVv9lreHk6A&s'), -- 22: Artist: 7: The Teskey Brothers
    ('https://content.api.news/v3/images/bin/dad30a16816abc8e4c921a14497ab27a'), -- 23: Artist: 7: The Teskey Brothers
    ('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRwE_Byup7QilRC02EBu4x4yNBM0-hQPjFH8g&s'), -- 24: Artist: 8: Vance Joy
    ('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSdnwN7pYbEAsc8YNKDPBLiswQ1io9RuPDG6Q&s'), -- 25: Artist: 8: Vance Joy
    ('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTpao8pFHB0rvq4NPcODaRAs99kKJH2qgiCjA&s'), -- 26: Artist: 9: Tame Impala
    ('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQiEmypbHgifqbqgTUjxxmiuPn57d9A-9sF-w&s'), -- 27: Artist: 9: Tame Impala
    ('https://yt3.googleusercontent.com\n3Dzr3jPq47mOrq1P4Z82oBnyqEeSGiTCtVDPbYm4AToS5ogJHhV58aPL0HcaCX66bYIYDWUen4=s900-c-k-c0x00ffffff-no-rj'), -- 28: Artist: 10: The Cat Empire
    ('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRgRccIWSxQRXYNXDSm_WTY5LpJqYzLYrgm2w2J9KqZCBH1nVRq4L5ncUspl9DlTvLDsl4&usqp=CAU'), -- 29: Artist: 10: The Cat Empire
    ('https://australianmusician.com.au/wp-content/uploads/2021/05/square_THE_JUNGLE_GIANTS_1434.jpg'), -- 30: Artist: 11: The Jungle Giants
    ('https://images.squarespace-cdn.com/content/v1/5d96cb88130d950f0cc37e46/1619760168005-0BK4G2QGDR1CQPNC546U/210322_THE_JUNGLE_GIANTS_1060+med+res.jpg?format=500w'), -- 31: Artist: 11: The Jungle Giants
    ('https://images.squarespace-cdn.com/content/v1/5114c744e4b044f8ed62c985/1476780814221-ARRV2JGOA48KIV79CIMY/ball_park_music_H_0416.3b54c863e440afc0a5b7124d393bc888.jpg?format=750w'), -- 32: Artist: 12: Ball Park Music
    ('https://static.ffx.io/images/$width_620%2C$height_414/t_crop_fill/q_86%2Cf_auto/cd415f791f2f0b1ccd8b93429fedb31b970e03ce'), -- 33: Artist: 12: Ball Park Music
    ('https://beat.com.au/wp-content/uploads/2021/12/Promo-Website-Website-landscape-content-3.jpeg'), -- 34: Artist: 13: Teether & Kuya Neil
    ('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRQS4e3F9HIKK3KWm21tI2OAfvt58LAJdQ4YA&s'), -- 35: Artist: 13: Teether & Kuya Neil
    ('https://assets-au-01.kc-usercontent.com/a74cc67d-6861-022b-4d6d-57679e9d331f/b32b47d0-088f-4e74-a528-538162bf70df/Screenshot_2023_09_18_at_13.30.06.png'), -- 36: Artist: 14: Dear Matilda
    ('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQO0bw_lFxYlrCyQUnkx_52_TLGijzrEEXKaw&s'), -- 37: Artist: 14: Dear Matilda
    ('https://assets-au-01.kc-usercontent.com/a74cc67d-6861-022b-4d6d-57679e9d331f/ab879295-e4e0-43a0-a832-fdd779deca2b/Tiarnie_edited.1_cropped.jpg'), -- 38: Artist: 15: Tiarnie
    ('https://assets-au-01.kc-usercontent.com/a74cc67d-6861-022b-4d6d-57679e9d331f/fe19a252-69ec-4d7a-bc10-ac55d8a5fe4d/Tiarnie_edited.4_cropped.jpg'), -- 39: Artist: 15: Tiarnie
    (null), -- 40: Artist: 16: Get Jaxxed
    (null), -- 41: Artist: 16: Get Jaxxed
    ('https://i.guim.co.uk/img/media/5f8f1b940a98cd63bd0e9923e6d2290b9ae00b62/0_96_2955_1774/master/2955.jpg?width=1200&quality=85&auto=format&fit=max&s=c521135b3cbe951bf00240459450bb9b'), -- 42: Artist: 17: GBH
    ('https://preview.redd.it/9vivmzk4a8bd1.jpeg?width=640&crop=smart&auto=webp&s=9225195ba782497dbe042ea38e9baf2f89e4a6c4'), -- 43: Artist: 17: GBH
    ('https://f4.bcbits.com/img/0036854321_10.jpg'), -- 44: Artist: 18: Destruktor
    ('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcToYvCY35j24FB6a6JGLMMQjOquH8cO2h_dsg&s'), -- 45: Artist: 18: Destruktor
    ('https://f4.bcbits.com/img/0032909275_10.jpg'), -- 46: Artist: 19: Voidfall
    ('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ4QGdzzSj9tRSU640qBAKGhgR6Lcnl-aQFiQ&s'), -- 47: Artist: 19: Voidfall

    -- Banners

    ('./bandwidth/banners/1.png'), -- 48: Banner 1
    ('./bandwidth/banners/2.png'), -- 49:Banner 2
    ('./bandwidth/banners/3.png'), -- 50: Banner 3
    ('./bandwidth/banners/4.png'), -- 51: Banner 4
    ('./bandwidth/banners/5.png'), -- 52: Banner 5

    -- Artists Continued
    ('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTHWP5mQmxSe6A0GhQUb72v3DDAcKU8PH2KTg&s'), -- 53: Artist: 22: STALKER
    ('https://www.angrymetalguy.com/wp-content/uploads/2024/04/Austere-2024-500x468.jpg'), -- 54: Artist: 23: Austere
    ('https://www.metal-archives.com/images/9/9/1/8/99183_photo.jpg?3603'), -- 55: Artist: 23: Austere
    (null), -- 56: Artist: 24: Skuggor
    (null), -- 57: Artist: 24: Skuggor
    ('https://lastfm.freetls.fastly.net/i/u/ar0/c44e42874a3516e2f909dd7da1e3a399.jpg'), -- 58: Artist: 25: Paroxysmal Descent
    (null), -- 59: Artist: 25: Paroxysmal Descent
    ('https://images.squarespace-cdn.com/content/v1/5e3ca101be5aa45028420f15/429f45ec-bfee-4d43-a96b-a3f585fbefb1/240306_RumJungle_Studio2564+copy.jpg'), -- 60: Artist: 26: Rum Jungle
    ('https://static.wixstatic.com/media/a27d24_e574aea716df4cd39a3d6c2ea9bb0628~mv2.jpg/v1/fill/w_1000,h_1000,al_c,q_85,usm_0.66_1.00_0.01/a27d24_e574aea716df4cd39a3d6c2ea9bb0628~mv2.jpg'), -- 61: Artist: 26: Rum Jungle
    ('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSuqYXhkyoPoO6EaKqzRoizFl0vTby_NIsARg&s'), -- 62: Artist: 27: Letters to Lions
    ('https://img.merchbar.com/brand/square/death-by-denim.jpg?q=40&ar=1:1&gravity=smart&w=1400'), -- 63: Artist: 27: Letters to Lions
    ('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTajAmHjbbSeYj-mYgeiA0faPxWMj6GcQJxgg&s'), -- 64: Artist: 28: Underlay
    ('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQCQiK6esYohX81cjlzNrFv-ETR7nCWJAyRH0-GRSxHPXHZJfW7tHW6HC2e5rjnEiLvQMg&usqp=CAU'), -- 65: Artist: 28: Underlay
    ('https://images.squarespace-cdn.com/content/v1/6253cb267c3d5378b60f58b6/57558ec9-1272-4963-b4f5-528847e61881/Sunfruits_album+art+cover+%282%29.jpg'), -- 66: Artist: 29: Winter McQuinn
    ('https://static.wixstatic.com/media/23562c_02d5fc8bbfe14153a603c44836bf7c7f~mv2.jpg/v1/fill/w_556,h_396,al_c,q_80,usm_0.66_1.00_0.01,enc_avif,quality_auto/23562c_02d5fc8bbfe14153a603c44836bf7c7f~mv2.jpg'), -- 67: Artist: 29: Winter McQuinn
    ('https://www.recordturnover.com/wp-content/uploads/2019/06/0015875208_10.jpg'), -- 68: Artist: 30: Acacia Pip
    ('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQh_f1ZSM8J9fFLOT2J3G4_FA8ajQt-GL-gfKS6m5WQu2FcsBr9hmwJ_rXuctkqTF2cpWE&usqp=CAU'), -- 69: Artist: 30: Acacia Pip
    ('https://yt3.googleusercontent.com/ew-ivg1OTIOb_tdwXhA_LXY8ZIPlpvO_BMty6nLqKRPhk1ulzMaoWHzEYhIy155cJczsC6aA4A=s900-c-k-c0x00ffffff-no-rj'), -- 70: Artist: 31: Richy Mitch & The Coal Miners
    ('https://cdn.prod.website-files.com/65511e3719795897b270b804/667346d756914ff69f234a91_richy-mitch-and-the-coalminers-e-chillfiltr-1.jpeg'), -- 71: Artist: 31: Richy Mitch & The Coal Miners
    ('https://beatsy.co/wp-content/uploads/2024/01/south-summit-band.jpeg'), -- 72: Artist: 32: South Summit
    ('https://odyssea.showticks.com/_uploads/artist_images/4_lrg_20231406125937_img.jpg'), -- 73: Artist: 32: South Summit
    ('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSBmZMNb_ingHtIwDeI_mFmL_miRYgmIOs7Tw&s'), -- 74: Artist: 33: Kurilpa Reach
    ('https://scenestr.com.au/images/k2articles/music/kurilpa-reach-create-music-that-makes-you-wanna-dance-20201104.jpg'), -- 75: Artist: 33: Kurilpa Reach
    ('https://i.guim.co.uk/img/media/5285a43838aad76be9b07e5e550beb874a247b6e/0_321_1918_1150/master/1918.jpg?width=465&dpr=1&s=none&crop=none'), -- 76: Artist: 34: Placebo
    ('https://static.wikia.nocookie.net/profileplacebo/images/7/7d/Placebo.jpg/revision/latest?cb=20100722015708'), -- 77: Artist: 34: Placebo
    (null), -- 78: Artist: 35: Black Market Music // NOT A BAND. REPLACE
    (null), -- 79: Artist: 35: Black Market Music
    ('https://i1.sndcdn.com/artworks-000304839612-bfjf2p-t500x500.jpg'), -- 80: Artist: 36: Gena Rose Bruce
    ('https://www.clashmusic.com/wp-content/uploads/2023/08/Gena-Rose-Bruce.jpg'), -- 81: Artist: 36: Gena Rose Bruce
    ('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT0t_pfM3AHzW0Nba-mQ4jrSJOn6LVnhp_1Gw&s'), -- 82: Artist: 37: Kristen Hersh
    ('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQheGnLFsPLJMEcoQ_idEEME1M1P7KBfOkw1McZRpWX09aiumvdVfNfw7AUfX8BXcYjn3U&usqp=CAU'), -- 83: Artist: 37: Kristen Hersh
    ('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQrXdlpl9evSEz4Gu4FkCNJyKcsAqG03Oh_Ow&s'), -- 84: Artist: 38: Shihad
    ('https://i.scdn.co/image/ab6761610000e5ebaeaffb35dd02c146df2c5811'), -- 85: Artist: 38: Shihad
    ('https://img.apmcdn.org/a7ed1e4e9351d2b6678b31df2a157185312b08b4/uncropped/b67007-20130621-todd-rundgren.jpg'), -- 86: Artist: 39: Todd Rundgren
    ('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRW3HcCsjVWlo3jPgByomgjpKqjhxDTnegztA&s'), -- 87: Artist: 39: Todd Rundgren
    ('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRl4l8W6H2v_QqsxLr4-Vx_tUz02SRSEyxy7g&s'), -- 88: Artist: 40: Queen Omega & The Royal Souls
    ('https://skinfama.com/wp-content/uploads/2024/02/Capture-decran-2024-02-22-a-13.02.20.png'), -- 89: Artist: 40: Queen Omega & The Royal Souls
    ('https://kissfm.com.au/wp-content/uploads/2021/05/feeYas_optimized.jpg'), -- 90: Artist: 41: Housewife’s Choice
    ('https://images.ctfassets.net/yfwfvlr8bdv4/29m9cXkz16t2lq4EuL7VzL/b030fcfc52f2229346eda15dd6b11de6/HWC.jpg?h=2048'), -- 91: Artist: 41: Housewife’s Choice
    ('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTXExUbf_aFFugPLFkIz-yNUrM-KhhHBRIEVQ&s'), -- 92: Artist: 42: Troublemekka
    ('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSp8EXbuSjw9TDHtu5Hhrl91Zeajsci4Rp10A&s'), -- 93: Artist: 42: Troublemekka
    (null), -- 94: Artist: 43: Itations
    (null), -- 95: Artist: 43: Itations
    ('https://usercontent.one/wp/www.asbomagazine.com/wp-content/uploads/2024/07/Daily-J.jpg?media=1677589372'), -- 96: Artist: 44: DAILY J
    ('https://static.wixstatic.com/media/dc034f_7b599d606e38430a80cb8aa7ef8542fc~mv2.jpg/v1/fill/w_1000,h_575,al_c,q_85,usm_0.66_1.00_0.01/dc034f_7b599d606e38430a80cb8aa7ef8542fc~mv2.jpg'), -- 97: Artist: 44: DAILY J
    ('https://f4.bcbits.com/img/0029517990_10.jpg'), -- 98: Artist: 45: Faceless Burial
    ('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSftzxZ_ELI4LRlZykIonc5e7ZMWHrDrtviKQ&s'), -- 99: Artist: 45: Faceless Burial
    ('https://i0.wp.com/therazorsedge.rocks/wp-content/uploads/2024/11/gutless.jpg?resize=678%2C381&ssl=1'), -- 100: Artist: 46: Gutless
    ('https://f4.bcbits.com/img/0032182188_25.jpg'), -- 101: Artist: 46: Gutless
    ('https://i.ytimg.com/vi/ZpO7YwcMEQ4/sddefault.jpg?v=65e06301'), -- 102: Artist: 47: Pestilential Shadows
    ('https://static.wixstatic.com/media/becdcb_236c7fec7d8d43c6a5432c2f80950385~mv2.jpg/v1/fill/w_568,h_902,al_c,q_85,usm_0.66_1.00_0.01,enc_auto/becdcb_236c7fec7d8d43c6a5432c2f80950385~mv2.jpg'), -- 103: Artist: 47: Pestilential Shadows
    ('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS0VVY8oDU1k0XofkIFtF0LTxyFp09EKQ1p0w&s'), -- 104: Artist: 48: Werewolves
    ('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRWs9ZATuPDkxCucXcW-EtXaW2l6mnG34XwKA&s'), -- 105: Artist: 48: Werewolves
    ('https://f4.bcbits.com/img/0026160874_25.jpg'), -- 106: Artist: 49: Pizza Death
    ('https://i.ytimg.com/vi/WUYpSsDhm4o/maxresdefault.jpg'), -- 107: Artist: 49: Pizza Death
    ('https://heavymag.com.au/wp-content/uploads/2022/08/munitions-1013x675.jpg'), -- 108: Artist: 50: Munitions
    ('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTX2WVgO2veC0YXa2x2bb26epReszNfu_zB5A&s'), -- 109: Artist: 50: Munitions
    ('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRo6L2MO9JZWx0SODlqaXhz4U-cECXNjUlaMw&s'), -- 110: Artist: 51: Vexation
    ('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTbVVLKCSsXo9n1scDpazn-YYh1o_yOayOD9Q&s'), -- 111: Artist: 51: Vexation
    ('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRCfh9NZIAbT16m4Qevrb1-H0_C2sBLbMrQog&s'), -- 112: Artist: 52: Midnight Odyssey
    ('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSPJv9fEGGj3PIueUzC9x487JKr6Hup4hVKtw&s'), -- 113: Artist: 52: Midnight Odyssey
    ('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTjMac-dtlw2VK9q0gvjFVQpU2kQD_pzTJuSg&s'), -- 114: Artist: 53: Goat Shaman
    ('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRkSgt7Qpjxn3o6y0N-P2LnGkE1RL22ASfi-GMJSm4_6GQWZDdtnZ0v9hMZ1OKUYd6-DMU&usqp=CAU'), -- 115: Artist: 53: Goat Shaman
    ('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRykAFHXQ5T3YsSLI2fBJxra5mHGMFINgZcKp0KJp5wCeb9VJS8xrbq2FCy0hb0ETG1Ox0&usqp=CAU'), -- 116: Artist: 54: Redferrin
    ('https://viberate-upload.ams3.cdn.digitaloceanspaces.com/prod/entity/artist/redferrin-YbqbO'), -- 117: Artist: 54: Redferrin
    ('https://www.everblack.com.au/wp-content/uploads/2024/05/1-17-1024x768.jpg'), -- 118: Artist: 55: CERES
    ('https://mattwalterphoto.com/wp-content/uploads/2018/06/Ceres-stretch-21.jpg'), -- 119: Artist: 55: CERES
    ('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQCQzFmy5ipVNG7TXF7RdmUI0fj3KET3syhk8TdgroYlvreiypwCRD7Vtgr3TdPcfyCZ9k&usqp=CAU'), -- 120: Artist: 56: Great Gable
    ('https://assets-au-01.kc-usercontent.com/a74cc67d-6861-022b-4d6d-57679e9d331f/73a61713-8dbb-481d-81ee-b09454c1239d/d8ef3280-7b3c-4578-a6b1-c59ab9d1b5c7.jpg'), -- 121: Artist: 56: Great Gable
    ('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTf72f_QLLbl_3EiPV8Ekyz4PP7qjIHiNxlWw&s'), -- 122: Artist: 57: Amble
    ('https://www.ambleofficial.com/sites/g/files/g2000018651/files/2024-07/Marys_Pub.jpg'), -- 123: Artist: 57: Amble
    ('https://mute.com/wp-content/uploads/2024/01/BarryAdamson_Credit_Mark_David_Ford_BA4-scaled-e1706703474525.jpg'), -- 124: Artist: 58: Barry Adamson
    ('https://images.squarespace-cdn.com/content/v1/54481c8fe4b0a9431d5d27fe/1576524914558-X8I784UM7P03IVWYJ0UR/ke17ZwdGBToddI8pDm48kO7CEwJcHHIJQIL-LYuveh5Zw-zPPgdn4jUwVcJE1ZvWQUxwkmyExglNqGp0IvTJZUJFbgE-7XRK3dMEBRBhUpzWbjI805Tukc9IB5MwWFGexP-6lFD87-NTIy9laRdZcxOGznz0ryHlyga6Tg4YMbA/barry+adamson_opt.jpg'), -- 125: Artist: 58: Barry Adamson
    ('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTmyj2suO6vUTPdR7UlHhZPrbsdQQ8ejxJoebbh2ekMKG0COIG0wUEuq_-8ZK__yrRfCog&usqp=CAU'), -- 126: Artist: 59: The Wreckery
    ('https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEi0CHkUvJHLZ6ntw3t3org3pABG86EPGPXTIZ5Ph6xjYOkiGXbRpZo1J3nQBImZk_gh0RaerdAnsckXvRkABxhYQ8kNJfIx6S54Stap3qvA7JzapwqCpdfSrRCOAu6_iLR4t4xcbsxU9XoFDcjXLeC_a20RoT59G7guLVzCtkcGsXOffz-vJV-xq-hbSdM/s600/tw.png'), -- 127: Artist: 59: The Wreckery
    ('https://selectmusic.com.au/wp-content/uploads/2018/09/The-Beths-Press-Pic-scaled.jpeg'), -- 128: Artist: 60: The Beths
    ('https://pbs.twimg.com/media/FuuDFQUWwAA57j3?format=jpg&name=large'), -- 129: Artist: 60: The Beths
    ('https://f4.bcbits.com/img/0019751308_10.jpg'), -- 130: Artist: 61: Plastic Section
    ('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRn4md0xaLugg2t_YG_BgY36o6qhrbFreDoJA&s'), -- 131: Artist: 61: Plastic Section
    (null), -- 132: Artist: 62: The Earthquakes
    (null), -- 133: Artist: 62: The Earthquakes
    ('https://f4.bcbits.com/img/0026751202_10.jpg'), -- 134: Artist: 63: Fever Shack
    ('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSP7gm2J3BXRcIS7z4FslfHg0SMqNtUc3NDjQ&s'), -- 135: Artist: 63: Fever Shack
    ('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSUeaoLUEBF4nzP1yucWfukCjZHfxVkq53TSw&s'), -- 136: Artist: 64: No Way Out
    ('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSZUQlR3VhqrWvZICSSI-OYJtz6C9J93bpA2A&s'), -- 137: Artist: 64: No Way Out
    ('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSPJ6j8naBWMVJpjeFIVp2nveagQlfhvaGxXA&s'), -- 138: Artist: 65: Heat
    ('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSaHF20XRh7DfZ-jwW8qgu1p1yGwxm6uIS6I-tBsD44AAHQDCODYG9eU6ebmM1RvtUDvJI&usqp=CAU'), -- 139: Artist: 65: Heat
    ('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSLyx4KlEh1a43OML6dKhomjfjZa1TI9_w-UQ&s'), -- 140: Artist: 66: Judged By 12
    ('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRjHHrv72Tk7izbMduoyti40aJApACctZ6zkTpUqL5fPeW4GsIhkePAg11azW388iysA7o&usqp=CAU'), -- 141: Artist: 66: Judged By 12
    ('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRXDpDSA4JuUt94-2QRjhSuTZuZi8P4UyS7QQ&s'), -- 142: Artist: 67: Timepeace
    ('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTejf463w5hBcwx75G9OPKvnuxDleOzJQ6vEw&s'), -- 143: Artist: 67: Timepeace
    ('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTtwWQI16JxmghQZAHa4unfD6uE_6c0EaaQuiaDyXsp3AipXOiccWh8oU-8S6tOIteZ9gM&usqp=CAU'), -- 144: Artist: 68: Wet Kiss
    ('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR4esbYjZ14HIqAHP8gCVpLqkFuuIWoZifPeA&s'), -- 145: Artist: 68: Wet Kiss
    ('https://example.com/https://www.ish.org.uk/wp-content/uploads/2020/02/vktw3i9usrlz66nvx9dd-960x532.jpegimage146.jpg'), -- 146: Artist: 69: The 5.6.7.8's
    ('https://examhttps://www.pbsfm.org.au/sites/default/files\news/5_6_7_8s_0.jpgple.com/image147.jpg'), -- 147: Artist: 69: The 5.6.7.8's
    ('https://i0.wp.com/wallofsoundau.com/wp-content/uploads/2022/04/CJG2022-LANDSCAPE01.jpg?fit=1600%2C827&ssl=1'), -- 148: Artist: 70: Clay J Gladstone
    ('https://heavymag.com.au/wp-content/uploads/2022/08/clay.jpg'), -- 149: Artist: 70: Clay J Gladstone
    ('https://usercontent.one/wp/www.recordturnover.com/wp-content/uploads/2021/07/0025009287_10.jpg?media=1728998601'), -- 150: Artist: 71: Delivery
    ('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTilJTZf1OOqExbjLM1L6HsJELJkG5BLsugVQ&s'), -- 151: Artist: 71: Delivery
    ('https://www.angrymetalguy.com/wp-content/uploads/2015/08/Deiphago_2015-500x333.jpg'), -- 152: Artist: 72: DEIPHAGO
    ('https://cdn-asia.uniteasia.org/uploads/2019/04/8862a68c-deiphago1.jpg'), -- 153: Artist: 72: DEIPHAGO
    (null), -- 154: Artist: 73: Void Christ
    (null), -- 155: Artist: 73: Void Christ
    ('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR_RZaLTxfDRemkIi1hlY2uidoddhDp7_tLgA&s'), -- 156: Artist: 74: Gutalax
    ('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ8pONrONK1hg6flLYvkF8OpnsCtwQdHCjcosbpAX8DF_CfHaxpWpQK2bd58siAgBNpE-E&usqp=CAU'), -- 157: Artist: 74: Gutalax
    ('https://fortemag.com.au/wp-content/uploads/2022/02/Partner-Look.jpg'), -- 158: Artist: 75: Lachlan Denton
    ('https://f4.bcbits.com/img/0031113064_10.jpg'), -- 159: Artist: 75: Lachlan Denton
    ('https://f4.bcbits.com/img/0036453316_10.jpg'), -- 160: Artist: 76: Brian El Dorado and The Tuesday People
    ('https://i.scdn.co/image/ab6761610000e5eb1e7231ac50dbd446f054473a'), -- 161: Artist: 76: Brian El Dorado and The Tuesday People
    ('https://australianmusician.com.au/wp-content/uploads/2024/09/IMG_0025-scaled.jpg'), -- 162: Artist: 77: Zevon Lee
    ('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSl0tSjKW-kxpn5Ni9gCxbIDeBcINRsAZEqUw&s'), -- 163: Artist: 77: Zevon Lee
    ('https://therockacademy.com.au/wp-content/uploads/2024/03\nitida-495400.jpg'), -- 164: Artist: 78: Nitida Atkinson
    ('https://frooty.com.au/images/music/D/Dont-Thank-Me-Spank-Me/DontThankMeSpankMe-2024.jpg'), -- 165: Artist: 78: Nitida Atkinson
    ('https://images.squarespace-cdn.com/content/v1/628ae737f51efc39be1c17ca/2ec59078-0e46-4a32-924c-27e560ea10dc/ktunbridge-105.jpg'), -- 166: Artist: 79: Austin Mackay
    ('https://scenestr.com.au/images/stories/music/A/Austin-Mackay/Austin-Mackay-07-23.jpg'), -- 167: Artist: 79: Austin Mackay
    ('https://f4.bcbits.com/img/0038085793_25.jpg'), -- 168: Artist: 80: Quality Used Cars
    ('https://beat.com.au/wp-content/uploads/2023/08/Website-Landscape-Photo-Template-34.jpg'), -- 169: Artist: 80: Quality Used Cars
    ('https://assets-au-01.kc-usercontent.com/a74cc67d-6861-022b-4d6d-57679e9d331f/9c247f12-d4c6-4703-992e-3a53167ff588/95809a3e_4f3b_4bfc_85bd_ba4ee77688eb.jpg'), -- 170: Artist: 81: LARGE MIRAGE
    ('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSC85NiNk6NXSj54Ab4zjRGOyWowd-yhc312Q&s'), -- 171: Artist: 81: LARGE MIRAGE
    ('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTYi8i3zXt94YWXqVD6DGOA38ZWtEXep67Azg&s'), -- 172: Artist: 82: HOLiDAY MYSTICS
    ('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT0p_2sfA55tg-w2F06DlQmxld3B6bLdA8N4w&s'), -- 173: Artist: 82: HOLiDAY MYSTICS
    ('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR_TOC_FVfLKzOHh5L7nY0hk9emuhixc4XGZg&s'), -- 174: Artist: 83: Ramona Sky
    ('https://viberate-upload.ams3.cdn.digitaloceanspaces.com/prod/entity/artist/ramona-sky-1UlvA'), -- 175: Artist: 83: Ramona Sky
    ('https://australianmusician.com.au/wp-content/uploads/2014/03/gwynashton.jpg'), -- 176: Artist: 84: Gwyn Ashton
    ('https://www.seniorscard.sa.gov.au/__data/assets/image/0020/913511/Gwyn-Ashton.jpg'), -- 177: Artist: 84: Gwyn Ashton
    ('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT9ZlrqUnvARvDNFw9sXqmFQydGqdIM2trPSA&s'), -- 178: Artist: 85: Gavin Bowles & The Distractions
    ('https://scenestr.com.au/images/stories/music/G/Gavin-Bowles-The-Distractions/Gavin-Bowles-and-The-Distractions-09-23.jpg'), -- 179: Artist: 85: Gavin Bowles & The Distractions
    ('https://yt3.googleusercontent.com/ytc/AIdro_nDZXSgrxFiczZjWLQ0aRHinWHqYRJnS6_51vpm0ks3aw4=s900-c-k-c0x00ffffff-no-rj'), -- 180: Artist: 86: Terra Rouge
    ('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRzyrDf9hZqjjIDil-Ptu9D1yhurgeaSMrYig&s'), -- 181: Artist: 86: Terra Rouge
    (null), -- 182: Artist: 87: Incident Response Select All
    (null), -- 183: Artist: 87: Incident Response Select All
    ('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT5hSsFPz5PVBXV1xhwflXpOdEplcgFmo87bA&s'), -- 184: Artist: 88: B-sides
    ('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQs-dA4HIs8cG652zd05LhN6BR373yGqyCN1A&s'), -- 185: Artist: 88: B-sides
    ('https://images.squarespace-cdn.com/content/v1/53768d43e4b0875c4147ee9b/1408850980937-P4W3H3RKT8N2ARLVIEFI/Felony+2+%28B%26W%29.jpg?format=1000w'), -- 186: Artist: 89: FELONY.
    ('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRVMXbcBzh-zjqFEbujO3GRknTV5J8gSUYmrg&s'), -- 187: Artist: 89: FELONY.
    ('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRDoxvA05cdwBNQpw_FgrWulLYNmHwBbWAPXw&s'), -- 188: Artist: 90: Grassy Strings
    ('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR6kOh_W5pnGmnd_oWvCJCQehKO3dyDdITEXQ&s'), -- 189: Artist: 90: Grassy Strings
    ('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTA7BWLZAL1mW_hS4kPi96C7wIRnfsBb6epaA&s'), -- 190: Artist: 91: The Pheasantry Band
    ('https://f4.bcbits.com/img/0010347953_71.jpg'), -- 191: Artist: 91: The Pheasantry Band
    ('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQWBBwGWGBq_-UQFyy2aoGfuqjEzHZJnPNmTg&s'), -- 192: Artist: 92: Ashley Naylor
    ('https://australianmusician.com.au/wp-content/uploads/2023/11/IMG_0729.jpg'), -- 193: Artist: 92: Ashley Naylor
    ('https://clonard.vic.edu.au/wp-content/uploads/2024/08/Photo-by-Jake-Nowakowski.jpg'), -- 194: Artist: 93: Kathleen Halloran
    ('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTePjOe71WC11MuYriWlWDsGz1b9sVmhs1_PGZhlt_0y4Kjq_PC13wHDjg_ozNeiEWQHlc&usqp=CAU'), -- 195: Artist: 93: Kathleen Halloran
    ('https://voxneon.com.au/wp-content/uploads/2024/09/voxneon-band-scott-hands.jpg'), -- 196: Artist: 94: VOXNEON
    ('https://voxneon.com.au/wp-content/uploads/2024/09/voxneon-band-live-scott-shaun.jpg'), -- 197: Artist: 94: VOXNEON
    ('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSTTWy91NXJQUcOGa4hbJbh_oRMFQxdD_1FXA&s'), -- 198: Artist: 95: Felipe Baldomir
    ('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRqUYkOxEKsZIEosjIxZtdMrLulgCNWzeGc7A&s'), -- 199: Artist: 95: Felipe Baldomir
    ('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSbvemQdUVMQGheI9NwFcz-bfUoo_DKc7CLGg&s'), -- 200: Artist: 96: SPEED
    ('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTCr5bwGjjU-0SVve8WugeShMhX1QnDLzDnsg&s'), -- 201: Artist: 96: SPEED
    ('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTgfF4OhZc8sybHX6MJTlJFNaLwjddhSACgkw&s'), -- 202: Artist: 97: 19-Twenty
    ('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTxLXgJAqpq-1jq-BzLy-86zPMhYH1yDGu5ZA&s'), -- 203: Artist: 97: 19-Twenty
    ('https://focus.independent.ie/thumbor/zETt_CwE0JVueJqq2LPaqUa6mPE=/0x956:2156x2395/960x640/prod-mh-ireland/53b81041-33a9-4550-8ae2-b20e7d324d83/90b917dd-8e21-4de9-9d69-8dbc1fc91515/f0ce0630-2f0c-4363-a025-a7752ebd42dc.jpg'), -- 204: Artist: 98: Gavin James
    ('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRhqlSr_efymnyOqA2p-Iu6cV_2Ro4fcIQ_KA&s'), -- 205: Artist: 98: Gavin James
    ('https://assets-au-01.kc-usercontent.com/a74cc67d-6861-022b-4d6d-57679e9d331f/a12ee9cd-2f30-43e4-8c74-3db060a2b1e2/image.jpeg'), -- 206: Artist: 99: Pete McCredie
    ('https://event-images.tixel.com/cdn-cgi/image/width=600,format=auto/media/images/b00d44d4943ffc22b73c62c0aba68185_1733710964_6703_s.jpg'), -- 207: Artist: 99: Pete McCredie
    ('https://thewoodlands.com.au/wp-content/uploads/2022/10/287825790_108136338602085_5714538711719378942_n.jpg'), -- 208: Artist: 100: No Sleep Till Texas
    ('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSelEFJEVjPEsp9lGlUC5BOHN8U5C4Wtg84tw&s'), -- 209: Artist: 100: No Sleep Till Texas
    (null), -- 210: Artist: 101: Firefly Horns
    (null), -- 211: Artist: 101: Firefly Horns
    ('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSobTgzk-kWP9y58P2hFljn6mDzOW5o-w-26t2grudCviLNmYpRihWU0v8OfC7jDTA4S8U&usqp=CAU'), -- 212: Artist: 102: David McCredie
    ('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQERy6LuZQcovQc7oN0WNJ6CywFFJXvaLNKfw&s'), -- 213: Artist: 102: David McCredie
    ('https://beat.com.au/wp-content/uploads/2024/04/Elly-McK-The-Unbelievers-at-Odessa-at-Levers-min.jpeg'), -- 214: Artist: 103: Elly McK & The Unbelievers
    ('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTclzyouKr9JIYXbyPUSVkYQJ_O0diGvB4gNw&s'), -- 215: Artist: 103: Elly McK & The Unbelievers
    ('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTIuv5uEzSBNkONXsBOKUiuSOZA7ddoAFaGWg&s'), -- 216: Artist: 104: M. WARD
    ('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQzWzFySL2RCFt6pYL903gXF9V1IokEFhNddA&s'), -- 217: Artist: 104: M. WARD
    ('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRNKIreBIkerTy22EaC3HwAB8FeQRUKdgm6aQ&s'), -- 218: Artist: 105: Fleetmac Wood
    ('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQK2BNdmoAc80nx56tDZt-AG6sK6L4vCN4KOA&s'), -- 219: Artist: 105: Fleetmac Wood
    ('https://media.wnyc.org/i/800/0/l/85/2018/08/arkestra.jpg'), -- 220: Artist: 106: Sun Ra Arkestra
    ('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTJuFiqdpJ7HGoXODZYPfQUkbpxN9dg7fA1Jq4I2LQK9i2EfcthYBc7I6F4MggA773yBnM&usqp=CAU'), -- 221: Artist: 106: Sun Ra Arkestra
    ('https:/\newcastlelive.com.au/wp-content/uploads/2022/10/241041_image_311736506_2472766892863780_8122073527528712090_n.jpg'), -- 222: Artist: 107: Chillinit
    ('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcToRyrvSbyF_0DjJm-3GAQC6Jn1K5Ugb43Psw&s'), -- 223: Artist: 107: Chillinit
    ('https://i0.wp.com/www.vintageguitar.com/wp-content/uploads/ROBBEN-BIG-HEADER.jpg?resize=420%2C540'), -- 224: Artist: 108: Robben Ford Band
    ('https://www.arcadalive.com/wp-content/uploads/sites/6/robbenfordpurplehouserecordjuly27201827072018_0201-e1563552928168.jpg'), -- 225: Artist: 108: Robben Ford Band
    ('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTGAsafJecCqJkkp0bIgbPUj4FXtS1WdQi0HA&s'), -- 226: Artist: 109: Darren Kiely
    ('https://yt3.googleusercontent.com/eTGLObyWGShXFc66VbvjREZNX9Xc3mT-d61jiqgnPgtiO1RIBu44_n5xO8Xsytbk2acTyI1SnQ=s900-c-k-c0x00ffffff-no-rj'), -- 227: Artist: 109: Darren Kiely
    ('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSABJXoy9LffraYEDWKR-2WE_p--C2PPSKkWQ&s'), -- 228: Artist: 110: Kofi Stone
    ('https://d2ljoqkkoec4f6.cloudfront.net/wp-content/uploads/2021/09/07152347/ks3-545x750.jpg'), -- 229: Artist: 110: Kofi Stone
    ('https://www.metal-archives.com/images/3/5/4/0/3540497300_photo.jpg?2537'), -- 230: Artist: 20: Sufferance
    ('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcThvsmvvGsHnVLh3sLQ60OZ5JaK-znfFGuVKQqMU_w70lkPcEvsC_it5kT3hEt7X4PaJwk&usqp=CAU'), -- 231: Artist: 20: Sufferance
    (null), -- 232: Artist: 21: ABIGAIL
    (null), -- 233: Artist: 21: ABIGAIL
    ('https://avatar.iran.liara.run/public/34'); -- 234: User Image Matthew

-- VenueImage
INSERT INTO VenueImage (VenueID, ImageID, DisplayOrder) VALUES

    -- The Gasometer
    (1, 1, 1),
    (1, 2, 2),

    -- The Corner Hotel
    (2, 3, 1),

    -- The Tote
    (3, 4, 1),
    (3, 5, 2),

    -- The Retreat Hotel
    (4, 6, 1),
    (4, 7, 2),

    -- Hotel Esplanade
    (5, 8, 1),

    -- The Night Cat
    (6, 9, 1);

-- ArtistImage
INSERT INTO ArtistImage (ArtistID, ImageID, DisplayOrder) VALUES

    -- 1: The Amazing Devil
    (1, 10, 1),
    (1, 11, 2),

    -- 2: Amber Drift
    (2, 12, 1),
    (2, 13, 2),

    -- 3: Gang of Youths
    (3, 14, 1),
    (3, 15, 2),

    -- 4: Tash Sultana
    (4, 16, 1),
    (4, 17, 2),

    -- 5: Courtney Barnett
    (5, 18, 1),
    (5, 19, 2),

    -- 6: King Gizzard & the Lizard Wizard
    (6, 20, 1),
    (6, 21, 2),

    -- 7: The Teskey Brothers
    (7, 22, 1),
    (7, 23, 2),

    -- 8: Vance Joy
    (8, 24, 1),
    (8, 25, 2),

    -- 9: Tame Impala
    (9, 26, 1),
    (9, 27, 2),

    -- 10: The Cat Empire
    (10, 28, 1),
    (10, 29, 2),

    -- 11: The Jungle Giants
    (11, 30, 1),
    (11, 31, 2),

    -- 12: Ball Park Music
    (12, 32, 1),
    (12, 33, 2),

    -- 13: Teether & Kuya Neil
    (13, 34, 1),
    (13, 35, 2),

    -- 14: Dear Matilda
    (14, 36, 1),
    (14, 37, 2),

    -- 15: Tiarnie
    (15, 38, 1),
    (15, 39, 2),

    -- 16: Get Jaxxed
    (16, 40, 1),
    (16, 41, 2),

    -- 17: GBH
    (17, 42, 1),
    (17, 43, 2),

    -- 18: Destruktor
    (18, 44, 1),
    (18, 45, 2),

    -- 19: Voidfall
    (19, 46, 1),
    (19, 47, 2),

    -- 20: Sufferance
    (20, 230, 1),
    (20, 231, 2),

    -- 21: ABIGAIL
    (21, 232, 1),
    (21, 233, 2),

    -- 22: STALKER
    (22, 53, 1),

    -- 23: Austere
    (23, 54, 1),
    (23, 55, 2),

    -- 24: Skuggor
    (24, 56, 1),
    (24, 57, 2),

    -- 25: Paroxysmal Descent
    (25, 58, 1),
    (25, 59, 2),

    -- 26: Rum Jungle
    (26, 60, 1),
    (26, 61, 2),

    -- 27: Letters to Lions
    (27, 62, 1),
    (27, 63, 2),

    -- 28: Underlay
    (28, 64, 1),
    (28, 65, 2),

    -- 29: Winter McQuinn
    (29, 66, 1),
    (29, 67, 2),

    -- 30: Acacia Pip
    (30, 68, 1),
    (30, 69, 2),

    -- 31: Richy Mitch & The Coal Miners
    (31, 70, 1),
    (31, 71, 2),

    -- 32: South Summit
    (32, 72, 1),
    (32, 73, 2),

    -- 33: Kurilpa Reach
    (33, 74, 1),
    (33, 75, 2),

    -- 34: Placebo
    (34, 76, 1),
    (34, 77, 2),

    -- 35: Black Market Music
    (35, 78, 1),
    (35, 79, 2),

    -- 36: Gena Rose Bruce
    (36, 80, 1),
    (36, 81, 2),

    -- 37: Kristen Hersh
    (37, 82, 1),
    (37, 83, 2),

    -- 38: Shihad
    (38, 84, 1),
    (38, 85, 2),

    -- 39: Todd Rundgren
    (39, 86, 1),
    (39, 87, 2),

    -- 40: Queen Omega & The Royal Souls
    (40, 88, 1),
    (40, 89, 2),

    -- 41: Housewife’s Choice
    (41, 90, 1),
    (41, 91, 2),

    -- 42: Troublemekka
    (42, 92, 1),
    (42, 93, 2),

    -- 43: Itations
    (43, 94, 1),
    (43, 95, 2),

    -- 44: DAILY J
    (44, 96, 1),
    (44, 97, 2),

    -- 45: Faceless Burial
    (45, 98, 1),
    (45, 99, 2),

    -- 46: Gutless
    (46, 100, 1),
    (46, 101, 2),

    -- 47: Pestilential Shadows
    (47, 102, 1),
    (47, 103, 2),

    -- 48: Werewolves
    (48, 104, 1),
    (48, 105, 2),

    -- 49: Pizza Death
    (49, 106, 1),
    (49, 107, 2),

    -- 50: Munitions
    (50, 108, 1),
    (50, 109, 2),

    -- 51: Vexation
    (51, 110, 1),
    (51, 111, 2),

    -- 52: Midnight Odyssey
    (52, 112, 1),
    (52, 113, 2),

    -- 53: Goat Shaman
    (53, 114, 1),
    (53, 115, 2),

    -- 54: Redferrin
    (54, 116, 1),
    (54, 117, 2),

    -- 55: CERES
    (55, 118, 1),
    (55, 119, 2),

    -- 56: Great Gable
    (56, 120, 1),
    (56, 121, 2),

    -- 57: Amble
    (57, 122, 1),
    (57, 123, 2),

    -- 58: Barry Adamson
    (58, 124, 1),
    (58, 125, 2),

    -- 59: The Wreckery
    (59, 126, 1),
    (59, 127, 2),

    -- 60: The Beths
    (60, 128, 1),
    (60, 129, 2),

    -- 61: Plastic Section
    (61, 130, 1),
    (61, 131, 2),

    -- 62: The Earthquakes
    (62, 132, 1),
    (62, 133, 2),

    -- 63: Fever Shack
    (63, 134, 1),
    (63, 135, 2),

    -- 64: No Way Out
    (64, 136, 1),
    (64, 137, 2),

    -- 65: Heat
    (65, 138, 1),
    (65, 139, 2),

    -- 66: Judged By 12
    (66, 140, 1),
    (66, 141, 2),

    -- 67: Timepeace
    (67, 142, 1),
    (67, 143, 2),

    -- 68: Wet Kiss
    (68, 144, 1),
    (68, 145, 2),

    -- 69: The 5.6.7.8's
    (69, 146, 1),
    (69, 147, 2),

    -- 70: Clay J Gladstone
    (70, 148, 1),
    (70, 149, 2),

    -- 71: Delivery
    (71, 150, 1),
    (71, 151, 2),

    -- 72: DEIPHAGO
    (72, 152, 1),
    (72, 153, 2),

    -- 73: Void Christ
    (73, 154, 1),
    (73, 155, 2),

    -- 74: Gutalax
    (74, 156, 1),
    (74, 157, 2),

    -- 75: Lachlan Denton
    (75, 158, 1),
    (75, 159, 2),

    -- 76: Brian El Dorado and The Tuesday People
    (76, 160, 1),
    (76, 161, 2),

    -- 77: Zevon Lee
    (77, 162, 1),
    (77, 163, 2),

    -- 78: Nitida Atkinson
    (78, 164, 1),
    (78, 165, 2),

    -- 79: Austin Mackay
    (79, 166, 1),
    (79, 167, 2),

    -- 80: Quality Used Cars
    (80, 168, 1),
    (80, 169, 2),

    -- 81: LARGE MIRAGE
    (81, 170, 1),
    (81, 171, 2),

    -- 82: HOLiDAY MYSTICS
    (82, 172, 1),
    (82, 173, 2),

    -- 83: Ramona Sky
    (83, 174, 1),
    (83, 175, 2),

    -- 84: Gwyn Ashton
    (84, 176, 1),
    (84, 177, 2),

    -- 85: Gavin Bowles & The Distractions
    (85, 178, 1),
    (85, 179, 2),

    -- 86: Terra Rouge
    (86, 180, 1),
    (86, 181, 2),

    -- 87: Incident Response Select All
    (87, 182, 1),
    (87, 183, 2),

    -- 88: B-sides
    (88, 184, 1),
    (88, 185, 2),

    -- 89: FELONY.
    (89, 186, 1),
    (89, 187, 2),

    -- 90: Grassy Strings
    (90, 188, 1),
    (90, 189, 2),

    -- 91: The Pheasantry Band
    (91, 190, 1),
    (91, 191, 2),

    -- 92: Ashley Naylor
    (92, 192, 1),
    (92, 193, 2),

    -- 93: Kathleen Halloran
    (93, 194, 1),
    (93, 195, 2),

    -- 94: VOXNEON
    (94, 196, 1),
    (94, 197, 2),

    -- 95: Felipe Baldomir
    (95, 198, 1),
    (95, 199, 2),

    -- 96: SPEED
    (96, 200, 1),
    (96, 201, 2),

    -- 97: 19-Twenty
    (97, 202, 1),
    (97, 203, 2),

    -- 98: Gavin James
    (98, 204, 1),
    (98, 205, 2),

    -- 99: Pete McCredie
    (99, 206, 1),
    (99, 207, 2),

    -- 100: No Sleep Till Texas
    (100, 208, 1),
    (100, 209, 2),

    -- 101: Firefly Horns
    (101, 210, 1),
    (101, 211, 2),

    -- 102: David McCredie
    (102, 212, 1),
    (102, 213, 2),

    -- 103: Elly McK & The Unbelievers
    (103, 214, 1),
    (103, 215, 2),

    -- 104: M. WARD
    (104, 216, 1),
    (104, 217, 2),

    -- 105: Fleetmac Wood
    (105, 218, 1),
    (105, 219, 2),

    -- 106: Sun Ra Arkestra
    (106, 220, 1),
    (106, 221, 2),

    -- 107: Chillinit
    (107, 222, 1),
    (107, 223, 2),

    -- 108: Robben Ford Band
    (108, 224, 1),
    (108, 225, 2),

    -- 109: Darren Kiely
    (109, 226, 1),
    (109, 227, 2),

    -- 110: Kofi Stone
    (110, 228, 1),
    (110, 229, 2);






-- UserImage
INSERT INTO UserImage (UserID, ImageID) VALUES

    -- User 1
    (1, 234);

-- EventImage
INSERT INTO EventImage (EventID, ImageID, DisplayOrder) VALUES

    -- Event 1
    (1, 28, 1),

    -- Event 2
    (2, 29, 1),

    -- Event 3
    (3, 30, 1),

    -- Event 4
    (4, 31, 1),

    -- Event 5
    (5, 32, 1),

    -- Event 6
    (6, 33, 1),

    -- Event 7
    (7, 34, 1),

    -- Event 8
    (8, 35, 1),

    -- Event 9
    (9, 36, 1),

    -- Event 10
    (10, 37, 1),
    (10, 38, 2),

    -- Event 11
    (11, 39, 1),

    -- Event 12
    (12, 40, 1),

    -- Event 13
    (13, 41, 1),

    -- Event 14
    (14, 42, 1),

    -- Event 15
    (15, 43, 1),

    -- Event 16
    (16, 44, 1),

    -- Event 17
    (17, 45, 1),

    -- Event 18
    (18, 46, 1),

    -- Event 19 (No Images)

    -- Event 20
    (20, 47, 1),
    (20, 48, 2);

-- Banner
INSERT INTO Banner (BannerID, ImageID, FocusType, FocusID) VALUES
    (1, 48, 'event', 2),
    (2, 49, 'event', 4),
    (3, 50, 'venue', 2),
    (4, 51, 'artist', 1),
    (4, 52, 'artist', 1);





