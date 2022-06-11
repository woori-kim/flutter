import 'package:flutter_application_1/logic/DataStructure/d_history.dart';

class DCareTaker {
  List<DHistory> list = [];

  set addMemento(DHistory history) => list.add(history);
  List<DHistory> get history => list;
}
