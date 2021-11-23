const db = require('../db/database');
const {
    QueryTypes
} = require('sequelize');


// GET all movies filtered or sorted by release date
exports.getMovies = async (req, res) => {

    const { name, genre, order } = req.query;

    if (!name && !genre && !order) {
        db.query('SELECT movieImage, name, releaseDate FROM movies', {
            type: QueryTypes.SELECT
        })
            .then(movies => res.json(movies))
            .catch(error => res.status(500).json({
                error: "Server Internal Error",
                success: false
            }));
    }

    // Filtered by name
    if (name) {
        const movieTittle = '%' + name + '%'
        let response = await db.query('SELECT movieImage, name, releaseDate FROM movies WHERE name LIKE ?', {
            type: QueryTypes.SELECT,
            replacements: [movieTittle]
        })
        res.json({ response })
    }


    // Filtered by genre
    if (genre) {
        let response = await db.query('SELECT movieImage, name, releaseDate FROM movies AS mo, genre_movie AS gm WHERE gm.genre_id = ? AND gm.movie_id = mo.movie_id', {
            type: QueryTypes.SELECT,
            replacements: [genre]
        })
        res.json({ response })
    }


    // Sort by release date 
    if ((order == 'ASC')||(order == 'DESC')) {
        let response = await db.query(`SELECT movieImage, name, releaseDate FROM movies ORDER BY releaseDate ${order}`, {
            type: QueryTypes.SELECT
        })
        res.json({ response })
    } else {
        let response = await db.query(`SELECT movieImage, name, releaseDate FROM movies ORDER BY releaseDate ASC`, {
            type: QueryTypes.SELECT
        })
        res.json({ response })
    }
};


// GET movie detail
exports.getMovieDetail = async (req, res) => {
    let id = req.params.movieId;
    console.log(req.params);

    let movieDetail = await db.query('SELECT * FROM movies WHERE movie_id = ?', {
        type: QueryTypes.SELECT,
        replacements: [id]
    })
    let movieCharacters = await db.query('SELECT ch.name,ch.charImage FROM cast AS ca, characters AS ch WHERE ca.movie_id = ? AND ca.character_id = ch.character_id', {
        type: QueryTypes.SELECT,
        replacements: [id]
    })
    res.json({ movieDetail, movieCharacters })
}


// Record movie
exports.addNewMovie = (req, res) => {
    const movie = req.body;
    const { movieImage, name, releaseDate, score, cast } = req.body;

    db.query('INSERT INTO movies (movieImage, name, releaseDate, score, cast) VALUES (?, ?, ? ,? ,?)', {
        type: QueryTypes.INSERT,
        replacements: [movieImage, name, releaseDate, score, cast]
    })
        .then(() => {
            res.status(201).json({
                success: true,
                msg: "Movie Created Successfully",
                movie: movie
            });
        })
        .catch(err => {
            res.status(500).json({
                success: false,
                error: 'Server internal error'
            });
        });
};


// GET movie by Id
exports.getMovieById = (req, res) => {
    const { movieId } = req.params;

    db.query('SELECT * FROM movies WHERE movie_id = ?', {
        type: QueryTypes.SELECT,
        replacements: [movieId]
    })
        .then(movies => res.json(movies[0]))
        .catch(error => res.status(500).json({
            error: "Server Internal Error",
            success: false
        }));
};


// Edit movie
exports.editMovieById = (req, res) => {
    const movie = req.body;
    const { movieId } = req.params;
    const {
        movieImage,
        name,
        releaseDate,
        score,
        cast
    } = req.body;

    db.query('UPDATE movies SET movieImage = ?, name = ?, releaseDate = ?, score = ?, cast = ? WHERE movie_id = ?', {
        type: QueryTypes.UPDATE,
        replacements: [movieImage, name, releaseDate, score, cast, movieId]
    })
        .then(() => {
            res.status(200).json({
                success: true,
                msg: "Movie Updated Successfully",
                movie: movie
            });
        })
        .catch(err => {
            res.status(500).json({
                success: false,
                error: 'Server internal error'
            });
        });
}


// Delete movie 
exports.deleteMovieById = (req, res) => {
    const {
        movieId
    } = req.params;

    db.query('DELETE FROM movies WHERE movie_id = ?', {
        type: QueryTypes.DELETE,
        replacements: [movieId]
    })
        .then(movies => res.json({
            success: true,
            msg: "Movie Deleted successfully"
        }))
        .catch(error => res.status(500).json({
            error: "Server Internal Error",
            success: false
        }));
};
























