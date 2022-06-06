import 'package:flutter_application_1/logic/Consumer/consumer_time.dart';
import 'package:flutter_application_1/logic/interface/i_timeslave.dart';

mixin TimeListen{
  timeListen(ITimeSlave newslave) {
    TimeConsumer tc = TimeConsumer();
    tc.addTimeSlave(newslave);
  }
}
