import db from "../../common/connect.js";
import Category from "./category.model.js";
import Dish from "./dish.model.js";
import User from "./user.model.js";

class Notification {
  constructor(
    type,
    dishId,
    targetId,
    userId,
    feelType,
    action,
    read,
    createdAt,
    updatedAt,
    id
  ) {
    this.type = type;
    this.dishId = dishId;
    this.targetId = targetId;
    this.userId = userId;
    this.feelType = feelType;
    this.read = read;
    this.createdAt = createdAt;
    this.updatedAt = updatedAt;
    this.action = action;
    this.id = id;
  }
}

Notification.create = (data, result) => {
  db.query("INSERT INTO notification SET ?", data, (err, res) => {
    if (err) {
      console.log(err);
      result(err, null);
      return;
    } else {
      result(null, res);
    }
  });
};

Notification.getAdminNotification = (page, pageSize, title, result) => {
  var offset = (page - 1) * pageSize;
  db.query(`SELECT COUNT(*) as total FROM notification WHERE title LIKE '%${title}%' AND type = 'admin'`, (err, total) => { 
    if (err) {
      console.log(err);
      result(err, null);
    } else {
      db.query(
        `SELECT * FROM notification WHERE title LIKE '%${title}%' AND type = 'admin' ORDER BY id DESC LIMIT ${pageSize} OFFSET ${offset}`,
        (err, res) => {
          if (err) {
            console.log(err);
            result(err, null);
          } else {
            result(null, {
              data: res,
              total: total[0].total,
            });
          }
        }
      );
    }
  });
};

Notification.getByTargetId = (id, result) => {
  db.query(`SELECT * FROM notification WHERE targetId = ${id}`, (err, res) => {
    if (err) {
      console.log(err);
      result(err, null);
    } else {
      result(null, res);
    }
  });
};

Notification.getFridgeNotification = (fridgeId, result) => {
  var notifications = [];
  db.query(
    `SELECT * FROM notification WHERE fridgeId = ${fridgeId} AND type = 'fridge' order by id desc`,
    (err, res) => {
      if (err) {
        console.log(err);
        result(err, null);
      } else {
        res.forEach((notification) => {
          var categoryPromise = new Promise((resolve, reject) => {
            Category.findById(notification.categoryId, (err, category) => {
              if (err) {
                reject(err);
              } else {
                resolve(category);
              }
            });
          });
          Promise.all([categoryPromise])
            .then(([[category]]) => {
              notifications.push({ ...notification, category });
              if (notifications.length === res.length) {
                result(null, notifications);
              }
            })
            .catch((err) => {
              console.log(err);
              result(err, null);
            });
        });
      }
    }
  );
};

Notification.getCommunityNotification = (targetId, result) => {
  var notifications = [];
  db.query(
    `SELECT * FROM notification WHERE type = 'community' AND targetId = ${targetId} order by id desc`,
    (err, res) => {
      if (err) {
        console.log(err);
        result(err, null);
      } else {
        res.forEach((notification) => {
          var dishPromise = new Promise((resolve, reject) => {
            Dish.findById(notification.dishId, (err, dish) => {
              if (err) {
                reject(err);
              } else {
                resolve(dish);
              }
            });
          });
          var userPromise = new Promise((resolve, reject) => {
            User.findById(notification.userId, (err, user) => {
              if (err) {
                reject(err);
              } else {
                resolve(user);
              }
            });
          });
          Promise.all([dishPromise, userPromise])
            .then(([dish, [user]]) => {
              notifications.push({ ...notification, dish, user });
              if (notifications.length === res.length) {
                result(null, notifications);
              }
            })
            .catch((err) => {
              console.log(err);
              result(err, null);
            });
        });
      }
    }
  );
};

Notification.read = (id, result) => {
  db.query(
    "UPDATE notification SET `read` = 1 WHERE id = ?",
    [id],
    (err, res) => {
      if (err) {
        console.log(err);
        result(err, null);
      } else {
        result(null, res);
      }
    }
  );
};

Notification.delete = (id, result) => {
  db.query("DELETE FROM notification WHERE id = ?", [id], (err, res) => {
    if (err) {
      console.log(err);
      result(err, null);
    } else {
      result(null, res);
    }
  });
};
export default Notification;
