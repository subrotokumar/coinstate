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
    ;
    return RefreshIndicator(
      onRefresh: () => Provider.of<CryptoProvider>(context, listen: false)
          .getData(page: page),
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SafeArea(
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    InkWell(
                                      onTap: () => setState(() {
                                        if (currentPage >= 11)
                                          currentPage -= 10;
                                        else
                                          currentPage = 1;
                                      }),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Icon(
                                          Icons.keyboard_double_arrow_left,
                                          color: Colors.amber,
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        if (currentPage > 1) {
                                          setState(() => currentPage--);
                                        }
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Icon(Icons.arrow_back_ios,
                                            color: Colors.white),
                                      ),
                                    ),
                                    InkWell(
                                      onLongPress: () =>
                                          setState(() => currentPage = 1),
                                      child: Text(
                                        'PAGE : $currentPage',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        if (currentPage < 100) {
                                          setState(() => currentPage++);
                                        }
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Icon(
                                          Icons.arrow_forward_ios,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () => setState(() {
                                        if (currentPage <= 90)
                                          currentPage += 10;
                                        else
                                          currentPage = 100;
                                      }),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Icon(
                                          Icons.keyboard_double_arrow_right,
                                          color: Colors.amber,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                OutlinedButton(
                                  onPressed: () {
                                    if (currentPage == page) return;
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
            body: Consumer<CryptoProvider>(
              builder: (context, value, child) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "COINSTATE",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 22,
                          ),
                        ),
                        GestureDetector(
                          onTap: () =>
                              Navigator.pushNamed(context, About.route),
                          child: const Icon(Icons.developer_board),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    const SearchBarWidget(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [],
                    ),
                    const SizedBox(height: 10),
                    NotificationListener<UserScrollNotification>(
                      onNotification: (notification) {
                        final ScrollDirection direction =
                            notification.direction;
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
            backgroundColor: Colors.white12,
          ),
        ),
      ),
    );
  }
}
