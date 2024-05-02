import db from "../common/connect.js";
class Ingredient {
    constructor(category, quantity, unit, id, dishId) {
        this.category = category;
        this.quantity = quantity;
        this.unit = unit;
        this.id = id;
        this.dishId = dishId;
    }
}

Ingredient.create = (data, result) => {
    db.query("INSERT INTO ingredients SET ?", data, (err, res) => {
        if (err) {
            console.log(err);
            result(err, null);
            return;
        }
    });
}

export default Ingredient