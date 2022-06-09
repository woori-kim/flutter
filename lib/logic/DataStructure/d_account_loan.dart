import 'package:flutter_application_1/logic/DataStructure/d_account.dart';

class DLoanAccount extends DAccount {
  int _loanPeriod; //총 대출기간
  BigInt _repaymentDuty; //원금

  DLoanAccount(super.owner, super.type, super.bank, this._loanPeriod,
      this._repaymentDuty);

  int get period => _loanPeriod;
  BigInt get repaymentDuty => _repaymentDuty;
  //[todo]이자율
}
