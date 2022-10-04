import 'package:cryptobook/providers/crypto_provider.dart';
import "package:flutter/material.dart";
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import './crypto_tile_widget.dart';

class CryptoListWidget extends StatelessWidget {
  CryptoListWidget({Key? key}) : super(key: key);

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    // bool loading = context.read<CryptoProvider>().loading;
    // var cryptoprovider = Provider.of<CryptoProvider>(context, listen: false);
    // var coinList = cryptoprovider.getData();
    return Consumer<CryptoProvider>(
      builder: (context, value, child) => value.isLoading
          ? Center(
              child: Lottie.asset('assets/lotties/loading.json', width: 300),
            )
          : ListView.builder(
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              itemCount: value.getCoinList.length,
              itemBuilder: (context, i) {
                return CryptoTile(value.getCoinList[i]);
              },
            ),
    );
  }
}
