import 'package:flutter_application_1/logic/DataStructure/d_time.dart';
import 'package:flutter_application_1/logic/Subject/subject_pool.dart';
import 'package:flutter_application_1/logic/interface/i_time.dart';
import 'package:flutter_application_1/logic/interface/i_timeslave.dart';
import 'package:flutter_application_1/util/constants.dart';

class TimeConsumer extends ITime {
  static final TimeConsumer _instance = TimeConsumer._internalConstructor();

  factory TimeConsumer() {
    return _instance;
  }

  TimeConsumer._internalConstructor() {
    var sp = SubjectPool();
    var timesubject = sp.subjects[skTime];

    timesubject.stream.listen((event) {
      updateTime(event);
    });
  }

  List<ITimeSlave> timeslaves = [];

  @override
  void addTimeSlave(ITimeSlave newslave) {
    timeslaves.add(newslave);
  }

  @override
  void updateTime(DTime newTime) {
    for (var element in timeslaves) {
      element.dayChange(newTime);
    }
  }
}
