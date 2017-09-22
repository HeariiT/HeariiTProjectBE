var uniqueValidator = require('mongoose-unique-validator');
var mongoose = require('mongoose');
var Schema = mongoose.Schema,
    ObjectId = Schema.ObjectId;

var songSchema = new Schema({
    id          : {type: ObjectId, required: true, unique: true},
    url         : {type: String, required: true, unique: true},
    user        : {type: Number, required: true},
    title       : {type: String, required: true},
    description : {type: String},
})
songSchema.plugin(uniqueValidator);

var Song = mongoose.model('Song', songSchema);

module.exports.Song = Song;
