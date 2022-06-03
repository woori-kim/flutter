import 'package:flutter_application_1/logic/Classes/CObject.dart';
import 'package:flutter_application_1/logic/DataStructure/DTime.dart';
import 'package:flutter_application_1/logic/Enum/EAccountType.dart';

abstract class IBankService{
  void makeNewAccount(CObject newclient , EAccountType type , DTime interestDay);
  /**
   * sendmoney()
   * withdrawCash()
   * transferCash()
   * raiseLoan()
   */
}