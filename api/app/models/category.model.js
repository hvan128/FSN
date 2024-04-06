import db from '../common/connect.js'
class Category {
    constructor(id, label, icon, type, positionId, manufactureDate, expiryDate, subPosition) {
        this.id = id
        this.label = this.label
        this.value = label.toLowerCase().replace(' ', '-')
        this.icon = icon
        this.type = type
        this.positionId = positionId
        this.subPosition = subPosition
        this.manufactureDate = manufactureDate
        this.expiryDate = expiryDate
    }
}

/!* Create a new Category */
Category.create = (data, result) => {
    db.query('INSERT INTO categories SET ?', data, (err, res) => {
        if (err) {
            console.log(err);
            result(err, null);
            return;
        } else {
            result(null, { id: res.insertId, ...data });
        }
    })
}

/!* Get all Categories */
Category.getAllCategory = (result) => {
    db.query('SELECT * FROM categories', (err, res) => {
        if (err) {
            console.log(err);
            result(err, null);
        } else {
            console.log(res);
            result(null, res);
        }
    })
}

/!* Get Category */
Category.findById = (id, result) => {
    db.query(`SELECT * FROM categories WHERE id = ${id}`, (err, res) => {
        if (err) {
            console.log(err);
            result(err, null);
        } else {
            result(null, res);
        }
    })
}

Category.findByPositionId = (positionId, result) => {
    db.query(`SELECT * FROM categories WHERE positionId = ${positionId}`, (err, res) => {
        if (err) {
            console.log(err);
            result(err, null);
        } else {
            result(null, res);
        }
    })
}

/!* Update Category */
Category.update = (data, result) => {
    db.query('UPDATE categories SET ? WHERE id = ?', [data, data.id], (err, res) => {
        if (err) {
            console.log(err);
            result(err, null);
        } else {
            result(null, { id: data.id, ...data });
        }
    })
}

/!* Delete Category */
Category.delete = (id, result) => {
    db.query(`DELETE FROM categories WHERE id = ${id}`, (err, res) => {
        if (err) {
            console.log(err);
            result(err, null);
        } else {
            result(null, res);
        }
    })
}

export default Category