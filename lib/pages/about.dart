import 'package:flutter/material.dart';
import 'package:screenshot/screenshot.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../widgets/global/send_screenshot.dart';
import '../widgets/global/social_link.dart';

class About extends StatelessWidget {
  static String route = "/About";
  About({Key? key}) : super(key: key);

  Widget textWidget(String data) {
    return Text(data, style: const TextStyle(color: Colors.white));
  }

  ScreenshotController controller = ScreenshotController();

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
                SendScreenshot(
                  controller: controller,
                  text:
                      'Download Coinstate: www.github.com/subrotokumar/cryptobook',
                );
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
            Screenshot(
              controller: controller,
              child: Container(
                color: Colors.transparent,
                child: Column(
                  children: [
                    SizedBox(height: 20),
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 42,
                      child: SizedBox(
                          height: 80,
                          child: Image.asset("assets/meta/icon.png")),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      'COINSTATE',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 22),
                    ),
                    Text(
                      'Powered By CoinGecko',
                      style: TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                    const Divider(color: Colors.white12),
                    const SizedBox(height: 10),
                    textWidget("Your Personal Cryptocurrency Handbook"),
                    SizedBox(height: 10),
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.white,
                      ),
                      onPressed: () {
                        launchUrlString(
                            'https://play.google.com/store/apps/details?id=com.subrotokumar.coinstate',
                            mode: LaunchMode.externalNonBrowserApplication);
                      },
                      child: Text('Rate us on Playstore'),
                    ),
                    const SizedBox(height: 10),
                    const Divider(color: Colors.white12),
                  ],
                ),
              ),
            ),
            Text(
              'CONNECT',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GitHub(username: 'subrotokumar'),
                Twitter(username: 'isubrotokumar'),
              ],
            ),
            Divider(color: Colors.white12),
          ],
        ),
      ),
    );
  }
}
