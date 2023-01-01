import 'package:cryptobook/pages/about.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

import '../services/providers/crypto_provider.dart';
import '../widgets/local/currency_list_widget.dart';
import '../widgets/local/search_bar_widget.dart';

class HomeScreen extends StatefulWidget {
  static String route = "/home";

  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int page = 1;
  bool defaultCurrencyISD = true;

  void goto(int n) {
    setState(() {
      page = n;
    });
  }

  bool _isVisible = true;

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
      onRefresh: () => Provider.of<CryptoProvider>(context, listen: false)
          .getData(page: page),
      child: Scaffold(
        // resizeToAvoidBottomInset: false,
        floatingActionButton: AnimatedSlide(
          duration: Duration(milliseconds: 300),
          offset: _isVisible ? Offset.zero : Offset(0, 2),
          child: AnimatedOpacity(
            duration: Duration(milliseconds: 300),
            opacity: _isVisible ? 1 : 0,
            child: InkWell(
              onTap: () => showDialog(
                context: context,
                builder: (context) {
                  int currentPage = page;
                  return AlertDialog(
                    backgroundColor: Colors.black38,
                    content: StatefulBuilder(builder: (context, setState) {
                      return SizedBox(
                        height: 90,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                InkWell(
                                  onTap: () {
                                    if (currentPage > 1) {
                                      setState(() => currentPage--);
                                    }
                                  },
                                  onLongPress: () =>
                                      setState(() => currentPage = 1),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Icon(Icons.arrow_back_ios,
                                        color: Colors.white),
                                  ),
                                ),
                                Text(
                                  'PAGE : $currentPage',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    if (currentPage < 100) {
                                      setState(() => currentPage++);
                                    }
                                  },
                                  onLongPress: () =>
                                      setState(() => currentPage += 10),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Icon(
                                      Icons.arrow_forward_ios,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            OutlinedButton(
                              onPressed: () {
                                Provider.of<CryptoProvider>(context,
                                        listen: false)
                                    .getData(page: currentPage);
                                goto(currentPage);
                                Navigator.pop(context);
                              },
                              child: Icon(
                                Icons.pages,
                                size: 30,
                                color: Colors.amber,
                              ),
                            )
                          ],
                        ),
                      );
                    }),
                  );
                },
              ),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                color: Colors.amber.withOpacity(0.9),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    ' $page ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        appBar: appBar,
        body: SafeArea(
          child: Consumer<CryptoProvider>(
            builder: (context, value, child) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  const SearchBarWidget(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [],
                  ),
                  const SizedBox(height: 10),
                  NotificationListener<UserScrollNotification>(
                    onNotification: (notification) {
                      final ScrollDirection direction = notification.direction;
                      setState(() {
                        if (direction == ScrollDirection.reverse) {
                          _isVisible = false;
                        } else if (direction == ScrollDirection.forward) {
                          _isVisible = true;
                        }
                      });
                      return true;
                    },
                    child: Expanded(
                      child: CryptoListWidget(),
                    ),
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
