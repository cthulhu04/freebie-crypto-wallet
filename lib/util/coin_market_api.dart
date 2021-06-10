import 'dart:convert';
import 'package:http/http.dart' as http;

//TODO before your run this app first take your own api key from coinmarketcap.com
String apiKey = 'api_key';

String curl =
    'https://pro-api.coinmarketcap.com/v1/cryptocurrency/listings/latest';

Map<String, String> header = {
  'X-CMC_PRO_API_KEY': apiKey,
  'Accept': 'application/json'
};

Future<Crypto> fetchCryptoLatest() async {
  var response = await http.get(curl, headers: header);
  if (response.statusCode == 200) {
    return Crypto.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load api crypto info latest');
  }
}

class Crypto {
  List data;

  Crypto({this.data});

  factory Crypto.fromJson(Map<String, dynamic> json) {
    return Crypto(
      data: json['data'],
    );
  }
}

const url = 'https://pro-api.coinmarketcap.com/v1/cryptocurrency/info';

Future<Logo> fetchCryptoLogo() async {
  http.Response response = await http.get(url, headers: header);
  if (response.statusCode == 200) {
    return Logo.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('fail load api crypt logo');
  }
}

class Logo {
  List data;

  Logo({this.data});

  factory Logo.fromJson(Map<String, dynamic> json) {
    return Logo(
      data: json['data'],
    );
  }
}

Future getapiCoin() async {
  var response = await http.get(curl, headers: header);
  var json = jsonDecode(response.body);
  return json;
}
