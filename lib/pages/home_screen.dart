import 'package:cryptobook/pages/about.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/crypto_provider.dart';
import '../widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  static String route = "/home";
  bool defaultCurrencyISD = true;

  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PreferredSizeWidget appBar = AppBar(
      title: const Text("DASHBOARD"),
      centerTitle: true,
      elevation: 0,
      backgroundColor: Colors.transparent,
      actions: [
        GestureDetector(
          onTap: () => Navigator.pushNamed(context, About.route),
          child: const Icon(Icons.developer_board),
        ),
        const SizedBox(width: 16),
      ],
    );
    return RefreshIndicator(
      onRefresh: () =>
          Provider.of<CryptoProvider>(context, listen: false).getData(),
      child: Scaffold(
        // resizeToAvoidBottomInset: false,

        appBar: appBar,
        body: SafeArea(
          child: Consumer<CryptoProvider>(
            builder: (context, value, child) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  const SearchBarWidget(),
                  const SizedBox(height: 10),
                  Expanded(
                    child: CryptoListWidget(),
                  ),
                ],
              ),
            ),
          ),
        ),
        backgroundColor: Colors.white12,
      ),
    );
  }
}
