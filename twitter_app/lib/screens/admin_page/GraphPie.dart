// ignore_for_file: file_names, avoid_unnecessary_containers, unnecessary_new, prefer_typing_uninitialized_variables, non_constant_identifier_names, unused_element

import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:http/http.dart' as http;
import 'dart:convert';

class GraphPie extends StatefulWidget {
  final String token;
  const GraphPie({Key key, @required this.token}) : super(key: key);
  @override
  _GraphPie createState() => _GraphPie();
}

class _GraphPie extends State<GraphPie> {
  static const String BaseURL = "http://twi-jay.me:8080";
  Future<List> returnedDataGraphPieFuture;
  var returnedGraphPieData = [];
  List<charts.Series<PieCircle, String>> _seriesPieData;

  Future<List> pieGraphIntegeration(token) async {
    final allDataPieReturned = [];
    int count1 = 0;
    String name1 = '';
    int count2 = 0;
    String name2 = '';
    var response = await http.get(
      Uri.parse(
        '$BaseURL/admin/dashBoard',
      ),
      headers: {'x-access-token': token},
    );
    setState(() {
      Map pieResponse0 = json.decode(response.body)[8];
      var pieResponse = pieResponse0['users_Ages'];
      count1 = pieResponse[0]['persons'];
      name1 = pieResponse[0]['age'];
      count2 = pieResponse[1]['persons'];
      name2 = pieResponse[1]['age'];
      allDataPieReturned.addAll([
        name1,
        count1,
        name2,
        count2,
      ]);
    });
    return allDataPieReturned;
  }

  @override
  void initState() {
    super.initState();
    _seriesPieData = <charts.Series<PieCircle, String>>[];
    returnedDataGraphPieFuture = pieGraphIntegeration(widget.token);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List>(
          future: returnedDataGraphPieFuture,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              returnedGraphPieData = snapshot.data;
              _generateData(
                returnedGraphPieData[0],
                returnedGraphPieData[1],
                returnedGraphPieData[2],
                returnedGraphPieData[3],
              );
              return charts.PieChart<String>(
                _seriesPieData,
                animate: true,
                animationDuration: const Duration(seconds: 3),
                behaviors: [
                  charts.DatumLegend(
                    outsideJustification:
                        charts.OutsideJustification.endDrawArea,
                    horizontalFirst: false,
                    desiredMaxRows: 2,
                    desiredMaxColumns: 4,
                    cellPadding: const EdgeInsets.only(right: 4, bottom: 4),
                    entryTextStyle: charts.TextStyleSpec(
                      color: charts.MaterialPalette.purple.shadeDefault,
                      fontFamily: 'Georgia',
                      fontSize: 7,
                    ),
                  ),
                ],
                defaultRenderer: new charts.ArcRendererConfig(
                  // customRendererId: 'novoId',
                  arcWidth: 100,
                  arcRendererDecorators: [
                    new charts.ArcLabelDecorator(
                        labelPadding: 10,
                        labelPosition: charts.ArcLabelPosition.inside),
                  ],
                ),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }

  _generateData(text1, age1, text2, age2) {
    var pieData = [
      PieCircle(text1, age1, Colors.green),
      PieCircle(text2, age2, Colors.red),
    ];
    //_seriesPieData = [];

    _seriesPieData.add(
      charts.Series(
          data: pieData,
          domainFn: (PieCircle pie, _) => pie.text,
          measureFn: (PieCircle pie, _) => pie.age,
          colorFn: (PieCircle pie, _) =>
              charts.ColorUtil.fromDartColor(pie.color),
          id: ' Age Users Chart ',
          labelAccessorFn: (PieCircle row, _) => '${row.age}'),
    );
  }
}

class PieCircle {
  var text;
  var age;
  Color color;
  PieCircle(this.text, this.age, this.color);
}
