import 'package:flutter_application_1/logic/Classes/c_object.dart';
import 'package:flutter_application_1/logic/DataStructure/d_account.dart';
import 'package:flutter_application_1/logic/DataStructure/d_time.dart';
import 'package:flutter_application_1/logic/Enum/e_reservedtag.dart';

class CPeople extends CObject {
  CPeople(super.belong, super.name);

  @override
  void dayChange(DTime newTime) {
    if (newTime.day == 25) {
      print('CPeople - 월급 받는날임');
    }

    final DAccount mainaccount = propertyMap[ETag.mainaccount] as DAccount;
    print('${newTime.day}일 잔액 : ${mainaccount.balance}');
  }
}
