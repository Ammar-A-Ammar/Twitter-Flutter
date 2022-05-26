// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:twitter_app/components/widgets/CustomNavBar2.0.dart';

//import 'package:flutter/services.dart';

import './screens/welcome/welcome_screen.dart';
import 'components/widgets/DarkMode/themeclass.dart';
import '../../API/userdata.dart';
//import 'package:firebase_core/firebase_core.dart';

Future main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // // ignore: await_only_futures
  // await Firebase.initializeApp();
  // await Hive.initFlutter();
  // Hive.registerAdapter(TransactionAdapter());
  // await Hive.openBox<Transaction>('transactions');

  runApp(MyApp());

  /* try {
    runApp(MyApp());
  } on PlatformException catch (e) {
    print('failed to pick image: $e');
  } */
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Twitter_app',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: ThemeClass.lightTheme,
      darkTheme: ThemeClass.darkTheme,
      home: userdata.token == null ? WelcomeScreen() : CustomNavBar(),
      localizationsDelegates: [
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        Locale("en"),
        Locale("ar"),
      ],
    );
    // ChangeNotifierProvider(
    //   create: (context) => GoogleSignInProvider(),
    //   child:
    // ChangeNotifierProvider(
    //     create: (context) => ThemeProvider(),
    //     builder: (context, _) {
    //       final themeProvider = Provider.of<ThemeProvider>(context);
    //       return MaterialApp(
    //         themeMode: themeProvider.themeMode,
    //         theme: MyThemes.lightTheme,
    //         darkTheme: MyThemes.darkTheme,
    //         home: WelcomeScreen(),
    //       );
    //     },
    //   );
  }
}
