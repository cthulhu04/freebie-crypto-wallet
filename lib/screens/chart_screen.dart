import 'package:flutter/material.dart';
import 'package:freebie_for_crypto_wallet/Components/chart.dart';
import 'package:freebie_for_crypto_wallet/Components/chart_box.dart';
import 'package:freebie_for_crypto_wallet/contanst/font_style.dart';
import 'package:freebie_for_crypto_wallet/providers/add_chart_provider.dart';
import 'file:///D:/AndroidStudioProjects/freebie_for_crypto_wallet/lib/Components/chart_module.dart';
import 'package:freebie_for_crypto_wallet/screens/add_chart_screen.dart';
import 'package:provider/provider.dart';

class ChartScreen extends StatefulWidget {
  @override
  _ChartScreenState createState() => _ChartScreenState();
}

class _ChartScreenState extends State<ChartScreen> {
  @override
  Widget build(BuildContext context) {
    var _provider = Provider.of<AddChart>(context);
    List _addChart = _provider.getChart;
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          height: 50.0,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                'Charts',
                style: DashBoardStyle,
              ),
              GestureDetector(
                onTap: () {
                  print('dialog show up');
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AddChartScreen(),
                    ),
                  );
                },
                child: Icon(Icons.add, size: 30.0, color: Colors.white),
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView(
            physics: BouncingScrollPhysics(),
            children: _addChart.map(
              (chart) {
                return Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: chartBox(chart.symbol, chart.usd),
                );
              },
            ).toList(),
          ),
        ),
      ],
    );
  }
}
