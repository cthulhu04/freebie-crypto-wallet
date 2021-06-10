List<Map> findCryptoList(List name) {
  return listCryptoItems.where((map) => name.contains(map["name"])).toList();
}

List<Map> listCryptoItems = [];
