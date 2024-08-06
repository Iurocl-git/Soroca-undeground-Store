const {Router} = require('express');
const controller = require('./ads_controller');
const router = Router();

router.get('/', controller.getAds);

module.exports = router;