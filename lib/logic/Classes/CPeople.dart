import 'package:flutter_application_1/logic/Classes/CObject.dart';
import 'package:flutter_application_1/logic/DataStructure/DTime.dart';

class CPeople extends CObject {
  @override
  void dayChange(DTime newTime) {
    if (newTime.day == 25) {
      print('CPeople - 월급 받는날임');
    }
  }
}
