import 'package:flutter_application_1/logic/Classes/bank/c_bank.dart';
import 'package:flutter_application_1/logic/Consumer/consumer_time.dart';
import 'package:flutter_application_1/logic/DataStructure/d_account.dart';
import 'package:flutter_application_1/logic/DataStructure/d_carttaker.dart';
import 'package:flutter_application_1/logic/DataStructure/d_history_centralbank.dart';
import 'package:flutter_application_1/logic/DataStructure/d_time.dart';
import 'package:flutter_application_1/logic/Enum/e_reservedtag.dart';
import 'package:flutter_application_1/logic/Subject/subject_pool.dart';
import 'package:flutter_application_1/util/constants.dart';

class CBCentral extends CBank {
  double _baseInterestRate = 0.5;
  final DCareTaker _careTaker = DCareTaker();

  double get baseInterestRate => _baseInterestRate;

  CBCentral(super.belong, super.name);

  void issueMoney(BigInt amount) {
    cash += amount;

    _careTaker.addMemento = DHCentralBank(TimeConsumer().today, amount);
  }

  void releaseMoney(CBank targetBank, BigInt amount) {
    targetBank.cash += amount;
    cash -= amount;
    DAccount mainDepositAccount =
        targetBank.propertyMap[ETag.mainaccount] as DAccount;
    mainDepositAccount.balance = amount;
  }

  @override
  void dayChange(DTime newTime) {}

  void setBaseInterestRate(double newInterestRate) {
    _baseInterestRate = newInterestRate;
    var sp = SubjectPool();
    sp.subjects[skInterest].add(newInterestRate);
  }
}