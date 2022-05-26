import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
