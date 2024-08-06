const getUsers = async() => {
  const response = await fetch('/api/users');
  const data = await response.json();
  return data;
}

const getProducts = async() => {
  const response = await fetch('/api/games');
  const data = await response.json();
  return data;
}

const postProduct = async(params) => {
  const response = await fetch('/api/games/addProduct', {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json'
    },
    body: JSON.stringify( params )
  });
  // console.log(response);
  // const data = await response.json()
  // console.log(data);
  return await response.json();
}

const getAds = async() => {
  const response = await fetch('/api/ads');
  const data = await response.json();
  return data;
}


export {
  getUsers,
  getProducts,
  postProduct, 
  getAds
}
