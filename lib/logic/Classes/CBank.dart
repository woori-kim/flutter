import 'package:flutter_application_1/logic/Classes/CObject.dart';
import 'package:flutter_application_1/logic/DataStructure/DTime.dart';

class CBank extends CObject {
  @override
  void dayChange(DTime newTime) {
    if (newTime.day == 5) {
      print('CBank - 대출이자 가져가는날임');
    }
  }
}
