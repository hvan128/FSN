import Feedback from "../models/feedback.model.js";
import upload from "../middleware/upload.js";

var feedbackUpload = upload.fields([{ name: "image", maxCount: 1 }]);

export const create = (req, res) => {
  feedbackUpload(req, res, (err) => {
    if (err) {
      next(err);
    } else {
      var body = req.body;
      var file = req.files;

      var data = {
        userId: body.userId,
        dishId: body.dishId,
        content: body.content,
        image: file.image[0].filename,
      };

      Feedback.create(data, (err, result) => {
        if (err) {
          next(err);
        } else {
          res.send(result);
        }
      });
    }
  });
};

export const getFeedbackByDishId = (req, res) => {
    var dishId = req.params.id;
    var page = req.query.page || 1;
    var pageSize = req.query.pageSize || 10;
    Feedback.getByDishId(dishId, page, pageSize, (err, result) => {
        if (err) {
            next(err);
        } else {
            res.send(result);
        }
    })
}