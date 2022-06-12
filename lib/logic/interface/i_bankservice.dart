import 'package:flutter_application_1/logic/Classes/c_object.dart';
import 'package:flutter_application_1/logic/DataStructure/d_account.dart';
import 'package:flutter_application_1/logic/DataStructure/d_account_loan.dart';
import 'package:flutter_application_1/logic/Enum/e_accounttype.dart';
import 'package:flutter_application_1/logic/Enum/e_loantype.dart';

abstract class IBankService {
  DAccount makeNewAccount(CObject newclient, EAccountType type);
  bool sendMoney(DAccount source, DAccount destination, BigInt won);
  void raiseLoan(DLoanAccount account, BigInt amount , int loanMonth,int repaymentDay,ELoanType type);
  /**
   * withdrawCash()//[todo] cash 현금 자산 클래스 필요
   * transferCash()
   * raiseLoan()
   */

  //[todo]need to currency? USD EUR JPY WON
}
