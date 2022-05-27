import '../../util/constants.dart';
import '../Subject/SubjectPool.dart';

mixin TimeListen {
  timeListen() {
    var sp = SubjectPool();
    var timesubject = sp.subjects[skTime];

    timesubject.stream.listen((event) {
      print('day change');
    });
  }
}