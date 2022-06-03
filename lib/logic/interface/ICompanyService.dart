import 'package:flutter_application_1/logic/Classes/CPeople.dart';

abstract class ICompanyService{
  void joinCompany(CPeople newpeople);//salary account , 직급 연차
  void leaveCompany(CPeople leavemember);
}
