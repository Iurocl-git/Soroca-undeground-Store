const express = require('express');
const app = express();
const session = require('express-session')
const usersRoutes = require('./src/users/users_routes');
const productsRoutes = require('./src/products/products_routes');
const loginRoutes = require('./src/sessions/session_routes');
const adsRoutes = require('./src/ads/ads_routes');
const port = 3000;


app.use(express.json());
app.u

app.use(session({
  secret: 'secret',
  resave: false,
  saveUnitializes: true,
  cokie: {maxAge: 300000, secure: false}
}))

app.get('/', (req, res) => {
  res.send('Hello World!');
});

app.use('/users', usersRoutes);
app.use('/games', productsRoutes);
app.use('/sessions', loginRoutes);
app.use('/ads', adsRoutes);


app.listen(port, ()=>console.log(`app listening on port ${port}`));
