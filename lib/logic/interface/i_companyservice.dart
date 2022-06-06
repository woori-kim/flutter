import 'package:flutter_application_1/logic/Classes/c_people.dart';

abstract class ICompanyService{
  void joinCompany(final CPeople newmember);
  void leaveCompany(final CPeople leavemember);
}
