import 'package:flutter/material.dart';

Widget BottomNavigatorBar(int selectedIndex, Function onItemTapped) {
  return BottomNavigationBar(
    items: <BottomNavigationBarItem>[
      BottomNavigationBarItem(
        icon: Icon(Icons.account_balance_wallet),
        label: 'Wallet',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.insert_chart),
        label: 'chart',
      ),
    ],
    currentIndex: selectedIndex,
    selectedItemColor: Colors.amber[800],
    onTap: onItemTapped,
  );
}
