const dbConnection = require('../../src/model/dbConnection')
const controller = {}
const connestion = dbConnection();

controller.list = (req, res) => {
    connestion.query('SELECT * from productos', (err, result) => {
        if(err) {
            throw err
        }else {
            res.render('../../src/view/products.ejs',{ shop: result });
        }
    })
};

controller.deleteProduct = (req, res) => {
    const {id} = req.params;
    connestion.query(`DELETE FROM productos WHERE idProductos = ${id}`,
    (err, result) => {
        if(err) {
            throw err
        }else {
            res.redirect('/products')
        }
    })
};

controller.addProduct = (req, res) => {
    const {nombreP, precioP, stock, categoria} = req.body
    connestion.query('INSERT INTO productos SET?', {
        nombreP,
        precioP,
        stock,
        categoria,
        Vendedor_Usuario_username: 'hi'
    },(err, result) => {      
        if(err) {
            throw err
        }else {
            res.redirect('/products')
        }
    })
};

controller.editProducts = (req, res) => {
    const {id} = req.params;
    connestion.query(`SELECT * FROM productos WHERE idProductos = ${id}`,
    (err, result) => {
        if(err) {
            throw err
        }else {
            console.log(result[0]);
            res.render('../../src/view/editProducts.ejs',{data: result[0]})
        }
    })
}

controller.updateProduct = (req, res) => {
    const {id} = req.params;
    const {nombreP, precioP, stock, categoria} = req.body
    connestion.query('UPDATE productos SET ? WHERE idProductos = ?', [{
        nombreP,
        precioP,
        stock,
        categoria,
        Vendedor_Usuario_username: 'hi'
    },id],(err, result) => {      
        if(err) {
            throw err
        }else {
            res.redirect('/products')
        }
    })
}

controller.listshop = (req, res) => {
    connestion.query('SELECT * from productos', (err, result) => {
        if(err) {
            throw err
        }else {
            res.render('../../src/view/buy.ejs',{ shop: result });
        }
    })
}

controller.info = (req, res) => {
    const {id} = req.params;
    connestion.query(`SELECT * FROM productos WHERE idProductos = ${id}`,
    (err, result) => {
        if(err) {
            throw err
        }else {
            console.log(result[0]);
            res.render('../../src/view/info.ejs',{data: result[0]})
        }
    })
}

controller.loadProfile = (req, res) => {
    const {id} = req.params;
    connestion.query(`SELECT * FROM vendedor WHERE Usuario_username = "hi"`,
    (err, result) => {
        if(err) {
            throw err
        }else {
            res.render('../../src/view/profile.ejs',{data: result[0]})
        }
    })
}

controller.updateProfile = (req, res) => {
    const {id} = req.params;
    const {nombresU, apellidosU, celular, correo} = req.body
    connestion.query('UPDATE vendedor SET ? WHERE Usuario_username = ?', [{
        nombresU,
        apellidosU,
        celular,
        correo,
        Usuario_username: id
    },id],(err, result) => {      
        if(err) {
            throw err
        }else {
            res.redirect('/updateProfile')
        }
    })
}

module.exports = controller