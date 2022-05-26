// import 'package:http/http.dart' as http;
// import 'package:flutter/material.dart';
// import 'dart:convert';

// verificationIntegerate(
//   String theCodeThatPassed,
//   String token,
// ) async {
//   Map data = {
//     'verificationCode': theCodeThatPassed,
//   };
//   //var jsonData = null;
//   const String BaseURL = 'http://twi-jay.me:8080';

//   Map mapResponse;
//   Map dataResponse;
//   var response =
//       await http.post(Uri.parse('$BaseURL/auth/confirmation'), body: data);
//   print('we r here');
//   if (response.statusCode == 200) {
//     mapResponse = json.decode(response.body);
//     dataResponse = mapResponse;
//     token = dataResponse["accessToken"];
//     setState(
//       () {
//         //dataResponse = mapResponse["data"];
//         //dataResponse["role"].toString() == 'Admin'
//         print('zuuuuuuuperrrrrrrr');
//         print(token);
//         Navigator.of(context).pushAndRemoveUntil(
//             MaterialPageRoute(
//                 builder: (BuildContext context) => CustomNavBar(token: token)),
//             (Route<dynamic> route) => false);
//         dataResponse = mapResponse;
//       },
//     );
//   } else if (response.statusCode == 400) {
//     print('bad request');
//   } else if (response.statusCode == 401) {
//     print('Unauthorized');
//   } else if (response.statusCode == 404) {
//     print('Not Found');
//   } else if (response.statusCode == 500) {
//     print('Internal Server Error');
//   }
// }
