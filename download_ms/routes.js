var express = require('express');
var SongController = require("./controllers/song_controller");
var router = express.Router();

router.get('/', function (req, res) {
  res.send('Hello download_ms')
});

router.route('/songs/:id')
  .get( SongController.getSongById )
  .put( SongController.updateSong )
  .delete( SongController.deleteSong );

router.route('/songs')
  .get( SongController.getAllSongs )
  .post( SongController.postNewSong );

module.exports = router;
