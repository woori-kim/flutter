import 'package:flutter_application_1/logic/Consumer/consumer_interest.dart';
import 'package:flutter_application_1/logic/interface/i_interestuser.dart';

mixin InterestListen {
  interestListen(IInterestClient newClient) {
    InterestConsumer ic = InterestConsumer();
    ic.addInterestUser(newClient);
  }
}
