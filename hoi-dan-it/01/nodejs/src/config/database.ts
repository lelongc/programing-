// Get the client
import mysql from 'mysql2/promise';

// Create the connection to database
const getConnection = async () => {
      // Create a connection to the database
      const connection = await mysql.createConnection({
            // Replace with your database configuration
            port: Number(process.env.DB_PORT) || 3306,
            host: process.env.DB_HOST || 'localhost',
            user: process.env.DB_USER || 'root',
            password: process.env.DB_PASSWORD || '190110',
            database: process.env.DB_NAME || 'nodejshit',
      });

      return connection;

};

export default getConnection;