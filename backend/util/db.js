const dotenv = require('dotenv');
dotenv.config();
const mongoose = require('mongoose');

const mongoDB = async() =>{
    const uri = process.env.MONGODB_API;
    const connection = mongoose.connection(uri)
}