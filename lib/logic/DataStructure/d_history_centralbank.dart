import 'package:flutter_application_1/logic/DataStructure/d_history.dart';
import 'package:flutter_application_1/logic/DataStructure/d_time.dart';

class DHCentralBank extends DHistory {
  BigInt _makeMoneyAmount;

  DHCentralBank(DTime time, this._makeMoneyAmount) : super(time);

  BigInt get makeMoneyAmount => _makeMoneyAmount;
}
