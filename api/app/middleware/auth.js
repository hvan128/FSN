import { OAuth2Client } from "google-auth-library";
import * as JWT from "../common/_JWT.js";

const client = new OAuth2Client();
async function verifyGoogleToken(token) {
  const ticket = await client.verifyIdToken({
    idToken: token,
    audience:
      "356005686753-6k7n6798ohrqfr1rso4enocshqtjvd4p.apps.googleusercontent.com",
  });
  const payload = ticket.getPayload();
  return payload;
}

export let isAuthenticated = async (req, res, next) => {
  try {
    if (req.headers && req.headers.authorization) {
      const str = req.headers.authorization.split(" ")[0];
      const token = req.headers.authorization.split(" ")[1];
      if (str === "Bearer") {
        const payload = await JWT.verify(token);
        if (payload) {
          req.user = payload;
          next();
        } else {
          res.sendStatus(401).send("Something went wrong");
        }
      } else {
        next();
        // try {
        //   const payload2 = await verifyGoogleToken(token).catch((err) => {
        //     console.log("err", err);
        //     next(err);
        //   });
        //   if (payload2) {
        //     req.user = payload2;
        //     next();
        //   } else {
        //     res.sendStatus(401).send("Something went wrong");
        //   }
        // } catch (error) {
        //   res.sendStatus(401).send("Invalid Token");
        // }
      }
    } else {
      res.sendStatus(401).send("No Token");
    }
  } catch (error) {
    console.log(error);
  }
};
