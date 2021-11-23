const router = require('express').Router();

const characterController = require('../controllers/character');

const {
    validateAccessToken,
    validateAdmin,
} = require('../middlewares/authorization');

const {
    characterBody,
    characterNameExists,
    validateCharacterId
} = require('../middlewares/character');

router.get('/', validateAccessToken, characterController.getCharacters);
router.post('/', [validateAccessToken, validateAdmin, characterBody, characterNameExists], characterController.addNewCharacter);

router.get('/characters/:characterId', [validateAccessToken, validateCharacterId], characterController.getCharacterDetail);

router.get('/characters', [validateAccessToken], characterController.searchCharacters);
router.put('/:characterId', [validateAccessToken, validateAdmin, characterBody, validateCharacterId], characterController.editCharacterById);
router.delete('/:characterId', [validateAccessToken, validateAdmin, validateCharacterId], characterController.deleteCharacterById);

router.get('/:characterId', [validateAccessToken, validateCharacterId], characterController.getCharacterById);

module.exports = router;