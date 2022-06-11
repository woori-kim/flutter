import 'dart:collection';

import 'package:flutter_application_1/util/constants.dart';
import 'package:rxdart/rxdart.dart';

class SubjectPool {
  static final SubjectPool _instance = SubjectPool._internalConstructor();

  factory SubjectPool() {
    return _instance;
  }

  HashMap subjectPool = HashMap<String, Subject>();

  SubjectPool._internalConstructor() {
    subjectPool[skTime] = PublishSubject();
    subjectPool[skInterest] = PublishSubject();
  }

  HashMap get subjects => subjectPool;
}
