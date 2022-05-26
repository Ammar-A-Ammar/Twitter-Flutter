import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'dart:convert';

void login() async {
  String vartoken;
  http.Request request =
      http.Request('POST', Uri.parse('settings/ChangePassword'));
  request.headers.addAll({"de7k": "7", "x-access-token": vartoken});
  request.body =
      '{ "currentPassword": "any", "password": "any","confirmNewPassword": "any"}';

  request.body = jsonEncode({"": ""});
  http.Client client = http.Client();

  http.Response response =
      await http.Response.fromStream(await client.send(request));
  response.reasonPhrase;
  response.body;
}
