import express from 'express'
import morgan from 'morgan'
import homeRouter from './app/routes/home.router.js'
import authRouter from './app/routes/auth.router.js'
import userRouter from './app/routes/user.router.js'
import fridgeRouter from './app/routes/fridge.router.js'
import invitationRouter from './app/routes/invitation.router.js'
import communityRouter from './app/routes/community.router.js'
import notificationRouter from './app/routes/notification.router.js'
import * as middleware from './app/middleware/auth.js'
import bodyParser from 'body-parser'
import errorHandler from './app/middleware/errors.js'


const app = express()
const port = 3000


app.use(morgan('combined'))
app.use(bodyParser.urlencoded({ extended: false }))
app.use(bodyParser.json())
app.use("/uploads", express.static("./public/uploads"));


authRouter(app);
// app.use(middleware.isAuthenticated);
notificationRouter(app);
homeRouter(app);
userRouter(app); 
fridgeRouter(app);  
invitationRouter(app);  
communityRouter(app);
app.use(errorHandler);

app.listen(port, () => {
  console.log(`Example app listening on port ${port}`)
})