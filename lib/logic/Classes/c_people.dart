import 'package:flutter_application_1/logic/Classes/c_object.dart';
import 'package:flutter_application_1/logic/DataStructure/d_time.dart';

class CPeople extends CObject {
  CPeople(super.name);

  @override
  void dayChange(DTime newTime) {
    if (newTime.day == 25) {
      print('CPeople - 월급 받는날임');
    }
  }
}
