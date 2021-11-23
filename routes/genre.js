const router = require('express').Router();

const genreController = require('../controllers/genre');
const {
    validateAccessToken,
    validateAdmin
} = require('../middlewares/authorization');
const {
    genreBody,
    genreNameExists,
    validateGenreId
} = require('../middlewares/genre');

router.get('/', validateAccessToken, genreController.getGenre);
router.post('/', [validateAccessToken, validateAdmin, genreBody, genreNameExists], genreController.addNewGenre);
router.get('/:genreId', [validateAccessToken, validateGenreId], genreController.getGenreById);
router.put('/:genreId', [validateAccessToken, validateAdmin, genreBody, validateGenreId], genreController.editGenreById);
router.delete('/:genreId', [validateAccessToken, validateAdmin, validateGenreId], genreController.deleteGenreById);


module.exports = router;