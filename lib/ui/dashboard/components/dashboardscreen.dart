import 'package:flutter/material.dart';
import 'package:flutter_application_1/logic/Provider/provider_timechangenotifier.dart';
import 'package:flutter_application_1/logic/Subject/subject_pool.dart';
import 'package:flutter_application_1/util/constants.dart';
import 'package:provider/provider.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const TimeTable(),
            Consumer<TimeChangeNotifier>(
              builder: (context, value, child) => ElevatedButton(
                  onPressed: () {
                    value.oneday();
                    var sp = SubjectPool();
                    sp.subjects[skTime].add(value.today);
                  },
                  child: const Text('진행')),
            ),
          ],
        ),
        const Text('자산 그룹(가로로 그래프들)'),
        const Text('상세 자산 내역(세로로 리스트 형태로 내역들)')
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
