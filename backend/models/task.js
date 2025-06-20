const mongoose = require('mongoose');

const taskSchema = mongoose.Schema({
    task:{
        type:String,
        required:true,
    },
    date:{
        type:String,
        required:true
    },
    description:{
        type:String,
    },
},{timestamps:true})

const User = mongoose.model('Task',taskSchema);
module.exports = User;

