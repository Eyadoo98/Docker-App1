const express = require("express");

const PORT = 4000;

const app = express();

app.get('/',(req,res)=>res.send('<h1> Hello Eyad HI ddd</h1>'))
app.listen(PORT,()=>console.log(`app is up and running on port: ${PORT}`));

