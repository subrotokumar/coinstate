import 'package:flutter/material.dart';

import './search_bar_widget.dart';
import '../pages/about.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle whiteFont = const TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: 18,
    );
    return SafeArea(
      child: Drawer(
        elevation: 0,
        backgroundColor: Colors.black87,
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.5,
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: SearchBarWidget(),
                  ),
                  // ListTile(
                  //   title: Text(
                  //     "Home",
                  //     style: whiteFont,
                  //   ),
                  //   onTap: () {
                  //     Navigator.canPop(context);
                  //   },
                  // ),
                  ListTile(
                    title: Text(
                      "About",
                      style: whiteFont,
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, About.route);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
