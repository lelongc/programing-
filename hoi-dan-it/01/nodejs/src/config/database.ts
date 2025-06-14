// Get the client
import mysql from 'mysql2/promise';

// Create the connection to database
const createConnection = async () => {
      // Create a connection to the database
      const connection = await mysql.createConnection({
            // Replace with your database configuration
            host: 'localhost',
            user: 'root',
            password: '190110',
            database: 'nodejshit',
      });
      // Log the connection status
      console.log('Connected to the database successfully');
      // return connection;
      try {
            const [results, fields] = await connection.query(
                  'SELECT * FROM `user`'
            );

            console.log(results); // results contains rows returned by server
            console.log(fields); // fields contains extra meta data about results, if available
      } catch (err) {
            console.log(err);
      }
};

export default createConnection;