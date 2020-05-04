const dbConnection = require('../../model/dbConnection')
const controlller = require('../../controller/controller')
module.exports = (app) => {
    const connestion = dbConnection();
    app.get('/shop',(req,res) => res.render('../view/shop.ejs'));

    app.get('/products',controlller.list)

    app.post('/products', controlller.addProduct);

    app.get('/delete/:id', controlller.deleteProduct);

    app.get('/update/:id', controlller.editProducts);

    app.post('/update/:id', controlller.updateProduct);

    app.get('/buy',controlller.listshop);

    app.get('/info/:id',controlller.info);

    app.get('/updateProfile', controlller.loadProfile);

    app.post('/updateProfile/:id', controlller.updateProfile);
}