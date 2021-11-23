const db = require("../db/database");
const {
    QueryTypes
} = require("sequelize");


exports.genreBody = (req, res, next) => {
    const {
        name,
        image,
        movies
    } = req.body;

    if (name && image && movies) {
        next();
    } else {
        res.status(422).json({
            success: false,
            error: "Body request with errors",
            schemaExample: {
                "name": "Comedy",
                "image": "http://4.bp.blogspot.com/-XEHYtJG5N0g/VzjF9ixL3eI/AAAAAAAAADU/PBp8toOHtUQ6Kge9UsGyaJxwVJPAb5wGQCK4B/s1600/comedia.jpg",
                "movies": 5 
            }
        });
    }
};


exports.genreNameExists = (req, res, next) => {
    const {
        name
    } = req.body;

    db.query('SELECT * FROM genre WHERE name = ?', {
        type: QueryTypes.SELECT,
        replacements: [name]
    })
        .then(result => {
            const genre = result[0];

            if (genre) {
                res.status(409).json({
                    success: false,
                    error: "Genre name already exists"
                });
            } else {
                next();
            }
        })
        .catch(err => {
            console.log(err);
            res.status(500).json({
                success: false,
                error: 'Server internal error'
            });
        });
};


exports.validateGenreId = (req, res, next) => {
    const { genreId } = req.params;

    db.query('SELECT * FROM genre WHERE genre_id = ?', {
        type: QueryTypes.SELECT,
        replacements: [genreId]
    })
        .then(result => {
            const genre = result[0];

            if (!genre) {
                res.status(409).json({
                    success: false,
                    error: "Genre required doesn't exist"
                });
            } else {
                next();
            }
        })
        .catch(err => {
            console.log(err);
            res.status(500).json({
                success: false,
                error: 'Server internal error'
            });
        });
};
