import 'package:flutter/material.dart';

class LoggedInWidget extends StatelessWidget {
  LoggedInWidget({Key key}) : super(key: key);

  // final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        // child: Scaffold(
        appBar: AppBar(
          title: Text('Logged In'),
          centerTitle: true,
          actions: [
            TextButton(
              onPressed: () {},
              child: Text(
                'logout',
                style: TextStyle(color: Colors.red),
              ),
            )
          ],
        ),
        body: Container(
          alignment: Alignment.center,
          color: Colors.blueGrey.shade700,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'User Profile',
                style: TextStyle(fontSize: 24),
              ),
              FloatingActionButton(onPressed: () {})
            ],
          ),
        ),
      ),
    );
  }
}
