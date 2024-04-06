import mysql from 'mysql2'

const connection = mysql.createConnection({
    host     : 'localhost',
    user     : 'root',
    password : 'Haivan123',
    database : 'fsn'
  });

  connection.connect((err) => {
      if (err) {
        console.log('Lỗi kết nối:', err);
      } else {
        console.log('Connected!');
      }
  });

  export default connection