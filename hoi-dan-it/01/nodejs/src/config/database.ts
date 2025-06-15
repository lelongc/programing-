// Get the client
import mysql from 'mysql2/promise';

// Create the connection to database
const getConnection = async () => {
      // Create a connection to the database
      const connection = await mysql.createConnection({
            // Replace with your database configuration
            port: 3306,
            host: 'localhost',
            user: 'root',
            password: '190110',
            database: 'nodejshit',
      });

      return connection;

};

export default getConnection;