"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
var express_1 = __importDefault(require("express"));
var user_1 = __importDefault(require("./users/user"));
var app = (0, express_1.default)();
var PORT = process.env.PORT || 8083;
app.use('/users', user_1.default);
app.listen(PORT, function () {
    console.log("Listen to PORT: " + PORT);
});
