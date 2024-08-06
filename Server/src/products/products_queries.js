const getProducts = "SELECT * FROM products";


const postProduct = "INSERT INTO products (name, description, genre, rating, price, user_username) VALUES ($1, $2, $3, $4, $5, $6)"

module.exports = {
  getProducts,
  postProduct
}