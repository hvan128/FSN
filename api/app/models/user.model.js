import db from "../../common/connect.js";
class User {
  constructor(id, username, password, email) {
    this.id = id;
    this.username = username;
    this.password = password;
    this.email = email;
  }
}
//* Create a new User */
User.create = (data, result) => {
  db.query("INSERT INTO users SET ?", data, (err, res) => {
    if (err) {
      console.log(err);
      result(err, null);
      return;
    } else {
      result(null, { id: res.insertId, ...data });
    }
  });
};

User.createUserSystem = (data, result) => {
  db.query(
    "SELECT * FROM user_system WHERE username = ? OR email = ?",
    [data.username, data.email],
    (err, res) => {
      if (err) {
        console.log(err);
        result(err, null);
        return;
      } else {
        if (res.length) {
          result({ kind: "exist" }, null);
          return;
        } else {
          db.query("INSERT INTO user_system SET ?", data, (err, res) => {
            if (err) {
              console.log(err);
              result(err, null);
              return;
            } else {
              result(null, { id: res.insertId, ...data });
            }
          });
        }
      }
    }
  );
};

///* Get Users */
User.getAllUser = (result) => {
  db.query("SELECT * FROM users", (err, res) => {
    if (err) {
      console.log(err);
      result(err, null);
    } else {
      result(null, res);
    }
  });
};

User.findById = (id, result) => {
  db.query(`SELECT * FROM users WHERE id = ${id}`, (err, res) => {
    if (err) {
      console.log(err);
      result(err, null);
    } else {
      result(null, res);
    }
  });
};

User.findByEmail = (email, result) => {
  db.query(`SELECT * FROM users WHERE email = '${email}'`, (err, res) => {
    if (err) {
      console.log(err);
      result(err, null);
    } else {
      result(null, res);
    }
  });
};

User.findByFridgeId = (fridgeId, result) => {
  db.query(`SELECT * FROM users WHERE fridgeId = ${fridgeId}`, (err, res) => {
    if (err) {
      console.log(err);
      result(err, null);
    } else {
      result(null, res);
    }
  });
};

User.getAllUserSystem = (req, result) => {
  const {
    sortOrder = "ASC",
    sortField = "id",
    page = 1,
    perPage = 10,
    username,
    phone,
    email,
  } = req.body;

  let query = "SELECT * FROM user_system";
  let countQuery = "SELECT COUNT(*) as total FROM user_system";
  let conditions = [];
  let queryParams = [];
  let countParams = [];

  // Filter conditions
  if (username) {
    conditions.push("username LIKE ?");
    queryParams.push(`%${username}%`);
    countParams.push(`%${username}%`);
  }
  if (phone) {
    conditions.push("phone LIKE ?");
    queryParams.push(`%${phone}%`);
    countParams.push(`%${phone}%`);
  }
  if (email) {
    conditions.push("email LIKE ?");
    queryParams.push(`%${email}%`);
    countParams.push(`%${email}%`);
  }

  if (conditions.length > 0) {
    const whereClause = " WHERE " + conditions.join(" AND ");
    query += whereClause;
    countQuery += whereClause;
  }

  // Ordering
  query += ` ORDER BY ${sortField} ${sortOrder}`;

  // Pagination
  const offset = (page - 1) * perPage;
  query += " LIMIT ? OFFSET ?";
  queryParams.push(perPage, offset);

  // Execute count query first to get total
  db.query(countQuery, countParams, (err, countRes) => {
    if (err) {
      console.log(err);
      result(err, null);
    } else {
      // Execute main query
      db.query(query, queryParams, (err, res) => {
        if (err) {
          console.log(err);
          result(err, null);
        } else {
          result(null, {
            total: countRes[0].total,
            data: res
          });
        }
      });
    }
  });
};


User.getUserSystemById = (id, result) => {
  db.query(`SELECT * FROM user_system WHERE id = ${id}`, (err, res) => {
    if (err) {
      console.log(err);
      result(err, null);
    } else {
      result(null, res);
    }
  });
};
User.getAllFCMToken = (result) => {
  db.query("SELECT DISTINCT fcmToken FROM users WHERE fcmToken IS NOT NULL", (err, res) => {
    if (err) {
      console.log(err);
      result(err, null);
    } else {
      result(null, res);
    }
  });
};


///* Update User */
User.update = (data, result) => {
  db.query("UPDATE users SET ? WHERE id = ?", [data, data.id], (err, res) => {
    if (err) {
      console.log(err);
      result(err, null);
    } else {
      result(null, { id: data.id, ...data });
    }
  });
};

User.changePassword = (data, result) => {
  db.query('SELECT password FROM user_system WHERE id = ?', [data.id], (err, res) => {
    if (err) {
      console.log(err);
      result(err, null);
    } else {
      if (res[0].password == data.oldPassword) {
        db.query('UPDATE user_system SET password = ? WHERE id = ?', [data.newPassword, data.id], (err, res) => {
          if (err) {
            console.log(err);
            result(err, null);
          } else {
            result(null, { id: data.id, ...data });
          }
        });
      } else {
        result({ kind: "invalid" }, null);
      }
    }
  })
}

User.deleteFridge = (fridgeId, result) => {
  db.query(
    `UPDATE users SET fridgeId = NULL WHERE fridgeId = ${fridgeId}`,
    (err, res) => {
      if (err) {
        console.log(err);
        result(err, null);
      } else {
        db.query(
          `DELETE FROM categories WHERE fridgeId = ${fridgeId}`,
          (err, res) => {
            if (err) {
              console.log(err);
              result(err, null);
              return;
            } else {
              db.query(
                `DELETE FROM fridges WHERE id = ${fridgeId}`,
                (err, res) => {
                  if (err) {
                    console.log(err);
                    result(err, null);
                    return;
                  }
                }
              );
            }
          }
        );
        result(null, res);
      }
    }
  );
};

User.verify = (data, result) => {
  db.query(
    `SELECT * FROM users WHERE username = '${data.username}' AND password = '${data.password}'`,
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

User.verifyUserSystem = (data, result) => {
  db.query(
    `SELECT * FROM user_system WHERE username = '${data.username}' AND password = '${data.password}'`,
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

User.deleteUserSystem = (id, result) => {
  db.query(`DELETE FROM user_system WHERE id = ${id}`, (err, res) => {
    if (err) {
      console.log(err);
      result(err, null);
    } else {
      result(null, res);
    }
  });
};

export default User;
