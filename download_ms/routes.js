var express = require('express');
var Song = require("./models/song").Song;
var router = express.Router();

router.get('/', function (req, res) {
  res.send('Hello download_ms')
});

router.route('/songs/:id')
  .get(function (req, res) {
      Song.findOne({ id: req.params.id }).then( function (song) {
        res.send(song);
      }, function (err) {
        res.send(String(err));
      });
  })
  .put(function (req, res) {
    Song.findOne({ id: req.params.id }, function(err,song){
      song.id = req.body.id;
      song.url = req.body.url;
      song.save().then( function (song) {
        res.send("Song Updated");
      }, function (err) {
        res.send(String(err));
      });
    });
  })
  .delete(function (req, res) {
    Song.findOneAndRemove({ id: req.params.id }, function(err){
      if(!err){
        res.send("Song Deleted");
      }else{
        res.send(err);
      }
    });
  });

router.route('/songs')
  .get(function (req, res) {
      Song.find( function (err, doc) {
        console.log();
        res.send(doc);
      })
  })
  .post(function (req, res) {
      var song = new Song({ id: req.body.id, url: req.body.url });
      song.save().then( function (song) {
        res.send("Song Saved");
      }, function (err) {
        res.send(String(err));
      })
  });


module.exports = router;
