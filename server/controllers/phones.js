// Load required packages
var Q=require('q');
var phones = require('../models/phones');
var phoneImages = require('../models/phone-images');

// Create endpoint /api/phones for GET all
exports.getPhones= function(req, res) {
  // Use the Phones model to find all phones
    
  phones.find({}, function(err, phones) {
    
    if (err) res.send(err);
	
    res.json(phones);
	      
  });
};

// Create endpoint /api/phones/:id for GET
exports.getPhone = function(req, res) {
  // Use the Phones model to find a specific phone
  phones.findById(req.params.id, function(err, phone) {
    if (err) res.send(err);

		phoneImages.find({id_phone:phone.id}, function(err, images) {
			if (err) res.send(err);
			
			phone.images=images;
			res.json(phone);
			  
		  })
  });
};

// Create endpoint /api/phones for POST
exports.postPhone = function(req, res) {
    // Set the Phone properties that came from the POST data
      var phone = {};
	
	for(var item in req.body){
		if(item!='images'){
			phone[item]=req.body[item];
		}
	}
    
  // Save the campain and check for errors
  phones.save(phone,function(err,data) {
    if (err)
      res.send(err);

    res.json({ success:true, data: data });
  });
};

// Create endpoint /api/phones for PUT
exports.putPhone = function(req, res) {
    // Set the Phone properties that came from the PUT data
    var phone = {};
	
	for(var item in req.body){
		if(item!='images'){
			phone[item]=req.body[item];
		}
	}
	
  phones.update(phone, function(err, data) {
    if (err) res.send(err);

	res.json({ success:true, data: phone });
  });
};

// Create endpoint /api/phones/:id for DELETE
exports.deletePhone = function(req, res) {
  phones.remove({ id: req.params.id}, function(err) {
    if (err)
      res.send(err);

    res.json({ success:true,data:{id_phone:req.params.id} });
  });
};