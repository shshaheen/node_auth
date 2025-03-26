const express = require("express");
const bcryptjs = require("bcryptjs");
const User = require("../models/user");
const authRouter = express.Router();


//Sign Up
authRouter.post("/api/signup", async (req, res) => {
    try {
        const {name, email, password} = req.body;
        
        const existingUser = await User.findOne({email});
        if(existingUser) {
            return res.status(400).json({message:"User with same email already exists!"});
        }
        const hashedPassword = await bcryptjs.hash(password, 8);
        let user = new User({
            email,
            password: hashedPassword,
            name,
        });
        user = await user.save();
        res.json(user);
    } catch(e) {
        res.status(500).json({error: e.message});
    }
});

//Sign In
authRouter.post("/api/signin", async (req, res) =>{
    try {
        const {email, password} = req.body;
        const user = await User.findOne({email});
        if(!user) {
            return res.status(400).json({message: "User not found!"});
        }
        const isMatch = await bcryptjs.compare(password, user.password);
        if(!isMatch) {
            return res.status(400).json({message: "Incorrect password!"});
        }
        
        const token = jwt.sign({id:user._id}, "passwordKey");
        res.json({token, ...user.doc});
    } catch(e) {
        res.status(500).json({error: e.message});
    }


})
module.exports = authRouter;
