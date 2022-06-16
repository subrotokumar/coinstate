import 'package:flutter/material.dart';
import '../services/api_data.dart';
import '../models/cryptocurrency.dart';
import 'dart:convert';
import '../models/cryptocurrency.dart';
import 'package:http/http.dart' as http;

class CryptoProvider extends ChangeNotifier {
  List<Cryptocurrency> _coinList = [];
  bool _loading = true;

  CryptoProvider() {
    getData();
  }

  Future<void> getData() async {
    Future<void> fetchData() async {
      List<dynamic> _markets = await ApiData.getApiData();

      List<Cryptocurrency> temp = [];
      for (var market in _markets) {
        Cryptocurrency newCrypto = Cryptocurrency.fromJSON(market);

        // if (favorites.contains(newCrypto.id!)) {
        //   newCrypto.isFavorite = true;
        // }

        temp.add(newCrypto);
      }

      _coinList = temp;
      _loading = false;
      notifyListeners();
    }
  }

  // Future<void> getApiData() async {
  //   Uri url = Uri.parse(
  //       "https://api.nomics.com/v1/currencies/ticker?key=d97f16288bed7845681c713189f0c085f4adf0a0&interval=1d,30d&convert=INR&per-page=25&page=1");
  //   var response = await http.get(url);
  //   var jsonData = jsonDecode(response.body);
  //   // List<dynamic> currencyList = jsonData as List<dynamic>;
  //   List<Cryptocurrency> coinList = [];
  //   for (var i in jsonData) {
  //     Cryptocurrency obj = Cryptocurrency(
  //       name: i["name"],
  //       symbol: i["symbol"],
  //       price: i["price"],
  //       rank: i["rank"] == null ? 999 : i["rank"],
  //       logoUrl: i["logo_url"],
  //       priceChange1D: i["1d"]["price_change_pct"],
  //     );
  //     coinList.add(obj);
  //     // print(obj.logoUrl);
  //   }
  //   _coinList = coinList;
  //   _loading = false;
  //   notifyListeners();
  // }

  int get ListSize => _coinList.length;

  get loading => _loading;

  bool get showIcon => _loading;

  List<dynamic> get getCoinList => _coinList;

  void changeShowIcon(bool val) {
    _loading = val;
    notifyListeners();
  }
}
