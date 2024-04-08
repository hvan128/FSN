import express from 'express'
import morgan from 'morgan'
import homeRouter from './app/routes/home.router.js'
import authRouter from './app/routes/auth.router.js'
import * as authController from './app/controllers/auth.controller.js'
import bodyParser from 'body-parser'
import errorHandler from './app/middleware/errors.js'

const app = express()
const port = 3000


app.use(morgan('combined'))
app.use(bodyParser.urlencoded({ extended: false }))
app.use(bodyParser.json())

authRouter(app);
app.use(authController.isAuthenticated); // middleware
homeRouter(app);
app.use(errorHandler);

app.listen(port, () => {
  console.log(`Example app listening on port ${port}`)
})