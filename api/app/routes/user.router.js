import * as UserController from '../controllers/user.controller.js';

export default (router) => {
    router.get('/api/v1/users', function(req, res, next) {
        UserController.getAllUser(req, res);
    })

    router.get('/api/v1/users/:id', function(req, res, next) {
        UserController.findById(req, res);
    })

    router.post('/api/v1/users', function(req, res, next) {
        UserController.create(req, res);
    })

    router.put('/api/v1/users/:id', function(req, res, next) {
        UserController.update(req, res);
    })
}