import 'package:cryptobook/widgets/currency_list_widget.dart';
import 'package:flutter/material.dart';
import '../widgets/search_bar_widget.dart';

class HomeScreen extends StatefulWidget {
  bool showIcon;
  HomeScreen({Key? key, this.showIcon = false}) : super(key: key);

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
      actions: <Widget>[
        Switch.adaptive(
            value: widget.showIcon,
            onChanged: (val) {
              setState(() {
                widget.showIcon = val;
              });
            })
      ],
    );

    return Scaffold(
      appBar: appBar,
      drawer: const Icon(Icons.menu),
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
