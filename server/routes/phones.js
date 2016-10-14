// Load required packages
var express = require('express');

var phonesController = require('../controllers/phones');

// Create our Express router
var router = express.Router();

// route middleware to ensure user is logged in
function isLoggedIn(req, res, next) {
	//if (req.isAuthenticated())
		return next();

	res.redirect('/');
}

// Create endpoint handlers for /campaigns
router.route('/phones')
  .get(isLoggedIn, phonesController.getPhones)
  .post(isLoggedIn, phonesController.postPhone)
  .put(isLoggedIn, phonesController.putPhone)
  
  
  router.route('/phones/:id')
  .get(isLoggedIn, phonesController.getPhone)
  .delete(isLoggedIn, phonesController.deletePhone)
  
module.exports = router;