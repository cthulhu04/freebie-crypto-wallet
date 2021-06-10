import 'package:flutter/material.dart';
import 'package:freebie_for_crypto_wallet/screens/login_screen.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case 'login':
      return MaterialPageRoute(builder: (context) => LoginScreen());
    default:
      return null;
  }
}
