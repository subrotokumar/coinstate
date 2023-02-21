import 'dart:convert';
import 'package:chart_sparkline/chart_sparkline.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:screenshot/screenshot.dart';

class ChartWidget extends StatefulWidget {
  const ChartWidget(this.id, {super.key});
  final String id;

  @override
  State<ChartWidget> createState() => _ChartWidgetState();
}

class _ChartWidgetState extends State<ChartWidget> {
  bool isLoading = false;
  List<double> _1D = [];
  List<double> _1W = [];
  List<double> _14D = [];
  List<double> _1M = [];
  List<double> _1Y = [];

  @override
  void initState() {
    getData();
    super.initState();
  }

  int count = 0;

  Future<void> getData() async {
    String id = widget.id;
    if (_1D.isEmpty) _1D = await fetchData(id, 1, 'minute');
    setState(() {
      if (_1D.isNotEmpty) count++;
    });
    if (_1W.isEmpty) _1W = await fetchData(id, 7, 'hourly');
    setState(() {
      if (_1W.isNotEmpty) count++;
    });
    if (_14D.isEmpty) _14D = await fetchData(id, 14, 'hourly');
    setState(() {
      if (_14D.isNotEmpty) count++;
    });
    if (_1M.isEmpty) _1M = await fetchData(id, 30, 'hourly');
    setState(() {
      if (_1M.isNotEmpty) count++;
    });
    if (_1Y.isEmpty) _1Y = await fetchData(id, 365, 'weakly');
    setState(() {
      if (_1Y.isNotEmpty) count++;
      isLoading = false;
    });
  }

  Future<List<double>> fetchData(String id, int days, String interval) async {
    var response = await http.get(Uri.parse(
        'https://api.coingecko.com/api/v3/coins/$id/market_chart?vs_currency=usd&days=$days&interval=$interval'));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['prices'] as List;
      List<double> newData = [];
      for (var i in data) {
        newData.add(i[1]);
        double a = 14.352464321516.toPrecision(4);
      }
      print(newData);
      return newData;
    }
    return [];
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: count > 0,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        padding: EdgeInsets.all(10),
        height: 240,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.black12,
          borderRadius: BorderRadius.circular(20),
          // border: Border.all(color: Colors.white10, width: 0.5),
        ),
        child: DefaultTabController(
          length: count,
          child: Column(
            children: [
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: TabBarView(
                    children: [
                      ChartTile(_1D),
                      ChartTile(_1W),
                      ChartTile(_14D),
                      ChartTile(_1M),
                      ChartTile(_1Y),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10),
              SizedBox(
                height: 25,
                child: Center(
                  child: TabBar(
                    indicatorColor: Colors.white24,
                    isScrollable: true,
                    tabs: [
                      Visibility(
                        child: Text('1 D'),
                        visible: _1D.isNotEmpty,
                      ),
                      Visibility(
                        child: Text('1 W'),
                        visible: _1W.isNotEmpty,
                      ),
                      Visibility(
                        child: Text('14 D'),
                        visible: _14D.isNotEmpty,
                      ),
                      Visibility(
                        child: Text('1 M'),
                        visible: _1M.isNotEmpty,
                      ),
                      Visibility(
                        child: Text('1 Y'),
                        visible: _1Y.isNotEmpty,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ChartTile extends StatelessWidget {
  ChartTile(this.data, {super.key});
  final List<double> data;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: data.isNotEmpty,
      child: Sparkline(
        data: data,
        lineColor: Colors.white,
      ),
    );
  }
}
