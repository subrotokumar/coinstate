import 'package:flutter/material.dart';

class SearchBarWidget extends StatefulWidget {
  SearchBarWidget({Key? key}) : super(key: key);

  @override
  State<SearchBarWidget> createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {
  final str = TextEditingController();

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
        children: const [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Icon(
              Icons.search,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
