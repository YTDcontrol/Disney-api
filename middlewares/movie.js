const db = require("../db/database");
const {
    QueryTypes
} = require("sequelize");


exports.validateMovieScore = (req, res, next) => {
    const {
        score
    } = req.body;

    if ( score <= 5 && score > 0 ) {
        next();
    } else {
        res.status(422).json({
            success: false,
            error: "Score expected must be 1 to 5"
        });
    }
};


exports.movieBody = (req, res, next) => {
    const {
        movieImage,
        name,
        releaseDate,
        score,
        cast
    } = req.body;

    if (movieImage && name && releaseDate && score && cast) {
        next();
    } else {    
        res.status(422).json({
            success: false,
            error: "Body request with errors",
            schemaExample: {
                "movieImage": "https://static.wikia.nocookie.net/disney/images/4/4d/Maleficent_poster.png/revision/latest/scale-to-width-down/420?cb=20140514145417&path-prefix=es",
                "name": "Maléfica",
                "releaseDate": "2012-06-18 15:53:14",
                "score": 5,
                "cast": 6
            }
        });
    }
};


exports.movieTitleExists = (req, res, next) => {
    const {
        name
    } = req.body;

    db.query('SELECT * FROM movies WHERE name = ?', {
        type: QueryTypes.SELECT,
        replacements: [name]
    })
        .then(result => {
            const name = result[0];

            if (name) {
                res.status(409).json({
                    success: false,
                    error: "Movie name already exists"
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


exports.validateMovieId = (req, res, next) => {
    const { movieId } = req.params;

    db.query('SELECT * FROM movies WHERE movie_id = ?', {
        type: QueryTypes.SELECT,
        replacements: [movieId]
    })
        .then(result => {
            const movie = result[0];

            if (!movie) {
                res.status(409).json({
                    success: false,
                    error: "The movie required by id doesn't exist"
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














