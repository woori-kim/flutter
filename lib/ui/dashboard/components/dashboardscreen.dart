import 'package:flutter/material.dart';
import 'package:flutter_application_1/logic/DataStructure/DTime.dart';
import 'package:provider/provider.dart';
import 'package:rxdart/rxdart.dart';

import '../../../logic/Provider/TimeChangeNotifier.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
      children: [
        const TimeTable(),
        Consumer<TimeChangeNotifier>(
          builder: (context, value, child) => ElevatedButton(
              onPressed: () {
                value.oneday();
                PublishSubject<DTime> subject = PublishSubject();
                subject.stream.listen((event) {
                  print('on');
                });
                subject.add(DTime(1, 2, 3));
                subject.add(DTime(4, 5, 6));
              },
              child: const Text('진행')),
        ),
      ],
    ));
  }
}

class TimeTableState extends State<TimeTable> {
  @override
  Widget build(BuildContext context) {
    return Consumer<TimeChangeNotifier>(
        builder: (context, value, child) => Text(value.today.toString()));
  }
}

class TimeTable extends StatefulWidget {
  const TimeTable({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => TimeTableState();
}
