import 'package:flutter/material.dart';
import 'package:freebie_for_crypto_wallet/Components/chart.dart';

Widget chartBox(String symbol, Map<String, dynamic> price) {
  return Container(
    color: Colors.white,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.only(
            top: 20,
            bottom: 10,
            left: 10,
            right: 10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      child: Text(
                        symbol != null ? symbol : 'no data',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w800),
                      ),
                      radius: 28,
                      backgroundColor: Color(0xffFECD67),
                    ),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(price != null
                              ? price['price'].toString()
                              : 'no data'),
                          Text(price != null
                              ? price['percent_change_1h'].toString()
                              : 'no data'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, top: 5),
                child:
                    Text(symbol, style: TextStyle(fontWeight: FontWeight.w400)),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 0.8, right: 0.8),
          child: LIneChartWidget(),
        ),
      ],
    ),
  );
}
