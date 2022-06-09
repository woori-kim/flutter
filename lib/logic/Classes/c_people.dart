import 'package:flutter_application_1/logic/Classes/c_object.dart';
import 'package:flutter_application_1/logic/DataStructure/d_account.dart';
import 'package:flutter_application_1/logic/DataStructure/d_time.dart';

class CPeople extends CObject {
  CPeople(super.name);

  @override
  void dayChange(DTime newTime) {
    if (newTime.day == 25) {
      print('CPeople - 월급 받는날임');
    }
    for(var asset in assetSet){
      if(asset.runtimeType == DAccount){
        final DAccount account = asset as DAccount;
        print('${newTime.day}일 잔액 : ${account.balance}');
      }
    }
  }
}
