pragma solidity ^0.5.0;

contract Adoption {
uint[16] public productIds;

struct Data{
  string name;
  string status;
  bytes32 hash_value;
  string curLoc;
}

mapping(uint => Data) prod;

// Adding a product
function addProduct(uint prodId,string memory pname,string memory pstatus,string memory pcurLoc) public returns (uint) {
  require(prodId >= 0 && prodId <= 15,"go home simon");
  prod[prodId].name = pname;
  prod[prodId].status = pstatus;
  prod[prodId].curLoc = pcurLoc;

  productIds[prodId] = prodId;
  

  return prodId;
}

// Retrieving the adopters
function getAdopters() public view returns (uint[16] memory) {
  return productIds;
}

function getProductDetail(uint prodId) public view returns (string memory,string memory,string memory) {
  string memory prod_name = prod[prodId].name;
  string memory prod_status = prod[prodId].status;
  string memory prod_curLoc = prod[prodId].curLoc;
  return (prod_name,prod_status,prod_curLoc);
}


}