import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:freebie_for_crypto_wallet/Components/CryptoWallerBox.dart';
import 'file:///D:/AndroidStudioProjects/freebie_for_crypto_wallet/lib/util/coin_market_api.dart';
import 'package:freebie_for_crypto_wallet/contanst/font_style.dart';

class WalletScreen extends StatefulWidget {
  @override
  _WalletScreenState createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  Future<Crypto> futureApi;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    futureApi = fetchCryptoLatest();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Text(
            'Crypto wallet',
            style: DashBoardStyle,
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(vertical: 5),
          child: Column(
            children: [
              Text(
                '0.0',
                style: DashBoardHeaderText,
              ),
              Container(
                padding: EdgeInsets.only(bottom: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'price left',
                      style: DashBoardStyle.copyWith(
                          color: secondColor, fontSize: 20),
                    ),
                    SizedBox(width: 15),
                    Text(
                      'price right',
                      style: DashBoardStyle.copyWith(fontSize: 20),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: FutureBuilder<Crypto>(
            future: futureApi,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done &&
                  snapshot.hasData) {
                List<dynamic> cryptoList = snapshot.data.data;
                return Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: GridView.count(
                    crossAxisCount: 2,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 20,
                    primary: true,
                    children: cryptoList.map((info) {
                      return CryptoWalletBox(
                        data: info,
                      );
                    }).toList(),
                  ),
                );
              }
              if (snapshot.hasError && snapshot.error) {
                return Center(
                  child: Text('${snapshot.hasError.toString()}'),
                );
              }
              return Center(
                child: CircularProgressIndicator(
                    backgroundColor: dashboardDeepColor),
              );
            },
          ),
        ),
      ],
    );
  }
}
