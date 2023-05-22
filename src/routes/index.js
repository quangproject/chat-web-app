const siteRouter = require('./site')
const messageRouter = require('./message')
const inboxRouter = require('./inbox')
const friendRequestRouter = require('./friend-request')
const listFriendRouter = require('./list-friend')
const sendRequestRouter = require('./send-request')
const loginRouter = require('./login')
const registerRouter = require('./register')

const authMiddleware = require('../app/middlewares/AuthMiddleware')

function route(app) {
    app.use('/register', registerRouter)
    app.use('/login', loginRouter)
    app.use('/send-request', sendRequestRouter)
    app.use('/list-friend', authMiddleware.isAuth, listFriendRouter)
    app.use('/friend-request', authMiddleware.isAuth, friendRequestRouter)
    app.use('/inbox', authMiddleware.isAuth, inboxRouter)
    app.use('/message', authMiddleware.isAuth, messageRouter)
    app.use('/', siteRouter)
}

module.exports = route;