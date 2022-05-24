import 'package:cryptobook/widgets/currency_list_widget.dart';
import 'package:flutter/material.dart';
import '../widgets/search_bar_widget.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  PreferredSizeWidget appBar = AppBar(
    title: const Text("CryptoBook"),
    centerTitle: true,
    elevation: 0,
    backgroundColor: Colors.transparent,
    leading: const Icon(Icons.menu),
    actions: const <Widget>[
      Padding(
        padding: EdgeInsets.only(right: 15.0),
        child: Icon(Icons.notifications_active_outlined),
      )
    ],
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              SearchBarWidget(),
              SizedBox(
                height: (MediaQuery.of(context).size.height -
                        appBar.preferredSize.height) *
                    0.85,
                width: double.infinity,
                child: CryptoListWidget(),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.white12,
    );
  }
}
