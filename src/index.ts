import express from "express";

const app = express();

const PORT = process.env.PORT || 3000;

app.get("/", (req, res) => {
    res.status(200).send("Changes deployed on 2 EC2 instance");
});

app.listen(PORT, () => {
    console.log("Server running on PORT => ", PORT)
});