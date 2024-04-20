import User from "../models/user.model.js";


export const getAllUser = (req, res) => {
    User.getAllUser((err, data) => {
        if (err) {
            res.status(500).send({
                message:
                    err.message || "Some error occurred while retrieving users."
            });
        } else res.send(data);
    });
}

export const findById = (req, res) => {
    User.findById(req.params.id, (err, data) => {
        if (err) {
            if (err.kind === "not_found") {
                res.status(404).send({
                    message: `Not found User with id ${req.params.id}.`
                });
            } else {
                res.status(500).send({
                    message: "Error retrieving User with id " + req.params.id
                });
            }
        } else res.send(data);
    });
}

export const findByEmail = (req, res) => {
    User.findByEmail(req.body.email, (err, data) => {
        if (err) {
            if (err.kind === "not_found") {
                res.status(404).send({
                    message: `Not found User with email ${req.body.email}.`
                });
            } else {
                res.status(500).send({
                    message: "Error retrieving User with email " + req.body.email
                });
            }
        } else res.send(data);
    });
}

export const update = (req, res) => {
    if (req.body.password) {
        User.update(req.body, (err, data) => {
            if (err) {
                if (err.kind === "not_found") {
                    res.status(404).send({
                        message: `Not found User with id ${req.body.id}.`
                    });
                } else {
                    res.status(500).send({
                        message: "Error updating User with id " + req.body.id
                    });
                }
            } else res.send(data);
        });
    } else {
        res.status(500).send({
            message: "Error updating User with id " + req.body.id
        });
    }
}