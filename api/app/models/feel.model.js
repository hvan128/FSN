import db from "../common/connect.js";
class Feel {
    constructor(type, userId, dishId, createdAt, updatedAt, id) {
        this.type = type;
        this.userId = userId;
        this.dishId = dishId;
        this.createdAt = createdAt;
        this.updatedAt = updatedAt;
        this.id = id;
    }
}

Feel.create = (data, result) => {
    db.query('INSERT INTO feel SET ?', data, (err, res) => {
        if (err) {
            console.log(err);
            result(err, null);
            return;
        } else {
            result(null, { id: res.insertId, ...data });
        }
    });
}

Feel.findByDishId = (dishId, result) => {
    db.query('SELECT * FROM feel WHERE dishId = ?', [dishId], (err, res) => {
        if (err) {
            console.log(err);
            result(err, null);
            return;
        } else {
            result(null, res);
        }
    })
}

Feel.delete = (id, result) => {
    db.query('DELETE FROM feel WHERE id = ?', [id], (err, res) => {
        if (err) {
            console.log(err);
            result(err, null);
            return;
        } else {
            result(null, res);
        }
    })
}

export default Feel