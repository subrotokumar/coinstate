import "package:flutter/material.dart";
import 'package:cached_network_image/cached_network_image.dart';

import '../models/cryptocurrency.dart';

class CryptoTile extends StatelessWidget {
  static String route = "/cryptotile";
  final Cryptocurrency coin;
  const CryptoTile(this.coin, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onDoubleTap: () {},
      child: ListTile(
        leading: CachedNetworkImage(
          imageUrl: coin.logoUrl,
          imageBuilder: (context, imageProvider) => Container(
            width: 40,
            height: 40,
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
        title: Text(
          coin.name,
          style: const TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
        ),
        subtitle: Text(
          coin.symbol.toUpperCase(),
          style: const TextStyle(
              color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 14),
        ),
        trailing: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "₹${coin.price}",
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),
            Text(
              "${coin.priceChange1D.substring(0, coin.priceChange1D.indexOf(".") + 4)}%",
              style: TextStyle(
                color: coin.priceChange1D.contains("-")
                    ? Colors.red
                    : Colors.green,
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
