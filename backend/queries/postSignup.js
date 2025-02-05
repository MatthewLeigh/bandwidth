const postSignup = `
    INSERT INTO User (FirstName, LastName, Email, Password, Country, State)
    VALUES (?, ?, ?, ?, ?, ?) RETURNING UserID;
`;

const postSignupImage = `
    INSERT INTO UserImage (UserID, ImageID)
    VALUES (?, 254);
`

module.exports = { postSignup, postSignupImage };