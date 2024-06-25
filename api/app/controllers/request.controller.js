import Request from "../models/request.model.js";

export const createRequest = (req, res, next) => {
  const data = req.body;
  Request.create(data, (err, result) => {
    if (err) {
      next(err);
    } else {
      console.log(result);
      return res.status(200).send({
        message: "Success",
        data: result,
      });
    }
  });
};

export const getAllRequest = (req, res, next) => {
console.log(req.query);
  const page = req.query.page || 1;
  const pageSize = req.query.perPage || 10;
  const status = req.query.status;  
  Request.getAll(page, pageSize, status, (err, result) => {
    if (err) {
      next(err);
    } else {
      res.send(result);
    }
  });
};

export const changeStatus = (req, res, next) => {
  const id = req.params.id;
  const status = req.body.status;
  Request.changeStatus(id, status, (err, result) => {
    if (err) {
      next(err);
    } else {
      res.send(result);
    }
  });
};

export const getRequestById = (req, res, next) => {
  const id = req.params.id;
  Request.getById(id, (err, result) => {
    if (err) {
      next(err);
    } else {
      res.send(result);
    }
  });
};

export const deleteRequest = (req, res, next) => {
  const id = req.params.id;
  Request.delete(id, (err, result) => {
    if (err) {
      next(err);
    } else {
      res.send(result);
    }
  });
};
