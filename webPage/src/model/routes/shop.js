const dbConnection = require('../../model/dbConnection')
module.exports = (app) => {
    const connestion = dbConnection();

    app.get('/',(req,res) => {
        connestion.query('SELECT * FROM Vendedornpm install bootstrap', (err, result) => {
            res.render('../view/shop.ejs',{
                shop: result
            });
        })
    });
}