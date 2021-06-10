import 'package:flutter/cupertino.dart';
import 'package:freebie_for_crypto_wallet/Components/chart_module.dart';

class AddChart extends ChangeNotifier {
  List<ChartModule> _chart = [];

  List<ChartModule> get getChart => _chart;

  void setChart(ChartModule chart) {
    _chart.add(chart);
    notifyListeners();
  }
}

//    ChartModule(
//         id: 1, name: 'bitcoin', symbol: 'BTC', cmcRank: 1, usd: bitcoinUSD),
//     ChartModule(
//         id: 2, name: 'ethereum', symbol: 'ETH', cmcRank: 2, usd: etherUSD),
