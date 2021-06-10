import 'package:flutter/material.dart';
import 'package:freebie_for_crypto_wallet/modules/add_crypto_name_drop_down_values.dart';
import 'file:///D:/AndroidStudioProjects/freebie_for_crypto_wallet/lib/modules/bottom_navigator_bar.dart';
import 'package:freebie_for_crypto_wallet/screens/chart_screen.dart';
import 'package:freebie_for_crypto_wallet/screens/wallet_screen.dart';
import 'package:freebie_for_crypto_wallet/util/coin_market_api.dart';
import '';

class DashBoardScreen extends StatefulWidget {
  @override
  _DashBoardScreenState createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Future getCryptoApi() async {
    dynamic result = await getapiCoin();
    List cryptoMap = result['data'];
    addCryptoNames(cryptoMap);
    addCryptoFiles(cryptoMap);
  }

  List<Widget> _widgetOptions = <Widget>[
    WalletScreen(),
    ChartScreen(),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCryptoApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).accentColor,
        elevation: 0,
      ),
      body: Container(
        color: Theme.of(context).accentColor,
        child: _widgetOptions[_selectedIndex],
      ),
      bottomNavigationBar: BottomNavigatorBar(_selectedIndex, _onItemTapped),
    );
  }
}
