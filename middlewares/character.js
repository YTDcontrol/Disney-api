const db = require("../db/database");
const {
    QueryTypes
} = require("sequelize");


exports.characterBody = (req, res, next) => {
    const {
        charImage,
        name,
        age,
        weight,
        history
    } = req.body;

    if (charImage && name && age && weight && history) {
        next();
    } else {
        res.status(422).json({
            success: false,
            error: "Body request with errors",
            schemaExample: {
                "charImage": "https://static.wikia.nocookie.net/disney/images/e/ef/Sulley.png/revision/latest/scale-to-width-down/259?cb=20130302192551&path-prefix=es",
                "name": "James P. Sullivan",
                "age": 63,
                "weight": 140,
                "history": "Es un monstruo que habita Monstruópolis, igual que todos los otros monstruos existentes. Tiene más de dos metros de altura y el pelo azul con manchas moradas, y es el que posee el récord como asustador de niños."
            }
        });
    }
};


exports.characterNameExists = (req, res, next) => {
    const {
        name
    } = req.body;

    db.query('SELECT * FROM characters WHERE name = ?', {
        type: QueryTypes.SELECT,
        replacements: [name]
    })
        .then(result => {
            const character = result[0];

            if (character) {
                res.status(409).json({
                    success: false,
                    error: "Character name already exists"
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


exports.validateCharacterId = (req, res, next) => {
    const { characterId } = req.params;

    console.log('getCharacterById');

    db.query('SELECT * FROM characters WHERE character_id = ?', {
        type: QueryTypes.SELECT,
        replacements: [characterId]
    })
        .then(result => {
            const character = result[0];

            if (!character) {
                res.status(409).json({
                    success: false,
                    error: "Character required doesn't exist"
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
