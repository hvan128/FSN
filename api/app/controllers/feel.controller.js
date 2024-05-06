import Feel from "../models/feel.model.js";

export const createFeel = (req, res, next) => {
    var data = req.body;
    Feel.create(data, (err, result) => {
        if (err) {
            next(err);
        } else {
            res.send(result);
        }
    })
}

export const deleteFeel = (req, res, next) => {
    var id = req.params.id;
    Feel.delete(id, (err, result) => {
      if (err) {
        next(err);
      } else {
        res.send(result);
      }
    });
  };
  