import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class About extends StatelessWidget {
  static String route = "/About";
  const About({Key? key}) : super(key: key);

  Widget textWidget(String data) {
    return Text(data, style: const TextStyle(color: Colors.white));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ABOUT"),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: GestureDetector(
              onTap: () {
                Share.share(
                    "Hey, checkout this awesome cryptocurrency app on GitHub: https://github.com/subrotokumar/cryptobook");
              },
              child: const Icon(Icons.share),
            ),
          )
        ],
      ),
      // drawer: const DrawerWidget(),
      backgroundColor: Colors.white12,
      body: Container(
        margin: const EdgeInsets.all(15),
        padding: const EdgeInsets.all(15),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white10,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 80, child: Image.asset("assets/meta/icon.png")),
            const SizedBox(
              height: 20,
            ),
            textWidget("CryptoBook"),
            const Divider(color: Colors.white),
            textWidget("All-in-one Crytocurrency Solution for Mobile."),
            const SizedBox(height: 20),
            const Divider(color: Colors.white),
            textWidget("Contact with me: "),
            textWidget("Linkedin: www.linkedin.com/in/kumarsubroto"),
            textWidget("Twitter: @SubrotoKr"),
            textWidget("GitHub: @Subrotokumar"),
            const Divider(color: Colors.white),
          ],
        ),
      ),
    );
  }
}
