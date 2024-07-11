import fcm from "fcm-node";
import admin from "firebase-admin";
import serviceAccount from "../../config/push-notification-key.js";
import Notification from "../models/notification.model.js";
import User from "../models/user.model.js";

const certPath = admin.credential.cert(serviceAccount);
var FCM = new fcm(certPath);

export const sendPushNotification = async (req, res, next) => {
  try {
    if (req.body.type == "admin") {
      var messages = [];
      User.getAllFCMToken((err, result) => {
        if (err) {
          next(err);
        } else {
          result.map((user) => {
            const message = {
              to: user.fcmToken,
              notification: {
                title: req.body.title,
                body: req.body.summary,
              },
              data: {
                'detail': req.body.detail,
              },
            };
            messages.push(message);
          });
        }
        Promise.all(
          messages.map((message) => {
            return new Promise((resolve, reject) => {
              FCM.send(message, (err, response) => {
                if (err) {
                  console.log(err);
                  reject(err);
                } else {
                  resolve(response);
                }
              });
            });
          })
        )
          .then((responses) => {
            res.status(200).send(responses);
          })
          .catch((err) => {
            res.status(500).send(err);
          });
      });
    } else {
      const message = {
        to: req.body.receiverToken,
        notification: {
          title: req.body.title,
          body: req.body.body,
        },
        data: req.body.data,
      };
      FCM.send(message, function (err, response) {
        if (err) {
          console.log(err);
          res.status(500).send(err);
        } else {
          res.status(200).send(response);
        }
      });
    }
  } catch (error) {
    console.log(error);
    throw error;
  }
};

export const createNotification = async (req, res, next) => {
  var data = req.body;
  Notification.create(data, (err, result) => {
    if (err) {
      next(err);
    } else {
      res.send(result);
    }
  });
};

export const getAdminNotification = (req, res, next) => {
  var page = req.query.page || 1;
  var pageSize = req.query.perPage || 10;
  var title = req.query.title;
  Notification.getAdminNotification(page, pageSize, title, (err, data) => {
    if (err) {
      return next(err);
    } else if (data == null || data.length == 0) {
      return res.status(200).send("No data");
    } else {
      return res.status(200).send({
        message: "Success",
        data: data,
      });
    }
  });
};

export const getCommunityNotification = (req, res, next) => {
  var id = req.params.id;
  Notification.getCommunityNotification(id, (err, data) => {
    if (err) {
      return next(err);
    } else if (data == null || data.length == 0) {
      return res.status(200).send("No data");
    } else {
      return res.status(200).send({
        message: "Success",
        data: data,
      });
    }
  });
};

export const getFridgeNotification = (req, res, next) => {
  var id = req.params.id;
  Notification.getFridgeNotification(id, (err, data) => {
    if (err) {
      return next(err);
    } else if (data == null || data.length == 0) {
      return res.status(200).send("No data");
    } else {
      return res.status(200).send({
        message: "Success",
        data: data,
      });
    }
  });
};

export const read = (req, res, next) => {
  var id = req.params.id;
  Notification.read(id, (err, result) => {
    if (err) {
      console.log(err);
      return next(err);
    } else {
      res.send(result);
    }
  });
};


export const deleteNotification = (req, res, next) => {
  var id = req.params.id;
  Notification.delete(id, (err, result) => {
    if (err) {
      console.log(err);
      return next(err);
    } else {
      res.send(result);
    }
  });
};