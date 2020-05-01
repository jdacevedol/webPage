const app = require("./src/model/server.js");
require("./src/model/routes/shop")(app);

app.listen(app.get('port'),()=>{
    console.log('server on port', app.get('port'));
});