import Category from "../models/category.model.js";

export const getAllCategory = (req, res, next) => {
  Category.getAllCategory((err, data) => {
    if (err) {
      return next(err);
    } else {
      return res.status(200).send({
        message: "Success",
        data: data,
      });
    }
  });
};

export const getCategoryById = (req, res) => {
  var id = req.params.id;
  Category.findById(id, (err, result) => {
    res.send(result);
  });
};

export const getCategoryByPositionId = (req, res) => {
  var positionId = req.params.positionId;
  var fridgeId = req.params.fridgeId;
  Category.findByPositionId({ positionId, fridgeId }, (err, result) => {
    if (err) {
      return next(err);
    } else {
      return res.status(200).send({
        message: "Success",
        data: result,
      });
    }
  });
};

export const addCategory = (req, res) => {
  var data = req.body;
  Category.create(data, (result) => {
    res.send(result);
  });
};

export const updateCategory = (req, res) => {
  var data = req.body;
  Category.update(data, (result) => {
    res.send(result);
  });
};

export const updatePosition = (req, res) => {
  var data = req.body;
  Category.updatePosition(data, (result) => {
    res.send(result);
  });
};

export const deleteCategory = (req, res) => {
  var id = req.params.id;
  Category.delete(id, (result) => {
    res.send(result);
  });
};

export const deleteCategoryByFridgeId = (req, res, next) => {
  var fridgeId = req.params.id;
  Category.deleteByFridgeId(fridgeId, (err, result) => {
    if (err) {
      return next(err);
    } else {
      res.send(result);
    }
  });
};
