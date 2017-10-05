var express = require('express');
var SongController = require("./controllers/song_controller");
var router = express.Router();

router.get('/', function (req, res) {
  res.send('Hello information_ms')
});

router.route('/songs')
  .get( SongController.getQuerySongs )
  .post( SongController.postNewSong );

router.route('/songs/:id')
  .get( SongController.getSongById )
  .put( SongController.updateSong )
  .delete( SongController.deleteSong );

module.exports = router;
