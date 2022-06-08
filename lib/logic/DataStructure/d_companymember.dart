import 'package:flutter_application_1/logic/Classes/c_people.dart';
import 'package:flutter_application_1/logic/DataStructure/d_account.dart';

class DCompanyMember {
  final CPeople _people;
  final DAccount _account;
  
  DCompanyMember(this._people, this._account);

  CPeople get people => _people;
  DAccount get account => _account;
}
