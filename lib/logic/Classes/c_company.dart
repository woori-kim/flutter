import 'dart:collection';

import 'package:flutter_application_1/logic/Classes/c_object.dart';
import 'package:flutter_application_1/logic/Classes/c_people.dart';
import 'package:flutter_application_1/logic/DataStructure/d_account.dart';
import 'package:flutter_application_1/logic/DataStructure/d_companymember.dart';
import 'package:flutter_application_1/logic/DataStructure/d_time.dart';
import 'package:flutter_application_1/logic/Enum/e_accounttype.dart';
import 'package:flutter_application_1/logic/Enum/e_reservedtag.dart';
import 'package:flutter_application_1/logic/interface/i_bankservice.dart';
import 'package:flutter_application_1/logic/interface/i_companyservice.dart';

class CCompany extends CObject with ICompanyService {
  final HashSet<DCompanyMember> _memberSet = HashSet();

  CCompany(super.belong,super.name);

  @override
  void dayChange(DTime newTime) {
    if (newTime.day == 25) {
      print('CCompany - CPeople한테 월급 주는날');
      late final DAccount companySalaryAccount = propertyMap[ETag.mainaccount] as DAccount;

      IBankService bankservice = companySalaryAccount.bank;
      for (var member in _memberSet) {
        bankservice.sendMoney(
            companySalaryAccount, member.account, BigInt.from(3000000));
      }
    }
  }

  @override
  void joinCompany(final CPeople newmember, final DAccount salaryAccount) {
    _memberSet.add(DCompanyMember(newmember, salaryAccount));
  }

  @override
  void leaveCompany(final CPeople leavemember) {
    for (var member in _memberSet) {
      if (member.people.id == leavemember.id) {
        _memberSet.remove(member);
        break;
      }
    }
  }
}
