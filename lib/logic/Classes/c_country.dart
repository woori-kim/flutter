import 'dart:collection';

import 'package:flutter_application_1/logic/Classes/c_bank.dart';
import 'package:flutter_application_1/logic/Classes/c_bank_central.dart';
import 'package:flutter_application_1/logic/Classes/c_company.dart';

class CCountry {
  final String _name;
  late final CBCentral _centralBank;
  final HashSet<CBank> _banks = HashSet();
  final HashSet<CCompany> _companys = HashSet();

  CCountry(this._name) {
    _centralBank = CBCentral("중앙은행");
  }

  HashSet<CBank> get banks => _banks;
  HashSet<CCompany> get companys => _companys;
  String get name => _name;
  CBCentral get centralBank => _centralBank;
}
