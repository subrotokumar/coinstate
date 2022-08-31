import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../utils/crypto_provider.dart';
import '../widgets/currency_list_widget.dart';
import '../widgets/drawer_widget.dart';
import '../widgets/search_bar_widget.dart';

class HomeScreen extends StatefulWidget {
  static String route = "/home";
  bool defaultCurrencyISD = true;

  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    PreferredSizeWidget appBar = AppBar(
      title: const Text("DASHBOARD"),
      centerTitle: true,
      elevation: 0,
      backgroundColor: Colors.transparent,
    );
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: appBar,
      drawer: const DrawerWidget(),
      body: SafeArea(
        child: Consumer<CryptoProvider>(
          builder: (context, value, child) => Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                SearchBarWidget(),
                const SizedBox(height: 10),
                Center(
                  child: SizedBox(
                    height: (MediaQuery.of(context).size.height -
                            appBar.preferredSize.height) *
                        0.83,
                    width: double.infinity,
                    child: const CryptoListWidget(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      backgroundColor: Colors.white12,
    );
  }
}
