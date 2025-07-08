const sql = require('mssql');
require('dotenv').config();

const config = {
  user: process.env.DB_USER,
  password: process.env.DB_PASSWORD,
  server: process.env.DB_HOST,
  database: process.env.DB_NAME,
  port: parseInt(process.env.DB_PORT),
  options: {
    encrypt: false, // true si usas Azure
    trustServerCertificate: true,
    enableArithAbort: true
  }
};

let pool;

async function connectDB() {
  try {
    if (!pool) {
      console.log('Configuración de conexión:', {
        user: config.user,
        server: config.server,
        database: config.database,
        port: config.port
      });
      
      pool = await sql.connect(config);
      console.log('✅ Conectado a SQL Server exitosamente');
    }
    return pool;
  } catch (err) {
    console.error('❌ Error al conectar a SQL Server:', err.message);
    throw err;
  }
}

// Función para obtener la conexión
async function getConnection() {
  if (!pool) {
    await connectDB();
  }
  return pool;
}

// Función para cerrar la conexión
async function closeConnection() {
  if (pool) {
    await pool.close();
    pool = null;
    console.log('Conexión cerrada');
  }
}

module.exports = {
  connectDB,
  getConnection,
  closeConnection,
  sql
};