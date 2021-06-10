class ChartModule {
  int id;
  String name;
  String symbol;
  int cmcRank;
  Map<String, dynamic> usd;

  ChartModule({this.id, this.name, this.symbol, this.cmcRank, this.usd});
}

Map<String, dynamic> bitcoinUSD = {
  "price": 9283.92,
  "volume_24h": 7155680000,
  "percent_change_1h": -0.152774,
  "percent_change_24h": 0.518894,
  "percent_change_7d": 0.986573,
  "market_cap": 158055024432,
  "last_updated": "2018-08-09T22:53:32.000Z"
};

Map<String, dynamic> etherUSD = {
  "price": 9283.92,
  "volume_24h": 7155680000,
  "percent_change_1h": -0.152774,
  "percent_change_24h": 0.518894,
  "percent_change_7d": 0.986573,
  "market_cap": 158055024432,
  "last_updated": "2018-08-09T22:53:32.000Z"
};

Map<String, dynamic> chainink = {
  "price": 34.31822630019325,
  "volume_24h": 2484341996.510627,
  "percent_change_1h": -0.98796727,
  "percent_change_24h": -5.50234987,
  "percent_change_7d": 0.98618308,
  "market_cap": 14019323403.508835,
  "last_updated": "2021-02-21T13:34:10"
};

Map<String, dynamic> cordona = {
  "price": 34.31822630019325,
  "volume_24h": 2484341996.510627,
  "percent_change_1h": -0.98796727,
  "percent_change_24h": -5.50234987,
  "percent_change_7d": 0.98618308,
  "market_cap": 14019323403.508835,
  "last_updated": "2021-02-21T13:34:10"
};

List<ChartModule> cryptoCoinList = [
  ChartModule(
      id: 1, name: 'bitcoin', symbol: 'BTC', cmcRank: 1, usd: bitcoinUSD),
  ChartModule(
      id: 2, name: 'ethereum', symbol: 'ETH', cmcRank: 2, usd: etherUSD),
  ChartModule(
      id: 1975, name: 'Chainlink', symbol: 'LINK', cmcRank: 9, usd: null),
];
