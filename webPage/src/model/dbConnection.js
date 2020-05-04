const mysql = require('mysql');

module.exports = () => {
    const db = mysql.createConnection({
        host: 'localhost',
        user: 'root',
        password: 'macuser123',
        database: 'myshop'
    })
    db.connect((err) => {
        if (err) {
            console.log(err);
            throw err
        }
        console.log("CONNECTED TO DB!");
    })
    return db   
}

