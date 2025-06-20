const Task = require('../models/task');

const getTasks = async(req,res) =>{
    try{
        const task = await Task.find({});
        if(!task){
            return res.status(400).json({message:"There is no task"});
        }
        res.status(200).json(task);
    }
    catch(err){
        return res.status(500).json({error:"Internal server error"});
    }
}

const sendTasks = async(req,res) =>{
    const  {task,description,tab} = req.body;
    try{
        const isInserted = new  Task({
            task,
            date: new Date(),
            description,
            tab
        })
        if(!isInserted){
            return res.status(400).json({message:"Task not inserted into the db"});
        }
        await isInserted.save()
        return res.status(200).json({message:"Task inserted successfully."});
    }
    catch(err){
        return res.status(500).json({error:err.message});
    }
}

const removeTask = async(req,res) =>{
    const {id}= req.body;
    try{
        const task = Task.findById({id});
        if(!task){
            return res.status(400).json({message:"There is no task"});
        }
        await Task.findByIdAndDelete(id);
        return res.status(200).json({message:"Task removed successfully"});
    }
    catch(err){
        return res.status(500).json({message:err.message});
    }
}

module.exports = {getTasks,sendTasks,removeTask};