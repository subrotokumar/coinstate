import 'package:cached_network_image/cached_network_image.dart';
import 'package:cryptobook/widgets/local/chart_widget.dart';
import 'package:flutter/material.dart';
import 'package:screenshot/screenshot.dart';

import '../services/models/cryptocurrency.dart';
import '../widgets/global/send_screenshot.dart';
import '../widgets/local/chart_filter.dart';
import '../widgets/local/description.dart';

class DetailPage extends StatelessWidget {
  static String route = '/detail-page';
  final Cryptocurrency coin;
  DetailPage(this.coin, {Key? key}) : super(key: key);

  ScreenshotController screenshotController = ScreenshotController();

  Widget _buildAmount() {
    return Center(
      child: Column(
        children: [
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "${coin.price} USD",
                  style: const TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          _buildPercentageChage(),
        ],
      ),
    );
  }

  Widget _buildPercentageChage() {
    return Text(
      "${coin.priceChange1D.substring(0, coin.priceChange1D.indexOf(".") + 4)}%",
      style: TextStyle(
        color: coin.priceChange1D.contains("-") ? Colors.red : Colors.green,
        fontWeight: FontWeight.bold,
        fontSize: 18,
      ),
    );
  }

  Widget detailSection() {
    Widget detailTile(String str1, String str2) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            str1,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold),
          ),
          Text(
            str2,
            style: const TextStyle(color: Colors.white),
          ),
        ],
      );
    }

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 22.0,
        vertical: 10,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(children: [
              detailTile('High', "\$ ${coin.high_24h}"),
              const Divider(color: Colors.white, thickness: 0.2),
              detailTile('Low', "\$ ${coin.low_24h}"),
              const Divider(color: Colors.white, thickness: 0.3),
              detailTile('24h vol.', '${coin.priceChange1D}%'),
            ]),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Divider(
              color: Colors.red,
              thickness: 1.0,
            ),
          ),
          Expanded(
            child: Column(
              children: [
                detailTile('Symbol', coin.symbol.toUpperCase()),
                const Divider(color: Colors.white, thickness: 0.2),
                detailTile('Rank', coin.rank),
                const Divider(color: Colors.white, thickness: 0.5),
                detailTile('MKT CAP', "\$${coin.marketCap}"),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _coinIcon() {
    return Hero(
      tag: coin.name,
      child: CachedNetworkImage(
        imageUrl: coin.logoUrl,
        imageBuilder: (context, imageProvider) => Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
          ),
        ),
        progressIndicatorBuilder:
            (BuildContext context, url, downloadProgress) =>
                const CircularProgressIndicator(
          color: Colors.black,
          strokeWidth: 1,
        ), //placeholder while downloading file.
      ),
    );
  }

  Widget titleSection() {
    return Padding(
      padding: const EdgeInsets.all(30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _coinIcon(),
          const SizedBox(width: 8),
          _buildAmount(),
        ],
      ),
    );
  }

  var src = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Screenshot(
      controller: screenshotController,
      child: Scaffold(
        appBar: AppBar(
          title: Text(coin.name.toUpperCase()),
          backgroundColor: Colors.transparent,
          centerTitle: true,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              titleSection(),
              Divider(color: Colors.white10),
              detailSection(),
              Divider(color: Colors.white10),
              SizedBox(height: 10),
              ChartWidget(coin.id),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(
                    top: 3, right: 10, bottom: 70, left: 10),
                child: Column(
                  children: [
                    Card(
                      elevation: 10,
                      color: Colors.black12.withOpacity(0.05),
                      // shadowColor: Colors.white10,
                      child: Flexible(
                        child: Column(
                          children: [
                            const SizedBox(height: 12),
                            Text(
                              coin.id.toUpperCase(),
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 16),
                              textAlign: TextAlign.justify,
                            ),
                            Description(coin.id),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        backgroundColor: Colors.white12,
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            SendScreenshot(
              controller: screenshotController,
              text: 'Latest ${coin.name.toUpperCase()} price-feed',
            );
          },
          child: const Icon(Icons.share, color: Colors.white),
        ),
      ),
    );
  }
}
