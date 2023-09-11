

import {initializeApp, applicationDefault } from 'firebase-admin/app';
import { getMessaging } from "firebase-admin/messaging";
import express, { json } from "express";


//INITI
process.env.GOOGLE_APPLICATION_CREDENTIALS;
const app = express();
const PORT = process.env.PORT || 3000;
initializeApp({
    credential: applicationDefault(),
    projectId: 'academic-calendar-2cbd4',
  })

  //MODULE
app.use(express.json());
app.use(function(req ,res ,next){
    res.setHeader("Content-Type","application/json");
    next();
})



//listen to port
app.listen(PORT,"0.0.0.0",function (){
    console.log(`Connected from port ${PORT}`)
})

//SEND
app.post("/send",(req, res )=>{
    const {body} = req.body;
    const topic = 'events';

const message = {
  notification: {
      title:"مناسبة جديدة",
      body:body
    },
  topic: topic
};

getMessaging().send(message)
  .then((response) => {
    res.status(200).json({message :message})
    console.log('Successfully sent message:');
  })
  .catch((error) => {
    res.status(400).json({error:error})
    console.log('Error sending message:');
  });
});