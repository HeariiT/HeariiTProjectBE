var SongController = new function(){
  var Song = require(".././models/song").Song;

  this.getSongById = function (req, res) {
      Song.findOne({ id: req.params.id }).then( function (song) {
          res.send(song);
      }, function (err) {
        res.status(400).send({status: 400,
                  message: "BadRequest",
                  description: String(err),
                  request: req.body
                });
      });
  }

  this.getQuerySongs = function (req, res) {

      if(req.query.user != undefined){
        Song.find({ user: req.query.user}).then( function (songs) {
          res.send(songs);
        }, function (err) {
          res.send({status: 400,
                    message: "BadRequest",
                    description: String(err),
                    request: req.body
                  });
        });
      }else{
        Song.find().then( function (songs) {
          res.send(songs);
        });
      }

  }

  this.postNewSong = function (req, res) {
      var song = new Song({ id          : req.body.id,
                            user        : req.body.user,
                            title       : req.body.title,
                            author      : req.body.author,
                            album       : req.body.album,
                          });
      song.save().then( function (song) {
        res.send({status: 201,
                  message: "Created",
                  request: req.body
                });
      }, function (err) {
        res.send({status: 400,
                  message: "BadRequest",
                  description: String(err),
                  request: req.body
                });
      })
  }

  this.updateSong = function (req, res) {
    Song.findOne({ id: req.params.id }).then(function(song){
      if(song == null){
        res.status(404).send({status: 404,
                  error: "NotFound",
                  exception: "The Id: " + req.params.id + " was't found"
                });
      }
      song.id           = req.body.id;
      song.user         = req.body.user;
      song.title        = req.body.title;
      song.author       = req.body.author;
      song.album        = req.body.album;
      song.save().then( function (song) {
        res.send({status: 204,
                  message: "No Content"
                });
      }, function (err) {
        res.send({status: 400,
                  message: "BadRequest",
                  description: String(err),
                  request: req.body
                });
      });
    }, function (err) {
      res.status(404).send({status: 404,
                message: "NotFound",
                description: String(err),
                request: req.body
              });
    });
  }

  this.deleteSong = function (req, res) {
    Song.findOne({ id: req.params.id }).then(function(song){
      if(song != null){
        song.remove(function (err) {
            res.send({status: 200,
                      message: "OK",
                      request: song
                    });
                  });
      }else{
        res.status(404).send({status: 404,
                  error: "NotFound",
                  exception: "The Id: " + req.params.id + " was't found"
                });
      }
    }, function (err) {
      res.send({status: 400,
                message: "BadRequest",
                description: String(err),
                request: req.body
              });
    });
  }

}

module.exports = SongController;
