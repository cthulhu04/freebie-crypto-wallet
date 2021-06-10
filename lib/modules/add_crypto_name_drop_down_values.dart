class AddCryptoNameDropDownValues {
  String name;
  AddCryptoNameDropDownValues(this.name);
}

List<AddCryptoNameDropDownValues> cryptoNames = <AddCryptoNameDropDownValues>[];

List addCryptoMaps = [];

addCryptoNames(List cryptoMap) {
  cryptoMap.map((map) {
    String names = map['name'];
    cryptoNames.add(AddCryptoNameDropDownValues(names));
  }).toList();
}

addCryptoFiles(List cryptoMap) {
  cryptoMap.map((map) {
    addCryptoMaps.add(map);
  }).toList();
}

findCryptoBycompareName(List newValue) {
  addCryptoMaps.where((map) => map.isAnimated).toList();
}
