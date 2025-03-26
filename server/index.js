const express = require('express');
const mongoose = require('mongoose');
const authRouter = require('./routes/auth');
require('dotenv').config();

const PORT = process.env.PORT || 3000;
const app = express();

app.use(express.json());
app.use(authRouter);

DB = process.env.MONGO_URI;
mongoose.connect(DB).then(() => console.log('Connected to MongoDB!'))
  .catch(err => console.error('MongoDB connection error:', err));

app.listen(PORT, "0.0.0.0", ()=>{
    console.log(`connected at port http://localhost:${PORT}`);
}); 