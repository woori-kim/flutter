import 'package:flutter_application_1/logic/DataStructure/d_account.dart';
import 'package:flutter_application_1/logic/Enum/e_loantype.dart';

class DLoanAccount extends DAccount {
  int _loanPeriod = 0; //총 대출기간
  BigInt _repaymentDuty = BigInt.from(0); //총 대출금액
  int _repaymentDay = 0; // 대출상환일
  late ELoanType _loantype;
  //double _interestRate = 0.0; [todo] 고정금리는 account안에 고정된 금리 사용 , 변동금리는 상환시마다 은행금리 가져와서 사용

  DLoanAccount(super.owner, super.type, super.bank);

  int get period => _loanPeriod;
  BigInt get repaymentDuty => _repaymentDuty;
  int get repaymentDay => _repaymentDay;
  ELoanType get loanType => _loantype;

  void setLoanData(int period, BigInt duty, int repaymentDay, ELoanType type) {
    _loanPeriod = period;
    _repaymentDuty = duty;
    _repaymentDay = repaymentDay;
    _loantype = type;
  }
}
