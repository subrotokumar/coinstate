import 'dart:convert';
// import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:cryptobook/models/cryptocurrency.dart';
import "package:flutter/material.dart";
import "../api/api_Data.dart";
import './crypto_tile_widget.dart';

class CryptoListWidget extends StatefulWidget {
  CryptoListWidget({Key? key}) : super(key: key);

  @override
  State<CryptoListWidget> createState() => _CryptoListWidgetState();
}

class _CryptoListWidgetState extends State<CryptoListWidget> {
  List<Cryptocurrency> coinList = [];
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    getNews();
  }

  getNews() async {
    ApiData obj = ApiData();
    coinList = await obj.getApiData();
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _loading
        ? const Center(
            child: CircularProgressIndicator(
              color: Colors.white,
            ),
          )
        : ListView.builder(
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            itemCount: coinList.length,
            itemBuilder: (context, i) {
              return CryptoTile(coinList[i]);
            },
          );
  }
}
