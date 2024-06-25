function errorHandler(err, req, res, next) {
    if (typeof err === "string") {
        // custom application error
        return res.status(400).json({ message: err });
    }

    if (err.name === "Unauthorized") {
        // jwt authentication error
        return res.status(401).json({ message: "Token not valid" });
    }

    return res.status(500).json({ message: err.message });
}

export default errorHandler  