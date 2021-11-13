import express from 'express';
import users from './users/user';

const app = express();
const PORT = process.env.PORT || 8083;

app.use('/users', users);
app.listen(PORT, () => {
  console.log(`Listen to PORT: ${PORT}`);
});
