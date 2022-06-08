import 'dart:collection';

import 'package:flutter_application_1/logic/Classes/c_object.dart';
import 'package:flutter_application_1/logic/DataStructure/d_account.dart';
import 'package:flutter_application_1/logic/DataStructure/d_bankclient.dart';
import 'package:flutter_application_1/logic/DataStructure/d_time.dart';
import 'package:flutter_application_1/logic/Enum/e_accounttype.dart';
import 'package:flutter_application_1/logic/interface/i_bankservice.dart';

class CBank extends CObject with IBankService {
  HashSet<DBankClient> clientSet = HashSet();

  CBank(super.name) {
    assetSet.add(DAccount(this, EAccountType.deposit, this));
  }

  @override
  void dayChange(DTime newTime) {
    if (newTime.day == 5) {
      print('CBank - 대출이자 가져가는날임');
    }
  }

  @override
  DAccount makeNewAccount(CObject newclient, EAccountType type) {
    DAccount newAccount = DAccount(newclient, type, this);

    //client안에 있으면 addnewaccount
    for (var client in clientSet) {
      if (client.client.id == newclient.id) {
        client.accountSet.add(newAccount);
        return newAccount;
      }
    }

    //없으면 newclient + addnewaccount
    DBankClient newClient = DBankClient(newclient);
    newClient.accountSet.add(newAccount);
    clientSet.add(newClient);
    return newAccount;
  }

  @override
  bool sendMoney(DAccount source, DAccount destination, BigInt won) {
    //[todo]이 은행 멤버인지 아닌지 확인을 통해서 수수료 책정
    if (source.balance < won) {
      //[todo] error
      return false;
    } else {
      source.subBalance(won); //[todo] = subbalance 도 addbalance처럼 가능?
      //source.subbalance(fee);//수수료 to 은행한테
      destination.addBalance = won;
    }

    return true;
  }
}
