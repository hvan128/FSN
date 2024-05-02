import db from "../common/connect.js";
class Step {
    constructor(no, description, id, dishId) {
        this.no = no;
        this.description = description;
        this.id = id;
        this.dishId = dishId;
    }
}

Step.create = (data, result) => {
    db.query("INSERT INTO steps SET ?", data, (err, res) => {
        if (err) {
            console.log(err);
            result(err, null);
            return;
        } 
    });
}

export default Step

