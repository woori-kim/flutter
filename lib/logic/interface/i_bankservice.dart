import 'package:flutter_application_1/logic/Classes/c_object.dart';
import 'package:flutter_application_1/logic/DataStructure/d_account.dart';
import 'package:flutter_application_1/logic/DataStructure/d_time.dart';
import 'package:flutter_application_1/logic/Enum/e_accounttype.dart';

abstract class IBankService {
  void makeNewAccount(CObject newclient, EAccountType type, DTime interestDay);
  bool sendMoney(DAccount source, DAccount destination, BigInt won);
  /**
   * withdrawCash()//[todo] cash 현금 자산 클래스 필요
   * transferCash()
   * raiseLoan()
   */
}
