const pool = require('../../db');
const queries = require('./session_queries');

const login = (req, res) => {
  const { username, pass } = req.body;
  
  pool.query(queries.login, [username, pass], (error, results) => {
    try{
      if (error) throw error;
      if (results.rows.length > 0) {
        req.session.userID = results.rows[0].username;
        res.status(200).json(req.session);
      } else {
        res.status(401).json({message: 'Username or password are incorrect'})
    } 
    } catch (error){
      res.status(500).json({ message: error.message });
    }
  });
}

const logout = (req, res) => {
  if (req.session.userID) {
    req.session.destroy();
    res.status(200).json({message: 'Logout completed'});
  } else {
    res.status(401).json({message: 'You are not logged in'});
  }
}

const isLogged = (req, res) => {
  if (req.session.userID) {
    res.status(200).json(req.session);
    console.log(req.session.userID);
  } else {
    res.status(401).json({message: 'You are not logged in'});
    console.log("nope");
  }
}

module.exports = {
  login,
  logout,
  isLogged
}