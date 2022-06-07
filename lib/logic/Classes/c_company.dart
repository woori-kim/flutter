import 'dart:collection';

import 'package:flutter_application_1/logic/Classes/c_object.dart';
import 'package:flutter_application_1/logic/Classes/c_people.dart';
import 'package:flutter_application_1/logic/DataStructure/d_account.dart';
import 'package:flutter_application_1/logic/DataStructure/d_companymember.dart';
import 'package:flutter_application_1/logic/DataStructure/d_time.dart';
import 'package:flutter_application_1/logic/interface/i_companyservice.dart';

class CCompany extends CObject with ICompanyService {
  HashSet<DCompanyMember> memberSet = HashSet();

  CCompany(super.name);

  @override
  void dayChange(DTime newTime) {
    if (newTime.day == 25) {
      print('CCompany - CPeople한테 월급 주는날');
      for (var member in memberSet) {
        /**
         * [todo]
         * 회사의 메인 혹은 급여계좌에서 멤버의 급여계좌로 이체 시켜줘야됨
         * (IBankService)회사의메인급여계좌의CBank
         */
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
