const login = "SELECT * FROM users WHERE username = $1 AND password = $2";

module.exports = {login};