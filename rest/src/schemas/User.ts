import mongoose, {Schema} from 'mongoose';
const userSchema = new Schema({
  fullName: String,
  role: String,
  password: String,
});
mongoose.model('Users', userSchema);
