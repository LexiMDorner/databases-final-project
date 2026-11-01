const path = require('path');
require('dotenv').config({ path: path.join(__dirname, '..', '.env') });
const mysql = require('mysql2/promise');

async function connectionTest() {
    let connection
    try {
        connection = await mysql.createConnection({
            host: 'localhost',
            user: 'root',
            password: process.env.DB_PASSWORD,
            database: 'finalProject'
        });

        const rows = await connection.execute('SELECT * FROM teacher')
        console.log(rows[0])
    } finally {
        connection.end()
    }
}

connectionTest()