import 'package:flutter_application_1/logic/Classes/c_object.dart';
import 'package:flutter_application_1/logic/DataStructure/d_account.dart';
import 'package:flutter_application_1/logic/DataStructure/d_time.dart';
import 'package:flutter_application_1/logic/Enum/e_accounttype.dart';
import 'package:flutter_application_1/logic/interface/i_bankservice.dart';

class CBank extends CObject with IBankService {
  List<DAccount> bankAccountList = [];

  CBank() {
    bankAccountList.add(DAccount(this,EAccountType.deposit));
  }

  @override
  void dayChange(DTime newTime) {
    if (newTime.day == 5) {
      print('CBank - 대출이자 가져가는날임');
    }
  }

  @override
  void makeNewAccount(CObject newclient, EAccountType type, DTime interestDay) {
    // TODO: implement makeNewAccount
  }

  @override
  bool sendMoney(DAccount source, DAccount destination, BigInt won) {
    // TODO: implement sendMoney
    //[todo]이 은행 멤버인지 아닌지 확인을 통해서 수수료 책정
    if (source.balance < won) {
      //[todo] error
      return false;
    } else {
      source.subBalance(won); //[todo] = subbalance 도 addbalance처럼 가능?
      //source.subbalance(fee);//수수료 to 은행한테
      destination.addBalance = won;
    }

    return true;
  }
}
