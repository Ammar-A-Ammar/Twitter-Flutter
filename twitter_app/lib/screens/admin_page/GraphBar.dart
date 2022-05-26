// ignore_for_file: file_names, non_constant_identifier_names, avoid_print, prefer_typing_uninitialized_variables, prefer_const_constructors_in_immutables, camel_case_types, unused_element, prefer_equal_for_default_values, use_function_type_syntax_for_parameters

import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:http/http.dart' as http;
import 'dart:convert';

class GraphBar extends StatefulWidget {
  final String token;
  GraphBar({Key key, @required this.token}) : super(key: key);
  @override
  _GraphBar createState() => _GraphBar();
}

class _GraphBar extends State<GraphBar> {
  static const String BaseURL = "http://twi-jay.me:8080";
  Future<List> returnedDataGraphBarFuture;
  var returnedData = [];

  List<charts.Series<TaskBar, String>> _seriesPieData;
  int count1 = 5;
  String user1 = '1';
  int count2 = 10;
  String user2 = '2';
  int count3 = 1;
  String user3 = '3';
  int count4 = 15;
  String user4 = '4';
  int count5 = 12;
  String user5 = '5';
  Future<int> datafuture;

  Future<int> GraphBarApi(token) async {
    http.Response response;
    response = await http.get(
      Uri.parse(
        '$BaseURL/admin/dashBoard',
      ),
      headers: {'x-access-token': token},
    );
    setState(() {
      var mapResponse = json.decode(response.body)['noMostFollowed'];
      count1 = mapResponse['stats'][0]['count'];
      user1 = mapResponse['stats'][0]['username'];
      count2 = mapResponse['stats'][1]['count'];
      user2 = mapResponse['stats'][1]['username'];
      count3 = mapResponse['stats'][2]['count'];
      user3 = mapResponse['stats'][2]['username'];
      count4 = mapResponse['stats'][3]['count'];
      user4 = mapResponse['stats'][3]['username'];
      count5 = mapResponse['stats'][4]['count'];
      user5 = mapResponse['stats'][4]['username'];
    });
    return count1;
  }

  Future<List> satsticGraphBarIntegeration(token) async {
    final allDataReturned = [];
    int tweetCount;
    Map mostFollowersResponse;
    var theMostFollowedPerson;
    var theMostFollowedPersonName;
    var theMostFollowedPersonUserName;

    Map dataResponse;
    var response = await http.get(
      Uri.parse(
        '$BaseURL/admin/dashBoard',
      ),
      headers: {'x-access-token': token},
    );
    setState(() {
      Map mapResponse0 = json.decode(response.body)[0];
      //Map mapResponse01 = json.decode(mapResponse0)[0];
      List mostFollowersResponse = mapResponse0['users_With_Most_Followers'];
      Map theMostFollowedPersondata = mostFollowersResponse[0];
      theMostFollowedPersonUserName = theMostFollowedPersondata['name'];
      theMostFollowedPersonUserName = theMostFollowedPersondata['username'];
      print('mapResponse0');
      print(theMostFollowedPersonName);
      print(theMostFollowedPersonUserName);

      Map mapResponse1 = json.decode(response.body)[1];
      tweetCount = mapResponse1['all_Tweets_Count'];

      allDataReturned.addAll([
        tweetCount,
        theMostFollowedPersonName,
        theMostFollowedPersonUserName,
      ]);
      // print('the list');
      // print(allDataReturned[0]);
      // print('this is the tweet count');
      // print(tweetCount);
      //NoBan = dataResponse['count'];
    });
    return allDataReturned;
  }

  @override
  void initState() {
    super.initState();
    _seriesPieData = <charts.Series<TaskBar, String>>[];
    datafuture = GraphBarApi(widget.token);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List>(
        future: returnedDataGraphBarFuture,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            returnedDataGraphBarFuture = snapshot.data as Future<List>;
            _generateData();
            return charts.BarChart(
              _seriesPieData,
              animate: true,
              animationDuration: const Duration(seconds: 3),
              domainAxis: const charts.OrdinalAxisSpec(
                renderSpec: charts.SmallTickRendererSpec(labelRotation: 45),
              ),
              behaviors: [
                charts.DatumLegend(
                  outsideJustification: charts.OutsideJustification.endDrawArea,
                  horizontalFirst: false,
                  desiredMaxRows: 2,
                  cellPadding: const EdgeInsets.only(right: 4.0, bottom: 4.0),
                  entryTextStyle: charts.TextStyleSpec(
                    color: charts.MaterialPalette.purple.shadeDefault,
                    fontFamily: 'Georgia',
                    fontSize: 12,
                  ),
                ),
              ],
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  _generateData() {
    var pieData = [
      TaskBar(user1, count1, Colors.purple),
      TaskBar(user2, count2, Colors.green),
      TaskBar(user3, count3, Colors.blue),
      TaskBar(user4, count4, Colors.red),
      TaskBar(user5, count5, Colors.red),
    ];
    _seriesPieData.add(
      charts.Series(
        data: pieData,
        domainFn: (TaskBar task, _) => task.task,
        measureFn: (TaskBar task, _) => task.taskvalue,
        colorFn: (TaskBar task, _) =>
            charts.ColorUtil.fromDartColor(task.colorval),
        id: 'Most Followed Users',
        labelAccessorFn: (TaskBar row, _) => '${row.taskvalue}',
      ),
    );
  }
}

class TaskBar {
  var task;
  var taskvalue;
  var testt;
  Color colorval;
  TaskBar(this.task, this.taskvalue, this.colorval);
}
