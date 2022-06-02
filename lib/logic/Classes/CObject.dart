import 'package:flutter_application_1/logic/Classes/TimeListen.dart';
import 'package:flutter_application_1/logic/DataStructure/DTime.dart';
import 'package:flutter_application_1/logic/interface/ITimeSlave.dart';

class CObject extends ITimeSlave with TimeListen {
  CObject() {
    timeListen(this);
  }

  @override
  void dayChange(DTime newTime) {
    print(newTime);
  }
}
