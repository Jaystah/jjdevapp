import express, {Express} from 'express';
import {Database} from './db';
const App: Express = express();
require('dotenv').config();
const PORT = process.env.PORT || 8083;
new Database();
require('./schemas/User');
App.use(express.json());
import users from './users/user';
App.use('/users', users);

App.listen(PORT, () => {
  console.log(`Listen to PORT: ${PORT}`);
});
