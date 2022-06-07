import 'package:flutter_application_1/logic/Classes/c_people.dart';
import 'package:flutter_application_1/logic/DataStructure/d_account.dart';

class DCompanyMember {
  final CPeople people;
  final DAccount account;
  
  DCompanyMember(this.people, this.account);

  CPeople get memberPeople => people;
  DAccount get salaryAccount => account;
}
