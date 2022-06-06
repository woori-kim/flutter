import 'package:flutter/material.dart';
import 'package:flutter_application_1/logic/Classes/c_bank.dart';
import 'package:flutter_application_1/logic/Classes/c_company.dart';
import 'package:flutter_application_1/logic/Classes/c_people.dart';
import 'package:flutter_application_1/logic/Provider/provider_timechangenotifier.dart';
import 'package:flutter_application_1/ui/dashboard/mainscreen.dart';
import 'package:flutter_application_1/util/constants.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());

  //test code
  CPeople();
  CBank();
  CCompany();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: appTitle,
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
        ),
        home: MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (context) => TimeChangeNotifier())
          ],
          child: const MainScreen(),
        ));
  }
}
