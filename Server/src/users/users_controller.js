const pool = require('../../db');
const queries = require('./users_queries');

const getUsers = (req, res) => {
  pool.query(queries.getUsers, (error, results) =>{
    if(error) throw error;
    res.status(200).json(results.rows);
  });
};

const getUserInformationByUsername = (req, res) => {
  const username = req.params.username
  pool.query(queries.getUserInformationByUsername, [username],(error, results) =>{
    if(error) throw error;
    res.status(200).json(results.rows);
  });
};

const getUserGames = (req, res) => {
  const username = req.params.username
  pool.query(queries.getUserGames, [username], (error, results) =>{
    if(error) throw error;
    res.status(200).json(results.rows);
  });
};

module.exports = {
  getUsers,
  getUserInformationByUsername,
  getUserGames
};

