class AuthMiddleware {
    loggedin(req, res, next) {
        if (req.session.user) {
            res.locals.user = req.session.user
            next();
        } else {
            res.redirect('/login')
        }
    }

    isAuth(req, res, next) {
        if (req.session.user) {
            res.locals.user = req.session.user
            res.redirect('/')
        } else {
            next()
        }
    }

    freedom(req, res, next) {
        console.log(req.session.user)
        if (req.session.user) {
            res.locals.user = req.session.user
            next()
        } else {
            next()
        }
    }

    admin(req, res, next) {
        if (req.session.user && req.session.user.role) {
            res.locals.user = req.session.user
            next()
        } else if (req.session.user && !req.session.user.role) {
            res.locals.user = req.session.user
            res.redirect('/')
        } else {
            res.redirect('/login')
        }
    }
}
module.exports = new AuthMiddleware