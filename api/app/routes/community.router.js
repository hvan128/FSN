import * as dishController from "../controllers/dish.controller.js";

export default (router) => {
  router.get("/api/v1/community/dishes", function (req, res, next) {
    dishController.getAllDish(req, res, next);
  });

  router.get("/api/v1/community/dish/:id", function (req, res, next) {
    dishController.getOneDish(req, res, next);
  });

  router.post("/api/v1/community/dish", function (req, res, next) {
    dishController.createDish(req, res, next);
  });
};
