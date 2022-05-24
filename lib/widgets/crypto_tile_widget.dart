import 'package:cryptobook/models/cryptocurrency.dart';
import "package:flutter/material.dart";
import 'package:flutter_svg/flutter_svg.dart';

class CryptoTile extends StatelessWidget {
  final Cryptocurrency coin;
  const CryptoTile(this.coin, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onDoubleTap: () {},
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.white,
          child: SvgPicture.network(
            coin.logoUrl,
            semanticsLabel: 'SVG From Network',
            placeholderBuilder: (BuildContext context) => Container(
              child: const CircularProgressIndicator(
                color: Colors.black,
                strokeWidth: 1,
              ),
            ), //placeholder while downloading file.
          ),
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
              "₹${coin.price.substring(0, coin.price.indexOf('.') + 3)}",
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),
            Text(
              coin.priceChange1D,
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
