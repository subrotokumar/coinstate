import 'package:cryptobook/services/providers/crypto_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchBarWidget extends StatefulWidget {
  const SearchBarWidget({Key? key}) : super(key: key);

  @override
  State<SearchBarWidget> createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {
  final str = TextEditingController();

  @override
  void dispose() {
    str.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(
          color: Colors.white.withOpacity(0.5),
          width: 1.0,
        ),
      ),
      child: Row(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Icon(
              Icons.search,
              color: Colors.white,
            ),
          ),
          Expanded(
            child: TextField(
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold),
              cursorColor: Colors.white,
              controller: str,
              decoration: const InputDecoration(
                hintStyle: TextStyle(color: Colors.white),
                hintText: "Search",
                iconColor: Colors.white,
                border: InputBorder.none,
              ),
              onChanged: (value) {
                var provider =
                    Provider.of<CryptoProvider>(context, listen: false);
                provider.setFilterString(str.text);
                if (provider.getCoinList.isEmpty) {
                  provider.getData();
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
