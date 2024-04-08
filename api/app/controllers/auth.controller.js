import * as JWT from "../common/_JWT.js";
import User from "../models/user.model.js";
export let isAuthenticated = async (req, res, next) => {
  if (req.headers && req.headers.authorization) {
    const token = req.headers.authorization;
    try {
      const payload = await JWT.verify(token);
      if (payload) {
        req.user = payload;
        next();
      } else {
        res.sendStatus(401).send("Something went wrong");
      }
    } catch (error) {
      res.sendStatus(401).send("Invalid Token");
    }
  } else {
    res.sendStatus(401).send("No Token");
  }
};

export const login = (req, res) => {
  User.verify(req.body, async (err, data) => {
    if (err) {
      res.status(500).send({
        message: err.message || "Some error occurred while retrieving users.",
      });
    } else {
      if (data && data.length) {
        const token = await JWT.sign(
          data[0]
        );
        res.send({
          message: "Login successfully!",
          data: {
            username: data[0].username,
            email: data[0].email,
            id: data[0].id,
            token: token,
          },
        });
      } else {
        res.send({
          message: "Wrong username or password",
          data: null,
          code: 1001,
        });
      }
    }
  });
};

export const register = (req, res) => {
  const data = req.body;
  User.create(data, (err, data) => {
    if (err)
      res.status(500).send({
        message: err.message || "Some error occurred while creating the User.",
        data: data,
        code: err.errno,
      });
    else res.send({
      message: "User was registered successfully!",
      data: data,
    });
  });
};
