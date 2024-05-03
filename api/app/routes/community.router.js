import * as dishController from "../controllers/dish.controller.js";

export default (router) => {
  router.get("/api/v1/community/dish", function (req, res, next) {
    dishController.getAllDish(req, res, next);
  });


  router.get("/api/v1/community/dish/:id", function (req, res, next) {
    dishController.getDishById(req, res, next);
  });

  router.get("/api/v1/community/dish/owner/:id", function (req, res, next) {
    dishController.getDishByOwnerId(req, res, next);
  })

  router.post("/api/v1/community/dish", function (req, res, next) {
    dishController.createDish(req, res, next);
  });

  router.post("/api/v1/community/dish/ingredient", function (req, res, next) {
    dishController.getDishByIngredient(req, res, next);
  })
};
