import 'package:flutter/material.dart';
import 'package:freebie_for_crypto_wallet/contanst/font_style.dart';

class CryptoWalletBox extends StatelessWidget {
  dynamic data;

  CryptoWalletBox({this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: secondColor,
        borderRadius: BorderRadius.circular(20),
      ),
      padding: EdgeInsets.symmetric(horizontal: 20),
      height: 200,
      width: 300.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            data['symbol'],
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
          ),
          SizedBox(height: 10),
          Text(data['name'],
              style: dashBoardBoxText.copyWith(
                color: dashboardDeepColor,
                fontSize: 17,
              )),
          SizedBox(height: 10),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  data['quote']['USD']['price'].toStringAsFixed(2),
                  style: dashBoardBoxText,
                ),
                Text(
                  data['symbol'].length > 3
                      ? data['symbol'].substring(0, 3)
                      : data['symbol'],
                  style: dashBoardBoxText,
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          Text(
            data['quote']['USD']['percent_change_1h'].toString(),
            style: dashBoardBoxText.copyWith(
              fontSize: 17,
              color: dashboardDeepColor,
            ),
          ),
        ],
      ),
    );
  }
}
