import 'package:flutter_application_1/logic/DataStructure/d_time.dart';
import 'package:flutter_application_1/logic/Subject/subject_pool.dart';
import 'package:flutter_application_1/logic/interface/i_time.dart';
import 'package:flutter_application_1/logic/interface/i_timeslave.dart';
import 'package:flutter_application_1/util/constants.dart';

class TimeConsumer extends ITime {
  static final TimeConsumer _instance = TimeConsumer._internalConstructor();
  DTime _today = DTime(initialYear, initialMonth, initialDay);
  final List<ITimeSlave> _timeslaves = [];

  DTime get today => _today;

  factory TimeConsumer() {
    return _instance;
  }

  TimeConsumer._internalConstructor() {
    var sp = SubjectPool();

    sp.subjects[skTime].stream.listen((event) {
      updateTime(event);
    });
  }

  @override
  void addTimeSlave(ITimeSlave newslave) {
    _timeslaves.add(newslave);
  }

  @override
  void updateTime(DTime newTime) {
    _today = newTime;
    for (var slave in _timeslaves) {
      slave.dayChange(newTime);
    }
  }
}
