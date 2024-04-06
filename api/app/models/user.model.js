import db from '../common/connect.js'
class User {
    constructor(id, username, password, email) {
        this.id = id;
        this.username = username;
        this.password = password;
        this.email = email;
    }
}

User.create = (data, result) => {
    db.query('INSERT INTO users SET ?', data, (err, res) => {
        if (err) {
            console.log(err);
            result(err, null);
            return;
        } else {
            result(null, { id: res.insertId, ...data });
        }
    })
}

User.getAllUser = (result) => {
    db.query('SELECT * FROM users', (err, res) => {
        if (err) {
            console.log(err);
            result(err, null);
        } else {
            console.log(res);
            result(null, res);
        }
    })
}

User.findById = (id, result) => {
    db.query(`SELECT * FROM users WHERE id = ${id}`, (err, res) => {
        if (err) {
            console.log(err);
            result(err, null);
        } else {
            result(null, res);
        }
    })
}

User.update = (data, result) => {
    db.query('UPDATE users SET ? WHERE id = ?', [data, data.id], (err, res) => {
        if (err) {
            console.log(err);
            result(err, null);
        } else {
            result(null, { id: data.id, ...data });
        }
    })
}

User.verify = (data, result) => {
    db.query(`SELECT * FROM users WHERE username = '${data.username}' AND password = '${data.password}'`, (err, res) => {
        if (err) {
            console.log(err);
            result(err, null);
        } else {
            result(null, res);
        }
    })
}

export default User