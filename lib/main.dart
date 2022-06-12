import 'package:flutter/material.dart';
import 'package:flutter_application_1/logic/Classes/c_bank_commercial.dart';
import 'package:flutter_application_1/logic/Classes/c_company.dart';
import 'package:flutter_application_1/logic/Classes/c_country.dart';
import 'package:flutter_application_1/logic/Classes/c_people.dart';
import 'package:flutter_application_1/logic/DataStructure/d_account.dart';
import 'package:flutter_application_1/logic/Enum/e_accounttype.dart';
import 'package:flutter_application_1/logic/Enum/e_reservedtag.dart';
import 'package:flutter_application_1/logic/Provider/provider_timechangenotifier.dart';
import 'package:flutter_application_1/ui/dashboard/mainscreen.dart';
import 'package:flutter_application_1/util/constants.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());

  //test code backend run
  CCountry rok = CCountry("대한민국");
  rok.centralBank.issueMoney(BigInt.from(100000000));

  CBCommercial wrbank = CBCommercial(rok,"우리은행");
  rok.centralBank.releaseMoney(wrbank, BigInt.from(10000000));

  CPeople indong = CPeople(rok,"김인동");
  DAccount salaryaccount = wrbank.makeNewAccount(indong, EAccountType.deposit);
  indong.propertyMap[ETag.mainaccount] = salaryaccount;

  CCompany stppp = CCompany(rok,"신유회사");
  DAccount companymaindepositaccount =
      wrbank.makeNewAccount(stppp, EAccountType.deposit);
  stppp.propertyMap[ETag.mainaccount] = companymaindepositaccount;
  //[todo]은행한테 대출해야됨
  stppp.joinCompany(indong, salaryaccount);
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
