// ignore: file_names
import 'dart:convert';
import 'package:cryptobook/models/cryptocurrency.dart';
import 'package:http/http.dart' as http;

class ApiData {
  Future<List<Cryptocurrency>> getApiData() async {
    Uri url = Uri.parse(
        "https://api.nomics.com/v1/currencies/ticker?key=d97f16288bed7845681c713189f0c085f4adf0a0&interval=1d,30d&convert=INR&per-page=25&page=1");
    var response = await http.get(url);
    var jsonData = jsonDecode(response.body);
    // List<dynamic> currencyList = jsonData as List<dynamic>;
    List<Cryptocurrency> coinList = [];
    for (var i in jsonData) {
      Cryptocurrency obj = Cryptocurrency(
        name: i["name"],
        symbol: i["symbol"],
        price: i["price"],
        rank: i["rank"] == null ? 999 : i["rank"],
        logoUrl: i["logo_url"],
        priceChange1D: i["1d"]["price_change_pct"],
      );
      coinList.add(obj);
      print(obj.logoUrl);
    }
    return coinList;
  }
}
