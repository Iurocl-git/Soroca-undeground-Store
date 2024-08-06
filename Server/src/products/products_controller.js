const pool = require('../../db');
const queries = require('./products_queries')

const getProducts = (req, res) => {
  pool.query(queries.getProducts, (error, results) =>{
    if(error) throw error;
    res.status(200).json(results.rows);
  });
};

const postProduct = (req, res) => {
  const {name, description, genre, rating, price, username} = req.body;
  console.log(req.body);
  pool.query(queries.postProduct, [name, description, genre, rating, price, username], (error, results) => {
    try{
    if(error) throw error;
    res.status(200).json("The game was successfully added");
    } catch (error) {
      res.status(500).json({ message: error.message });
    }
  });
  // console.log(req.body);
}


module.exports = {
  getProducts,
  postProduct
}

