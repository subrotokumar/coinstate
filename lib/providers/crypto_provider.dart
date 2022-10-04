import 'package:cryptobook/models/cryptocurrency.dart';
import 'package:flutter/foundation.dart';
import '../services/api_data.dart';

class CryptoProvider extends ChangeNotifier {
  bool isLoading = false;
  List<Cryptocurrency> _coinList = [];
  List<Cryptocurrency> filteredList = [];

  List<Cryptocurrency> get getCoinList {
    return _coinList
        .where((coin) =>
            coin.name.toLowerCase().contains(_filterString) ||
            coin.symbol.toLowerCase().contains(_filterString))
        .toList();
  }

  String _filterString = "";

  setFilterString(String str) {
    _filterString = str.toLowerCase();
    notifyListeners();
  }

  String get filterString => _filterString;

  Future<void> getData() async {
    isLoading = true;
    notifyListeners();
    _filterString = "";
    _coinList = await ApiData.getApiData1();
    isLoading = false;
    notifyListeners();
  }
}
