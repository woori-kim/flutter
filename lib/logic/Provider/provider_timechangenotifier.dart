import 'package:flutter/foundation.dart';
import 'package:flutter_application_1/logic/DataStructure/d_time.dart';
import 'package:flutter_application_1/util/constants.dart';



class TimeChangeNotifier extends ChangeNotifier {
  int _day = initialDay;
  int _month = initialMonth;
  int _year = initialYear;

  final lastDay = <int>[31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];

  void oneday() {
    _day++;
    if (_day > lastDay[_month - 1]) {
      _day = 1;
      _month++;
      if (_month > 12) {
        _month = 1;
        _year++;
        if (_year % 4 == 0) {
          lastDay[1] = 29; //leap year
        } else {
          lastDay[1] = 28;
        }
      }
    }

    notifyListeners();
  }

  DTime get today => DTime(_year, _month, _day);
}
