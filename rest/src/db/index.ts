import mongoose from 'mongoose';
export class Database {
  private username = process.env.MONGO_USERNAME;
  private password = process.env.MONGO_PASSWORD;
  private connectionString = `mongodb+srv://${this.username}:${this.password}@jjdevdata.igqnk.mongodb.net/myFirstDatabase?retryWrites=true&w=majority`;

  constructor() {
    console.log('Connecting to db...');
    mongoose.connect(this.connectionString);
    mongoose.connection.on('connected', () =>
      console.log('Connected to the database')
    );
    mongoose.connection.on('error', err =>
      console.log('An error with the database connection occurred:', err)
    );
  }
}
