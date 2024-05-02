import Dish from "../models/dish.model.js";

export const createDish = (req, res, next) => {
  var data = req.body;
  Dish.create(data, (err, result) => {
    if (err) {
      next(err);
    } else {
      res.send(result); 
    }
  });
};
