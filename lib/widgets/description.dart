import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:lottie/lottie.dart';

import '../services/api_data.dart';

class Description extends StatefulWidget {
  String id;
  Description(this.id, {super.key});

  bool loading = true;
  String desc = "";
  @override
  State<Description> createState() => _DescriptionState();
}

class _DescriptionState extends State<Description> {
  @override
  void initState() {
    getData();
    super.initState();
  }

  void getData() async {
    widget.desc = await ApiData.getDescription(widget.id);
    setState(() {
      widget.loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    var htmldata = widget.desc;
    return widget.loading
        ? Center(
            child: Lottie.asset('assets/lotties/loading.json', width: 200),
          )
        : Html(
            data: htmldata,
            style: {
              "body": Style(
                textAlign: TextAlign.justify,
                color: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 5),
              ),
            },
          );
  }
}
