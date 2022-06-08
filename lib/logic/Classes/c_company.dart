import 'dart:collection';

import 'package:flutter_application_1/logic/Classes/c_object.dart';
import 'package:flutter_application_1/logic/Classes/c_people.dart';
import 'package:flutter_application_1/logic/DataStructure/d_account.dart';
import 'package:flutter_application_1/logic/DataStructure/d_companymember.dart';
import 'package:flutter_application_1/logic/DataStructure/d_time.dart';
import 'package:flutter_application_1/logic/Enum/e_accounttype.dart';
import 'package:flutter_application_1/logic/interface/i_bankservice.dart';
import 'package:flutter_application_1/logic/interface/i_companyservice.dart';

class CCompany extends CObject with ICompanyService {
  HashSet<DCompanyMember> memberSet = HashSet();

  CCompany(super.name);

  @override
  void dayChange(DTime newTime) {
    if (newTime.day == 25) {
      print('CCompany - CPeople한테 월급 주는날');
      late final DAccount companySalaryAccount;
      for (var asset in assetSet) {
        if (asset.runtimeType == DAccount) {
          final DAccount account = asset as DAccount;
          if (account.type == EAccountType.deposit) {
            companySalaryAccount = account;
          }
        }
      }

      IBankService bankservice = companySalaryAccount.bank;
      for (var member in memberSet) {
        bankservice.sendMoney(
            companySalaryAccount, member.account, BigInt.from(3000000));
      }
    }
  }

  @override
  void joinCompany(final CPeople newmember, final DAccount salaryAccount) {
    memberSet.add(DCompanyMember(newmember, salaryAccount));
  }

  @override
  void leaveCompany(final CPeople leavemember) {
    for (var member in memberSet) {
      if (member.people.id == leavemember.id) {
        memberSet.remove(member);
        break;
      }
    }
  }
}
