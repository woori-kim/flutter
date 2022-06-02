import 'package:flutter_application_1/logic/DataStructure/DTime.dart';
import 'package:flutter_application_1/logic/interface/ITimeSlave.dart';

abstract class ITime {
  void addTimeSlave(ITimeSlave newslave);
  void updateTime(DTime newTime);
}
