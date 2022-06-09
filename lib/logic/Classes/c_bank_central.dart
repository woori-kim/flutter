import 'package:flutter_application_1/logic/Classes/c_bank.dart';
import 'package:flutter_application_1/logic/DataStructure/d_time.dart';

class CBCentral extends CBank {
  CBCentral(super.name);

  void issueMoney(BigInt amount) {
    balance += amount;
  }

  void releaseMoney(CBank targetBank, BigInt amount) {
    targetBank.balance += amount;
    balance -= amount;
  }

  @override
  void dayChange(DTime newTime) {
    
  }
}
