import 'package:flutter_application_1/logic/Enum/EAccountType.dart';
import 'package:uuid/uuid.dart';

class DAccount {
  late String account;
  EAccountType type;
  BigInt balance = BigInt.from(0);
  //[todo] people property를 가지고 있어야함 계좌의 주인정보 단순히 people객체를 readonly로 받을것인지 
  //개인정보관련된 property class 를 만들것인지

  DAccount(this.type) {
    const uuid = Uuid();
    account = uuid.v1();
  }

  String get accountNumber => account;
  set addBalance(BigInt newbalance) => balance + newbalance;
  void subBalance(BigInt newbalance) {
    BigInt pre = balance - newbalance;
    if (pre.isNegative) {
      //[todo] occur error
      //[todo] 마통?
    } else {
      balance = pre;
    }
  }
}
