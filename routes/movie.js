const router = require('express').Router();

const movieController = require('../controllers/movie');

const {
    validateAccessToken,
    validateAdmin
} = require('../middlewares/authorization');

const {
    validateMovieScore,
    movieBody,
    movieTitleExists,
    validateMovieId
} = require('../middlewares/movie');

router.get('/', validateAccessToken, movieController.getMovies);
router.post('/', [validateAccessToken, validateAdmin, validateMovieScore, movieBody, movieTitleExists], movieController.addNewMovie);

router.get('/movieDetail/:movieId', [validateAccessToken, validateMovieId], movieController.getMovieDetail);

router.put('/:movieId', [validateAccessToken, validateAdmin, validateMovieScore, movieBody, validateMovieId], movieController.editMovieById);
router.delete('/:movieId', [validateAccessToken, validateAdmin, validateMovieId], movieController.deleteMovieById);

router.get('/:movieId', [validateAccessToken, validateMovieId], movieController.getMovieById);

module.exports = router;