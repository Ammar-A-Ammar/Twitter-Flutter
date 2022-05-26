// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../components/text_field_container.dart';
import '../unused/transaction.dart';

import '../components/rounded_button.dart';
import '../screens/Login/background_for_login_screen.dart';
import 'boxes.dart';

class BodyForSignUpScreen3 extends StatefulWidget {
  const BodyForSignUpScreen3({
    Key key,
    this.onClickedFinish,
    this.transaction,
  }) : super(key: key);
  final Transaction transaction;
  final Function(String email, String password) onClickedFinish;

  @override
  State<BodyForSignUpScreen3> createState() => _BodyForSignUpScreen3State();
}

class _BodyForSignUpScreen3State extends State<BodyForSignUpScreen3> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  /* @override
  void initState() {
    super.initState();

    if (widget.transaction != null) {
      final transaction = widget.transaction;

      emailController.text = transaction.name;
      passwordController.text = transaction.passwordPassed;
    }
  } */

  /* @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }

   */

  @override
  void dispose() {
    // Hive.box('transactions').close();
    Hive.close();
    super.dispose();
  }

  // ignore: missing_return
  Future addTransaction(String name, String passwordPassed) {
    final transaction = Transaction();
    /* ..name = emailController as String
      ..createdDate = DateTime.now()
      ..passwordPassed = passwordController as String; */

    print('i get hereeeeeeeeeeeeeeee');

    final box = Boxes.getTransactions();
    // box.add(transaction);
    box.put('1', transaction);

    final mybox = Boxes.getTransactions();
    final myTransaction = mybox.get('1');
    mybox.values;
    mybox.keys;

    print(mybox.values);
    print(mybox.keys);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: BackGroundForLoginScreen(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Create your account',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                height: 5.5,
              ),
            ),
            TextFieldContainer(
              size: size,
              titleText: '  Name',
              passedOnChanged: (value) {},
            ),
            TextFieldContainer(
              size: size,
              titleText: '  Email',
              passedOnChanged: (value) {},
            ),
            SizedBox(
              //height: size.height,
              width: size.width * 0.9,
              height: 70,
            ),
            Text(
              'Date of birth',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                height: 1,
              ),
            ),
            Text(
              'This will not be shown publicly. Confirm your own age',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[800],
                //fontWeight: FontWeight.bold,
                //height: 5.5,
              ),
            ),
            Text(
              'even if this account is for a business, a pet, or     ',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[800],
              ),
            ),
            Text(
              'something else.',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[800],
              ),
            ),
            /* SizedBox(
              //height: size.height,
              width: size.width * 0.9,
              height: 10,
            ), */
            TextFieldContainer(
              size: size,
              titleText: '  Date of birth',
              TapeddFunction: () {
                {
                  showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime.now(),
                  );
                }
              },
              /* passedOnChanged: (value) {
                showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime.now(),
                );
              }, */
            ),
            /* SizedBox(
              height: size.height * 0.07,
            ), */
            RoundedButton(
              passedText: 'Next',
              textColor: Colors.white,
              pressed: () {
                final name = emailController.text;
                final password = passwordController.text;
                addTransaction(name, password);
                //print(name);
                //print(passwordController);
                //Navigator.of(context).pop();
              },
              //() {},
              colorPassed: Colors.grey[700],
              marginValue: 3,
              roundedpassedcolor: Colors.grey,
              highlightPassedColor: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}

/* class BodyForSignUpScreen extends StatelessWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  BodyForSignUpScreen({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BackGroundForLoginScreen(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Create your account',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              height: 5.5,
            ),
          ),
          TextFieldContainer(
            size: size,
            titleText: '  Name',
            passedOnChanged: (value) {},
          ),
          TextFieldContainer(
            size: size,
            titleText: '  Email',
            passedOnChanged: (value) {},
          ),
          SizedBox(
            //height: size.height,
            width: size.width * 0.9,
            height: 70,
          ),
          Text(
            'Date of birth',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              height: 1,
            ),
          ),
          Text(
            'This will not be shown publicly. Confirm your own age',
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[800],
              //fontWeight: FontWeight.bold,
              //height: 5.5,
            ),
          ),
          Text(
            'even if this account is for a business, a pet, or     ',
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[800],
            ),
          ),
          Text(
            'something else.',
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[800],
            ),
          ),
          SizedBox(
            //height: size.height,
            width: size.width * 0.9,
            height: 10,
          ),
          TextFieldContainer(
            size: size,
            titleText: '  Date of birth',
            passedOnChanged: (value) {
              showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(2022),
                lastDate: DateTime.now(),
              );
            },
          ),
          SizedBox(
            height: size.height * 0.07,
          ),
          RoundedButton(
            passedText: 'Next',
            textColor: Colors.white,
            pressed: addTransaction, //() {},
            colorPassed: Colors.grey[700],
            marginValue: 3,
            roundedpassedcolor: Colors.grey,
            highlightPassedColor: Colors.grey,
          ),
        ],
      ),
    );
  } */

