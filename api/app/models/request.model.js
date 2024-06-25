import db from "../../common/connect.js";
class Request {
  constructor(id, name, description, createdAt, status) {
    this.id = id;
    this.name = name;
    this.description = description;
    this.createdAt = createdAt;
    this.status = status;
  }
}

Request.create = (data, result) => {
  db.query("INSERT INTO requests SET ?", data, (err, res) => {
    if (err) {
      console.log(err);
      result(err, null);
      return;
    }
    result(null, { id: res.insertId, ...data });
  });
};

Request.findById = (id, result) => {
  db.query(`SELECT * FROM requests WHERE id = ${id}`, (err, res) => {
    if (err) {
      console.log(err);
      result(err, null);
      return;
    }

    if (res.length) {
      result(null, res[0]);
      return;
    }

    result({ kind: "not_found" }, null);
  });
};

Request.getAll = (page, pageSize, status, result) => {
  const offset = (page - 1) * pageSize;
  const query = status
    ? `SELECT * FROM requests WHERE status = '${status}' ORDER BY createdAt DESC LIMIT ${pageSize} OFFSET ${offset}`
    : `SELECT * FROM requests ORDER BY createdAt DESC LIMIT ${pageSize} OFFSET ${offset}`;
  const queryCount = status
    ? `SELECT COUNT(*) AS total FROM requests WHERE status = '${status}'`
    : `SELECT COUNT(*) AS total FROM requests`;
  db.query(
    queryCount,
    (err, countResult) => {
      if (err) {
        console.log(err);
        result(err, null);
        return;
      }
      const totalCount = countResult[0].total;
      db.query(
        query,
        (err, res) => {
          if (err) {
            console.log(err);
            result(err, null);
            return;
          }
          result(null, { total: totalCount, data: res });
        }
      );
    }
  );
};

Request.changeStatus = (id, status, result) => {
  db.query(
    `UPDATE requests SET status = '${status}' WHERE id = '${id}'`,
    (err, res) => {
      if (err) {
        console.log(err);
        result(err, null);
        return;
      }
      result(null, res);
    }
  );
};

Request.delete = (id, result) => {
  db.query(`DELETE FROM requests WHERE id = '${id}'`, (err, res) => {
    if (err) {
      console.log(err);
      result(err, null);
      return;
    }
    result(null, res);
  });
};

export default Request;
