var uniqueValidator = require('mongoose-unique-validator');
var mongoose = require('mongoose');
var Schema = mongoose.Schema,
    ObjectId = Schema.ObjectId;

var songSchema = new Schema({
    id          : {type: Number, required: true, unique: true},
    user        : {type: Number, required: true},
    title       : {type: String, required: true},
    author      : {type: String},
    album       : {type: String},
})
songSchema.plugin(uniqueValidator);

var Song = mongoose.model('Song', songSchema);

module.exports.Song = Song;
