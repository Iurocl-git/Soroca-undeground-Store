const {Router} = require('express');
const controller = require('./users_controller');
const router = Router();

router.get('/', controller.getUsers);
router.get('/:username', controller.getUserInformationByUsername);
router.get('/:username/games', controller.getUserGames);

module.exports = router;