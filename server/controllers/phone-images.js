// Load required packages
var Q=require('q');
var _ = require('lodash');
var phoneImages = require('../models/phone-images');

// Create endpoint /api/phones for GET all
exports.getImagesPhone= function(req, res) {
  // Use the Phones model to find all phones
  phoneImages.find({id_phone:req.params.id_phone}, function(err, images) {
    if (err) res.send(err);
	
    res.json(images);    
  });
};

// Create endpoint /api/phones/:id for GET
exports.getImagePhone= function(req, res) {
  // Use the Phones model to find all phones
  phoneImages.find(req.params.id, function(err, images) {
    if (err) res.send(err);
	
    res.json(images);    
  });
};

// Create endpoint /api/phones for POST
exports.postImagePhone = function(req, res) {
    // Set the Phone properties that came from the POST data
    var image = {};
	
	for(var item in req.body){
		image[item]=req.body[item];
	}
    
  // Save the campain and check for errors
  phones.save(image,function(err,data) {
    if (err)
      res.send(err);

    res.json({ success:true, data: data });
  });
};


// Create endpoint /api/phones for PUT
exports.putImagePhone = function(req, res) {
    // Set the Phone properties that came from the PUT data
    var image = {};
	
	for(var item in req.body){
		image[item]=req.body[item];
	}
	
  phones.update(image, function(err, data) {
    if (err) res.send(err);

	res.json({ success:true, data: image });
  });
};

// Create endpoint /api/phones/:id for DELETE
exports.deleteImagePhone = function(req, res) {
  phones.remove({ id: req.params.id}, function(err) {
    if (err)
      res.send(err);

    res.json({ success:true,data:{id_phone:req.params.id} });
  });
};