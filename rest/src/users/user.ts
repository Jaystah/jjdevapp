import express from 'express';
const router = express.Router();
import mongoose from 'mongoose';
import {UserSchema} from '../@types/UserSchema';

const User = mongoose.model<UserSchema>('Users');

router.get('/', async (req, res) => {
  const foundUser = await User.findOne();
  res.send(foundUser);
});

router.post('/create', async (req, res) => {
  try {
    const givenData: UserSchema = req.body;
    if (
      !givenData.fullName ||
      givenData.fullName.split('').length <= 1 ||
      !givenData.password ||
      !givenData.role
    ) {
      return res.status(400).json({
        message: 'Please send the fullName as a full name, password and role',
      });
    }
    const foundUser = await User.findOne({fullName: givenData.fullName});
    if (foundUser)
      return res
        .status(400)
        .json({message: 'Already found a user with this full name'});
    const user = await new User(givenData).save();
    res.status(201).json({
      message: 'User created',
      ...user.set('password', undefined).toJSON(),
    });
  } catch (error) {
    console.error(error);
    res.status(500).json({
      message: 'An error has occurred',
    });
  }
});

export default router;
