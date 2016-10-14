// Load required packages
var _ = require('lodash');
var pg = require('pg');
var db = require('../config/db');

pg.defaults.ssl = false;

exports.find=function(filters,res){
   pg.connect(db.connect_options, function(err, client,done) {
        var handleError = function(err) {
          // no error occurred, continue with the request
          if(!err) {
            return false;
          }
          if(client){ //
            done(client);//remove client from pool
          }
          console.log('An error occurred err:'+err);
          return true;
        };

        // handle an error from the connection
        if(handleError(err)) {
            res(err,null);
        }
        
        //make sql where clausule
        var sWhere='';
        var i=0;
        var aValues=[];
        for(var p in filters){
            i++;
            if(sWhere==''){
                sWhere=p+'=$'+i;
            }else{
                sWhere= 'AND ' +p+'=$'+i;
            }
            aValues.push(filters[p]);
        }
        
        if(sWhere!='') sWhere = ' WHERE '+sWhere;
        client.query('SELECT id,name,description,images FROM webshop.phones'+sWhere, aValues, function(err, result) {
              // handle an error from the query
              if(handleError(err)) {
                    res(err,null);
              }else if(typeof result=='undefined'){
                res(null,false);
             }else{
                res(null,result.rows);
             }
             done();//to release the client back to the pool
        });
    
    });  
}



exports.findById=function(id,res){
    //Connect to database postgresql
    pg.connect(db.connect_options, function(err, client,done) {
        var handleError = function(err) {
          // no error occurred, continue with the request
          if(!err) {
            return false;
          }
          if(client){ //
            done(client);//remove client from pool
          }
          console.log('An error occurred');
          return true;
        };

        // handle an error from the connection
        if(handleError(err)) {
            console.log('models-->handleError=true');
            res(err,null);
        }
        client.query('SELECT * FROM webshop.phones WHERE id=$1', [id], function(err, result) {
           // handle an error from the query
              if(handleError(err)) {
                    res(err,null);
                    
              }else if(typeof result=='undefined'){
                res(null,false);
             }else{
                res(null,result.rows[0]);
             }
              done();//to release the client back to the pool
        });
    });
}

exports.save=function(oItem,res){
    var item = _.clone(oItem);
    //Connect to database postgresql
    pg.connect(db.connect_options, function(err, client,done) {
        var handleError = function(err) {
          // no error occurred, continue with the request
          if(!err) {
            return false;
          }
          if(client){ //
            done(client);//remove client from pool
          }
          console.log('An error occurred');
          return true;
        };

        // handle an error from the connection
        if(handleError(err)) {
            console.log('models-->handleError=true');
            res(err,null);
        }
        
        var sFields='';
        var sFieldsSubt='';

        var i=0;
        var aValues=[];
        
        delete item.id;
        
        for(var p in item){
            i++;
            if(sFields==''){
                sFields=p;
                sFieldsSubt='$'+i;
            }else{
                sFields+= ' ,' +p;
                sFieldsSubt+=' ,$'+i;
            }
            aValues.push(item[p]);
        }
        
        client.query('INSERT INTO webshop.phones ('+ sFields+') VALUES('+sFieldsSubt+') RETURNING id', aValues, function(err, result) {
           // handle an error from the query
          if(handleError(err)) res(err,null);
          
          res(null,result.rows[0]);
          done();//to release the client back to the pool
        });
      
    });

}

exports.update=function(oItem,res){
    var item = _.clone(oItem);
    //Connect to database postgresql
   pg.connect(db.connect_options, function(err, client,done) {
        var handleError = function(err) {
          // no error occurred, continue with the request
          if(!err) {
            return false;
          }
          if(client){ //
            done(client);//remove client from pool
          }
          console.log('An error occurred');
          return true;
        };

        // handle an error from the connection
        if(handleError(err)) {
            res(err,null);
        }
        
        var sFields='';
        var sFieldsSubt='';

        var i=1;
        var aValues=[];
        
        //atribute id first value for substition params
        aValues.push(item['id']);
        delete item.id;
        
        for(var p in item){
            i++;
            if(sFields==''){
                sFields=p+'=$'+i;
            }else{
                sFields+= ' ,' +p+'=$'+i;
            }
            aValues.push(item[p]);
        }
        
        
        client.query('UPDATE webshop.phones SET '+sFields+'  WHERE id=$1', aValues, function(err, result) {
        
           // handle an error from the query
          if(handleError(err)) 
                res(err,null);
                
          
          res(null,result.rowCount);
          done();//to release the client back to the pool
          
        });
    });

}

exports.remove=function(params,res){
      //Connect to database postgresql
    pg.connect(db_config.connect_string, function(err, client,done) {
        var handleError = function(err) {
          // no error occurred, continue with the request
          if(!err) {
            return false;
          }
          if(client){ //
            done(client);//remove client from pool
          }
          console.log('An error occurred');
          return true;
        };

        // handle an error from the connection
        if(handleError(err)) {
            res(err,null);
        }
        
        client.query('DELETE FROM public.phones WHERE id=$1', [params.id], function(err, result) {
           // handle an error from the query
              if(handleError(err)) {
                    res(err,null);
                    
              }else if(typeof result=='undefined'){
                res(null,false);
             }else{
                res(null,true);
             }
              done();//to release the client back to the pool
        });
      
    });
 
}
