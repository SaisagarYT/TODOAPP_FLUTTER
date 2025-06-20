const express = require('express');
const dotenv = require('dotenv');
const cors = require('cors');
const mongoDB = require('./util/db');
const taskRoute = require('./routes/task.routes');
dotenv.config();

const app = express();

app.use(express.json())
app.use(cors());

app.use('/api/task',taskRoute);

mongoDB()
.then(() => console.log("Connection successful"))
.catch(() => console.log("Connection unsuccessful"));

app.get('/',(req,res) =>{
    res.send("hello")
})

const PORT = process.env.PORT || 4000;
app.listen(PORT,() =>{
    console.log(`http://localhost:${PORT}`)
})