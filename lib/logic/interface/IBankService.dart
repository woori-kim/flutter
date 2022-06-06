import 'package:flutter_application_1/logic/Classes/CObject.dart';
import 'package:flutter_application_1/logic/DataStructure/DAccount.dart';
import 'package:flutter_application_1/logic/DataStructure/DTime.dart';
import 'package:flutter_application_1/logic/Enum/EAccountType.dart';

abstract class IBankService {
  void makeNewAccount(CObject newclient, EAccountType type, DTime interestDay);
  bool sendMoney(DAccount source, DAccount destination, BigInt won);
  /**
   * withdrawCash()//[todo] cash 현금 자산 클래스 필요
   * transferCash()
   * raiseLoan()
   */
}
