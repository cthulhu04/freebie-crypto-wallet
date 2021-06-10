// search the coin api from the add chart screen
search_coin(String name, List cryptoList) {
  var result = cryptoList.where((element) => element['name'] == name);
  return result;
}
