const { QueryTypes } = require('sequelize');
const db = require('../db/database');


// GET CHARACTERS (LIST OF CHARACTERS WITH IMAGE AND NAME)  
exports.getCharacters = (req, res) => {
    db.query('SELECT charImage, name FROM characters', {
        type: QueryTypes.SELECT
    })
        .then(characters => res.json(characters))
        .catch(error => res.status(500).json({
            error: "Server Internal Error",
            success: false
        }));
};


// CHARACTER DETAIL
exports.getCharacterDetail = async (req, res) => {
    let id = req.params.characterId;
    console.log(req.params);

    let characterDetail = await db.query('SELECT * FROM characters WHERE character_id = ?', {
        type: QueryTypes.SELECT,
        replacements: [id]
    })
    let characterMovies = await db.query('SELECT mo.name,mo.movieImage FROM cast AS ca, movies AS mo WHERE ca.character_id = ? AND ca.movie_id = mo.movie_id ', {
        type: QueryTypes.SELECT,
        replacements: [id]
    })
    res.json({ characterDetail, characterMovies })
}

// SEARCH CHARACTERS BY NAME, FILTER BY AGE, WEIGHT AND MOVIE
exports.searchCharacters = async (req, res) => {
    let name = req.query.name;
    let age = req.query.age;
    let weight = req.query.weight;
    let movie = req.query.movie;

    console.log(name);
    let rename = '%'+name+'%'
    if (req.query.name) {
        let response = await db.query('SELECT * FROM characters WHERE name LIKE ?', {
            type: QueryTypes.SELECT,
            replacements: [rename]
        })
        res.json({response})
    }

    //AGE
    let searchByAge = age
    if (req.query.age) {
        let response = await db.query('SELECT * FROM characters WHERE age LIKE ?', {
            type: QueryTypes.SELECT,
            replacements: [searchByAge]
        })
        res.json({response})
    }

    //WEIGHT
    let searchByWeight = weight
    if (req.query.weight) {
        let response = await db.query('SELECT * FROM characters WHERE weight LIKE ?', {
            type: QueryTypes.SELECT,
            replacements: [searchByWeight]
        })
        res.json({response})
    }

    //MOVIES
    let searchByMovie = movie
    if (req.query.movie) {
        let response = await db.query('SELECT mo.name, ch.name FROM movies AS mo, characters AS ch, cast AS ca WHERE ca.movie_id = ? AND ca.movie_id = mo.movie_id AND ch.character_id = ca.character_id', {
            type: QueryTypes.SELECT,
            replacements: [searchByMovie]
        })
        res.json({response})
    }

}


// CREATE CHARACTER
exports.addNewCharacter = (req, res) => {
    const character = req.body;
    const { charImage, name, age, weight, history } = req.body;

    db.query('INSERT INTO characters (charImage, name, age, weight, history) VALUES (?, ?, ?, ? ,?)', {
        type: QueryTypes.INSERT,
        replacements: [charImage, name, age, weight, history]
    })
        .then(() => {
            res.status(201).json({
                success: true,

                msg: "Character Created Succesfully",
                character: character
            });
        })
        .catch(err => {
            res.status(500).json({
                success: false,
                error: 'Server internal error'
            });
        });
};


// GET CHARACTER BY ID
exports.getCharacterById = (req, res) => {
    const { characterId } = req.params;
   

    db.query('SELECT * FROM characters WHERE character_id = ?', {
        type: QueryTypes.SELECT,
        replacements: [characterId]
    })
        .then(characters => res.json(characters[0]))
        .catch(error => res.status(500).json({
            error: "Server Internal Error",
            success: false
        }));
};


// EDIT CHARACTER
exports.editCharacterById = (req, res) => {
    const character = req.body;
    const { characterId } = req.params;
    const {
        charImage,
        name,
        age,
        weight,
        history
    } = req.body;

    db.query('UPDATE characters SET charImage = ?, name = ?, age = ?, weight = ?, history = ? WHERE character_id = ?', {
        type: QueryTypes.UPDATE,
        replacements: [charImage, name, age, weight, history, characterId]
    })
        .then(() => {
            res.status(200).json({
                success: true,
                msg: "Character Updated Succesfully",
                character: character
            });
        })
        .catch(err => {
            res.status(500).json({
                success: false,
                error: 'Server internal error'
            });
        });
}


// DELETE CHARACTER 
exports.deleteCharacterById = (req, res) => {
    const {
        characterId
    } = req.params;

    db.query('DELETE FROM characters WHERE character_id = ?', {
        type: QueryTypes.DELETE,
        replacements: [characterId]
    })
        .then(characters => res.json({
            success: true,
            msg: "Character Deleted Successfully"
        }))
        .catch(error => res.status(500).json({
            error: "Server Internal Error",
            success: false
        }));
};