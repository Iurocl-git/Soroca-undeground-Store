const getUsers = "SELECT username FROM users";
const getUserInformationByUsername = "SELECT * FROM users WHERE username = $1";
const getUserGames = "SELECT products.*, username FROM users JOIN products ON users.username = products.user_username WHERE users.username = $1";
;

module.exports = {
  getUsers,
  getUserInformationByUsername,
  getUserGames
}