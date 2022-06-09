import 'dart:collection';

import 'package:flutter_application_1/logic/Classes/c_object.dart';
import 'package:flutter_application_1/logic/DataStructure/d_account.dart';

class DBankClient {
  final CObject _client;
  final HashSet<DAccount> _accountSet = HashSet();

  DBankClient(this._client);

  void addNewAccount(DAccount newAccount) {
    _accountSet.add(newAccount);
  }

  CObject get client => _client;
  HashSet<DAccount> get accounts => _accountSet;
}
