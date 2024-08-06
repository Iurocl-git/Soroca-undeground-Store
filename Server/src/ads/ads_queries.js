const getAds = "SELECT id, title, description , DATE(created_at)  FROM ads";




module.exports = {
  getAds,
}