require('dotenv').config();
const sql = require('mssql');

const config = {
    user: process.env.DB_USER,
    password: process.env.DB_PASSWORD,
    server: process.env.DB_HOST,
    database: process.env.DB_NAME,
    port: parseInt(process.env.DB_PORT),
    options: {
        encrypt: false,
        trustServerCertificate: true,
        enableArithAbort: true
    }
};

async function testConnection() {
    try {
        console.log('Intentando conectar con:', {
            user: config.user,
            server: config.server,
            database: config.database,
            port: config.port
        });
        
        const pool = await sql.connect(config);
        console.log('✅ Conexión exitosa a SQL Server');
        await pool.close();
    } catch (err) {
        console.error('❌ Error de conexión:', err.message);
        console.error('Código de error:', err.code);
    }
}

testConnection();