const { QueryTypes } = require('sequelize');
const db = require('../db/database');


// GET ALL GENRE
exports.getGenre = (req, res) => {
    db.query('SELECT * FROM genre', {
            type: QueryTypes.SELECT
        })
        .then(genre => res.json(genre))
        .catch(error => res.status(500).json({
            error: "Server Internal Error",
            success: false
        }));
};


// CREATE GENRE
exports.addNewGenre = (req, res) => {
    const genre = req.body;
    const { name, image, movies } = req.body;

    db.query('INSERT INTO genre ( name, image, movies ) VALUES (? ,? ,?)', {
        type: QueryTypes.INSERT,
        replacements: [name, image, movies]
    })
        .then(() => {
            res.status(201).json({
                success: true,
                msg: "Genre Created Successfully",
                genre: genre
            });
        })
        .catch(err => {
            res.status(500).json({
                success: false,
                error: 'Server internal error'
            });
        });
};


// GET GENRE BY ID
exports.getGenreById = (req, res) => {
    const { genreId } = req.params;

    db.query('SELECT * FROM genre WHERE genre_id = ?', {
        type: QueryTypes.SELECT,
        replacements: [genreId]
    })
        .then(genre => res.json(genre[0]))
        .catch(error => res.status(500).json({
            error: "Server Internal Error",
            success: false
        }));
};


// EDIT GENRE
exports.editGenreById = (req, res) => {
    const genre = req.body;
    const { genreId } = req.params;
    const {
        name,
        image,
        movies
    } = req.body;

    db.query('UPDATE genre SET name = ?, image = ?, movies = ? WHERE genre_id = ?', {
        type: QueryTypes.UPDATE,
        replacements: [ name, image, movies, genreId]
    })
        .then(() => {
            res.status(200).json({
                success: true,
                msg: "Genre Updated Successfully",
                genre: genre
            });
        })
        .catch(err => {
            res.status(500).json({
                success: false,
                error: 'Server internal error'
            });
        });
}


// DELETE GENRE
exports.deleteGenreById = (req, res) => {
    const {
        genreId
    } = req.params;

    db.query('DELETE FROM genre WHERE genre_id = ?', {
        type: QueryTypes.DELETE,
        replacements: [genreId]
    })
        .then(genre => res.json({
            success: true,
            msg: "Genre Deleted Successfully"
        }))
        .catch(error => res.status(500).json({
            error: "Server Internal Error",
            success: false
        }));
};