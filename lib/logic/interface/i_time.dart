import 'package:flutter_application_1/logic/DataStructure/d_time.dart';
import 'package:flutter_application_1/logic/interface/i_timeslave.dart';

abstract class ITime {
  void addTimeSlave(ITimeSlave newslave);
  void updateTime(DTime newTime);
}
