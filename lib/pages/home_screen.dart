import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../utils/crypto_provider.dart';
import '../widgets/currency_list_widget.dart';
import '../widgets/drawer_widget.dart';
import '../widgets/search_bar_widget.dart';

class HomeScreen extends StatefulWidget {
  bool defaultCurrencyISD = true;

  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    PreferredSizeWidget appBar = AppBar(
      title: const Text("CryptoBook"),
      centerTitle: true,
      elevation: 0,
      backgroundColor: Colors.transparent,
      actions: [
        GestureDetector(
          onTap: () {
            setState(() {
              widget.defaultCurrencyISD = !widget.defaultCurrencyISD;
            });
          },
          child: Container(
            padding: const EdgeInsets.only(right: 15),
            child: Center(
              child: CircleAvatar(
                radius: 15,
                backgroundColor: Colors.amber,
                child: Text(
                  widget.defaultCurrencyISD ? "₹" : "\$",
                  style: const TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Colors.black45),
                ),
              ),
            ),
          ),
        ),
      ],
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
                    child: CryptoListWidget(),
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
