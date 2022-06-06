import 'package:flutter_application_1/logic/Classes/c_object.dart';
import 'package:flutter_application_1/logic/DataStructure/d_asset.dart';
import 'package:flutter_application_1/logic/Enum/e_accounttype.dart';
import 'package:uuid/uuid.dart';

class DAccount extends DAsset {
  late final CObject owner;
  late String account;
  EAccountType type;
  BigInt balance = BigInt.from(0);

  DAccount(this.owner, this.type) {
    const uuid = Uuid();
    account = uuid.v1();
  }

  CObject get accountOwner => owner;
  EAccountType get accountType => type;
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
