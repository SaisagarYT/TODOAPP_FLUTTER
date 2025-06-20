const mongoose = require('mongoose');

const taskSchema = mongoose.Schema({
    task:{
        type:String,
        required:true,
    },
    date:{
        type:Date,
    },
    description:{
        type:String,
    },
    tab:{
        type:String,
        default:"others"
    }
},{timestamps:true})

const User = mongoose.model('Task',taskSchema);
module.exports = User;

