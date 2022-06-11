import 'package:flutter_application_1/logic/interface/i_interestuser.dart';

abstract class IInterestChanger {
  void addInterestUser(IInterestClient newClient);
  void interestChange(double newInterestRate);
}
