import 'package:flutter_application_1/logic/Classes/mixin/mixin_timelisten.dart';
import 'package:flutter_application_1/logic/DataStructure/d_time.dart';
import 'package:flutter_application_1/logic/interface/i_timeslave.dart';

class CObject extends ITimeSlave with TimeListen {
  //[todo] name
  //[todo] uuid
  CObject() {
    timeListen(this);
  }

  @override
  void dayChange(DTime newTime) {
    //[todo] not implement 일때 warning하면서 현재 객체 정보 뿌려주기
  }
}

/**
 * [todo]
 * 1. 은행시스템 인터페이스
 * 2. 회사시스템 인터페이스
 * 3. 회사 property 월급 지급일에 멤버들한테 일괄 지급
 * 4. 은행 property 대출이자 지정된 날짜에 고객한테 일괄 지급
 */