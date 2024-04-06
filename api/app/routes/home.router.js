import * as categoryController from "../controllers/category.controller.js"
import * as positionController from "../controllers/position.controller.js"
import * as subPositionController from "../controllers/subPosition.controller.js"


export default (router) => { 
    //! GET home page
    /* GET category */
    router.get('/api/v1/category', function(req, res, next) {
        categoryController.getAllCategory(req, res);
    })
    router.get('/api/v1/category/:id', function(req, res, next) {
        categoryController.getCategoryById(req, res);
    })
    router.get('/api/v1/category/position/:positionId', function(req, res, next) {
        categoryController.getCategoryByPositionId(req, res);
    })

    /* GET position */
    router.get('/api/v1/position', function(req, res, next) {
        positionController.getAllPosition(req, res);
    })

    /* GET sub-position */
    router.get('/api/v1/sub-position/position/:positionId', function(req, res, next) {
        subPositionController.getSubPositionByPositionId(req, res);
    })


    //! POST home page
    router.post('/api/v1/category', function(req, res, next) {
        categoryController.addCategory(req, res);
    })

    router.post('/api/v1/position', function(req, res, next) {
        positionController.addPosition(req, res);
    })

    router.post('/api/v1/sub-position', function(req, res, next) {
        subPositionController.addSubPosition(req, res);
    })

    //! PUT home page
    router.put('/api/v1/category', function(req, res, next) {
        categoryController.updateCategory(req, res);
    })

    //! DELETE home page
    router.delete('/api/v1/category/:id', function(req, res, next) {
        categoryController.deleteCategory(req, res);
    })

    router.delete('/api/v1/position/:id', function(req, res, next) {
        positionController.deletePosition(req, res);
    })
}