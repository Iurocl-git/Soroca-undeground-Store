const pool = require('../../db');
const queries = require('./ads_queries')

const getAds = (req, res) => {
  pool.query(queries.getAds, (error, results) =>{
    if(error) throw error;
    res.status(200).json(results.rows);
  });
};

module.exports = {
  getAds,

}

