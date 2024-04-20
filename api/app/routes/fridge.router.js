import * as Fridge from '../controllers/fridge.controller.js';

export default (router) => {

    router.get('/api/v1/fridge', function(req, res, next) {
        Fridge.getAllFridge(req, res);
    })

    router.get('/api/v1/fridge/:id', function(req, res, next) {
        Fridge.getFridgeById(req, res);
    })

    router.post('/api/v1/fridge', function(req, res, next) {
        Fridge.create(req, res, next);
    })
}