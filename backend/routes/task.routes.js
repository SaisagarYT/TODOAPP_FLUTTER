const express = require('express');
const {getTasks,sendTasks,removeTask} = require('../controllers/taskController');

const route = express.Router();

route.get('/tasks',getTasks);
route.post('/send-task',sendTasks);
route.delete('/remove',removeTask);

module.exports = route;