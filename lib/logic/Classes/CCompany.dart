import 'package:flutter_application_1/logic/Classes/CObject.dart';
import 'package:flutter_application_1/logic/DataStructure/DTime.dart';

class CCompany extends CObject {
  @override
  void dayChange(DTime newTime) {
    if (newTime.day == 25) {
      print('CCompany - CPeople한테 월급 주는날');
    }
  }
}
