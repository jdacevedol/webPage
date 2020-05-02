const dbConnection = require('../../model/dbConnection')
module.exports = (app) => {
    const connestion = dbConnection();
    app.get('/shop',(req,res) => {
        res.render('../view/shop.ejs');
    });

    app.get('/products',(req,res) => {
        connestion.query('SELECT * from productos', (err, result) => {
            if(err) {
                throw err
            }else {
                res.render('../view/products.ejs',{ shop: result });
            }
        })
    });
    app.post('/shop', (req,res) => {
    });
}