const {Router} = require('express');
const controller = require('./products_controller');
const router = Router();

router.get('/', controller.getProducts);
router.post('/addProduct', controller.postProduct);

module.exports = router;