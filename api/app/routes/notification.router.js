import * as notificationController from "../controllers/notification.controller.js";

export default (router) => {
  router.get("/api/v1/notification/community/:id", function (req, res, next) {
    notificationController.getCommunityNotification(req, res, next);
  });
  router.get("/api/v1/notification/fridge/:id", function (req, res, next) {
    notificationController.getFridgeNotification(req, res, next);
  });

  router.get("/api/v1/notification/admin", function (req, res, next) {
    notificationController.getAdminNotification(req, res, next);
  });
  router.post("/api/v1/send-notification", function (req, res, next) {
    notificationController.sendPushNotification(req, res, next);
  });

  router.post("/api/v1/notification", function (req, res, next) {
    notificationController.createNotification(req, res, next);
  });

  router.put("/api/v1/notification/read/:id", function (req, res, next) {
    notificationController.read(req, res, next);
  });

  router.delete("/api/v1/notification/:id", function (req, res, next) {
    notificationController.deleteNotification(req, res, next);
  });
};
