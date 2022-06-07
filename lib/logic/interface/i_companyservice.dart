import 'package:flutter_application_1/logic/Classes/c_people.dart';
import 'package:flutter_application_1/logic/DataStructure/d_account.dart';

abstract class ICompanyService{
  void joinCompany(final CPeople newmember ,final DAccount salaryAccount);
  void leaveCompany(final CPeople leavemember);
}
