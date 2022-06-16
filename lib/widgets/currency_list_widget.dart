import "package:flutter/material.dart";
// import 'package:provider/provider.dart';

import './crypto_tile_widget.dart';

import '../services/api_data.dart';
import '../models/cryptocurrency.dart';

class CryptoListWidget extends StatefulWidget {
  const CryptoListWidget({Key? key}) : super(key: key);

  @override
  State<CryptoListWidget> createState() => _CryptoListWidgetState();
}

class _CryptoListWidgetState extends State<CryptoListWidget> {
  List<Cryptocurrency> coinList = [];
  bool loading = true;
  @override
  void initState() {
    getData();
    super.initState();
  }

  void getData() async {
    coinList = await ApiData.getApiData1();
    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    // bool loading = context.read<CryptoProvider>().loading;
    // var cryptoprovider = Provider.of<CryptoProvider>(context, listen: false);
    // var coinList = cryptoprovider.getData();
    return loading
        ? const Center(
            child: CircularProgressIndicator(
              color: Colors.white,
            ),
          )
        : ListView.builder(
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            itemCount: coinList.length,
            itemBuilder: (context, i) {
              return CryptoTile(coinList[i]);
            },
          );
  }
}
