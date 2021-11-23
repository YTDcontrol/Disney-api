const router = require('express').Router();

const userController = require('../controllers/user');

const { validateMailUsername,
    registerBody,
    loginBody,
    validateUserId,
    userIdExists,
    userBody } = require('../middlewares/user');
    
const {
    validateAccessToken,
    validateAdmin
} = require('../middlewares/authorization');


router.get('/', [validateAccessToken, validateAdmin], userController.getAllUsers);
router.post('/login', [loginBody], userController.login);
router.post('/register', [validateMailUsername, registerBody], userController.register);
router.get('/:userId', [validateAccessToken, userIdExists, validateUserId], userController.getUserById);
router.put('/:userId', [validateAccessToken, userIdExists, validateUserId, userBody], userController.editUserById);
router.delete('/:userId', [validateAccessToken, validateAdmin, userIdExists], userController.deleteUserById);

module.exports = router;