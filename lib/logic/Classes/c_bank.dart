import 'package:flutter_application_1/logic/Classes/c_object.dart';

class CBank extends CObject {
  BigInt balance = BigInt.from(0);//cash
  CBank(super.belong,super.name);
}
