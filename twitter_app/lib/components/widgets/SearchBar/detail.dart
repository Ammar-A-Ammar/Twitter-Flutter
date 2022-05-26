import 'package:flutter/material.dart';

import 'datalist.dart';

class Detail extends StatelessWidget {
  final ListWords listWordsDetail;

  Detail({Key key, @required this.listWordsDetail}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          brightness: Brightness.dark,
          title: const Text('Détail', style: TextStyle(color: Colors.white)),
          iconTheme: IconThemeData(color: Colors.white),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(listWordsDetail.titlelist + ' (on detail page)'),
              Text(listWordsDetail.definitionlist),
            ],
          ),
        ));
  }
}
