import * as RequestController from "../controllers/request.controller.js";

export default (router) => {
    router.get("/api/v1/request", function (req, res, next) {
        RequestController.getAllRequest(req, res, next);
    });

    router.get("/api/v1/request/:id", function (req, res, next) {
        RequestController.getRequestById(req, res, next);
    });

    router.post("/api/v1/request", function (req, res, next) {
        RequestController.createRequest(req, res, next);
    });

    router.put("/api/v1/request/:id", function (req, res, next) {
        RequestController.changeStatus(req, res, next);
    });

    router.delete("/api/v1/request/:id", function (req, res, next) {
        RequestController.deleteRequest(req, res, next);
    });
}