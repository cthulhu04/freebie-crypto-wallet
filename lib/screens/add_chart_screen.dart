import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:freebie_for_crypto_wallet/Components/chart_module.dart';
import 'package:freebie_for_crypto_wallet/Components/drop_down_button.dart';
import 'package:freebie_for_crypto_wallet/Components/login_logo.dart';
import 'package:freebie_for_crypto_wallet/contanst/font_style.dart';
import 'package:freebie_for_crypto_wallet/functionalitty_assets.dart';
import 'package:freebie_for_crypto_wallet/modules/add_crypto_name_drop_down_values.dart';
import 'package:freebie_for_crypto_wallet/providers/add_chart_provider.dart';
import 'package:freebie_for_crypto_wallet/util/coin_market_api.dart';
import 'package:provider/provider.dart';

class AddChartScreen extends StatefulWidget {
  @override
  _AddChartScreenState createState() => _AddChartScreenState();
}

class _AddChartScreenState extends State<AddChartScreen> {
  List<Map> _cryptoList;
  String dropDownValue = 'Bitcoin';
  Future<Crypto> futureAPi;

  compareAndFindNameWithList(String dropDownValue, List listCryptoItems) {
    return listCryptoItems
        .where((info) => info['name'] == dropDownValue)
        .toList();
  }

  addToChartModule(List list) {
    list.map((info) {
      return cryptoCoinList.add(ChartModule(
        id: info['id'],
        name: info['name'],
        symbol: info['symbol'],
        cmcRank: info['cmc_rank'],
        usd: info['USD'],
      ));
    }).toList();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    futureAPi = fetchCryptoLatest();
  }

  @override
  Widget build(BuildContext context) {
    var _provider = Provider.of<AddChart>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text('add coin chart'),
        backgroundColor: Theme.of(context).accentColor,
        elevation: 0,
      ),
      body: Container(
        color: Theme.of(context).accentColor,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: FutureBuilder<Crypto>(
            future: futureAPi,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done &&
                  snapshot.hasData) {
                List<String> coins = [];

                List<dynamic> cryptoList = snapshot.data.data;
                cryptoList.map((info) {
                  coins.add(info['name']);
                }).toList();

                return Container(
                  padding: EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      LoginLogo(),
                      DropdownButton<String>(
                        isExpanded: true,
                        value: dropDownValue,
                        dropdownColor: secondColor,
                        style: TextStyle(color: Colors.white, fontSize: 18.0),
                        onChanged: (String newValue) {
                          setState(() {
                            dropDownValue = newValue;
                          });
                        },
                        items:
                            coins.map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                      SizedBox(height: 20),
                      Container(
                        width: double.infinity,
                        color: Colors.white,
                        child: TextButton(
                          onPressed: () {
                            var json = search_coin(dropDownValue, cryptoList);
                            ChartModule chart;
                            for (var result in json) {
                              chart = ChartModule(
                                id: result['id'],
                                name: result['name'],
                                symbol: result['symbol'],
                                cmcRank: result['cmc_rank'],
                                usd: result['quote']['USD'],
                              );
                            }
                            _provider.setChart(chart);
                            Navigator.pop(context);
                          },
                          child: Text('add coin'),
                        ),
                      )
                    ],
                  ),
                );
              }
              if (snapshot.hasError && snapshot.error) {
                return Center(
                  child: Text('${snapshot.hasError.toString()}'),
                );
              }
              return Center(
                child: CircularProgressIndicator(),
              );
            }),
      ),
    );
  }
}
