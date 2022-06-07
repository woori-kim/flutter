import 'dart:collection';

import 'package:flutter_application_1/logic/Classes/c_object.dart';
import 'package:flutter_application_1/logic/DataStructure/d_account.dart';

class DBankClient {
  final CObject client;
  HashSet<DAccount> accountSet = HashSet();

  DBankClient(this.client);

  void addNewAccount(DAccount newAccount) {
    accountSet.add(newAccount);
  }

  CObject get bankClient => client;
  HashSet<DAccount> get accounts => accountSet;
}
