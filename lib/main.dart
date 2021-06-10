import 'package:flutter/material.dart';
import 'package:freebie_for_crypto_wallet/Route.dart';
import 'package:freebie_for_crypto_wallet/providers/add_chart_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => AddChart(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Crypto wallet App',
      theme: ThemeData(
        accentColor: Color(0xff242326),
      ),
      onGenerateRoute: generateRoute,
      initialRoute: 'login',
      debugShowCheckedModeBanner: false,
    );
  }
}
//
