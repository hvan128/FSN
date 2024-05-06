import Dish from "../models/dish.model.js";
import upload from "../middleware/upload.js";

var dishUpload = upload.fields([
  { name: "image", maxCount: 1 },
  { name: "step_no_1", maxCount: 10 },
  { name: "step_no_2", maxCount: 10 },
  { name: "step_no_3", maxCount: 10 },
  { name: "step_no_4", maxCount: 10 },
  { name: "step_no_5", maxCount: 10 },
  { name: "step_no_6", maxCount: 10 },
  { name: "step_no_7", maxCount: 10 },
  { name: "step_no_8", maxCount: 10 },
  { name: "step_no_9", maxCount: 10 },
  { name: "step_no_10", maxCount: 10 },
]);

export const createDish = (req, res, next) => {
  dishUpload(req, res, (err) => {
    if (err) {
      next(err);
    } else {
      var body = req.body;
      var file = req.files;

      var data = {
        ownerId: body.ownerId,
        label: body.label,
        description: body.description,
        image: file.image[0].filename,
        cookingTime: body.cookingTime,
        rangeOfPeople: body.rangeOfPeople,
        ingredients:
          body.ingredients !== "" ? JSON.parse(body.ingredients) : [],
        steps: JSON.parse(body.steps).map((step, index) => {
          var image = file[`step_no_${index + 1}`];
          return {
            no: step.no,
            description: step.description,
            dishId: step.dishId,
            image: image ? image[0].filename : null,
          };
        }),
      };
      Dish.create(data, (err, result) => {
        if (err) {
          next(err);
        } else {
          res.send(result);
        }
      });
    }
  });
};

export const getDishById = (req, res, next) => {
  var id = req.params.id;
  Dish.findById(id, (err, result) => {
    if (err) {
      next(err);
    } else {
      res.send(result);
    }
  });
};

export const getDishByOwnerId = (req, res, next) => {
  var ownerId = req.params.id;
  var page = req.query.page || 1;
  var pageSize = req.query.pageSize || 10;
  Dish.findByOwnerId(ownerId, page, pageSize, (err, result) => {
    if (err) {
      next(err);
    } else {
      res.send(result);
    }
  });
};

export const getDishByIngredient = (req, res, next) => {
  var ingredient1 = req.body.ingredient1;
  var ingredient2 = req.body.ingredient2;
  var page = req.query.page || 1;
  var pageSize = req.query.pageSize || 10;
  Dish.findByIngredients(
    ingredient1,
    ingredient2,
    page,
    pageSize,
    (err, result) => {
      if (err) {
        next(err);
      } else {
        res.send(result);
      }
    }
  );
};

export const getAllDish = (req, res, next) => {
  var page = req.query.page || 1;
  var pageSize = req.query.pageSize || 10;
  Dish.getAllDish(page, pageSize, (err, result) => {
    if (err) {
      next(err);
    } else {
      res.send(result);
    }
  });
};

export const getSavedDishesByUserId = (req, res, next) => {
  var userId = req.params.id;
  var page = req.query.page || 1;
  var pageSize = req.query.pageSize || 10;
  Dish.getSavedDishesByUserId(userId, page, pageSize, (err, result) => {
    if (err) {
      next(err);
    } else {
      res.send(result);
    }
  });
};
