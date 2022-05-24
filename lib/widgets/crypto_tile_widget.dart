import 'package:cryptobook/models/cryptocurrency.dart';
import "package:flutter/material.dart";
import 'package:flutter_svg/flutter_svg.dart';

class CryptoTile extends StatelessWidget {
  final Cryptocurrency coin;
  const CryptoTile(this.coin, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.transparent,
        child: SvgPicture.network(
          coin.logoUrl,
          semanticsLabel: 'SVG From Network',
          placeholderBuilder: (BuildContext context) => Container(
            padding: const EdgeInsets.all(30.0),
            child: const CircularProgressIndicator(
              color: Colors.white,
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
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
          ),
          Text(
            coin.priceChange1D,
            style: const TextStyle(
              color: Colors.green,
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
