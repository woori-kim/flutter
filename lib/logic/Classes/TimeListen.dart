import 'package:flutter_application_1/logic/Consumer/TimeConsumer.dart';
import 'package:flutter_application_1/logic/interface/ITimeSlave.dart';

mixin TimeListen{
  timeListen(ITimeSlave newslave) {
    TimeConsumer tc = TimeConsumer();
    tc.addTimeSlave(newslave);
  }
}
