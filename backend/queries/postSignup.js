const postSignup = `
    INSERT INTO User (FirstName, LastName, Email, Password, Country, State)
    VALUES (?, ?, ?, ?, ?, ?);
`;

const postSignupImage = `
    INSERT INTO UserImage (UserID, ImageID)
    VALUES (?, 254);
`

module.exports = { postSignup, postSignupImage };