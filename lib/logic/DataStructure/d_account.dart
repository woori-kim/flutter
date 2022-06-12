import 'package:flutter_application_1/logic/Classes/bank/c_bank_commercial.dart';
import 'package:flutter_application_1/logic/Classes/c_object.dart';
import 'package:flutter_application_1/logic/DataStructure/d_asset.dart';
import 'package:flutter_application_1/logic/Enum/e_accounttype.dart';
import 'package:uuid/uuid.dart';

class DAccount extends DAsset {
  final CObject _owner;
  late final String _account;
  final EAccountType _type;
  final CBCommercial _bank;
  BigInt balance = BigInt.from(0);

  DAccount(this._owner, this._type, this._bank) {
    const uuid = Uuid();
    _account = uuid.v1();
  }

  CObject get owner => _owner;
  EAccountType get type => _type;
  String get accountNumber => _account;
  CBCommercial get bank => _bank;
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
