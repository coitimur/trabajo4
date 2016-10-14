// Load required packages
var express = require('express');

var phonesImagesController = require('../controllers/phone-images');

// Create our Express router
var router = express.Router();

// route middleware to ensure user is logged in
function isLoggedIn(req, res, next) {
	//if (req.isAuthenticated())
		return next();

	res.redirect('/');
}

// Create endpoint handlers for /campaigns
router.route('/phone-images')
  .get(isLoggedIn, phonesImagesController.getImagesPhone)
  .post(isLoggedIn, phonesImagesController.postImagePhone)
  .put(isLoggedIn, phonesImagesController.putImagePhone)
  
  
  router.route('/phone-images/:id')
  .get(isLoggedIn, phonesImagesController.getImagePhone)
  .delete(isLoggedIn, phonesImagesController.deleteImagePhone)
  
module.exports = router;