import 'package:flutter_application_1/logic/Subject/subject_pool.dart';
import 'package:flutter_application_1/logic/interface/i_interestchanger.dart';
import 'package:flutter_application_1/logic/interface/i_interestuser.dart';
import 'package:flutter_application_1/util/constants.dart';

class InterestConsumer extends IInterestChanger {
  static final InterestConsumer _instance =
      InterestConsumer._internalConstructor();
  double _lastBaseInterestRate = initialBaseInterestRate;
  final List<IInterestClient> _interestClients = [];

  double get lastBaseInterestRate => _lastBaseInterestRate;

  factory InterestConsumer() {
    return _instance;
  }

  InterestConsumer._internalConstructor() {
    var sp = SubjectPool();

    sp.subjects[skInterest].stream.listen((event) {});
  }

  @override
  void addInterestUser(IInterestClient newClient) {
    _interestClients.add(newClient);
  }

  @override
  void interestChange(double newInterestRate) {
    _lastBaseInterestRate = newInterestRate;
    for (var client in _interestClients) {
      client.interestChange(newInterestRate);
    }
  }
}
