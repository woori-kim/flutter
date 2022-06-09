import 'package:flutter_application_1/logic/Enum/e_reservedtag.dart';

class DAsset {
  final ETag identifyTag = ETag.none;

  set identifyTag(ETag newtag) => identifyTag = newtag;
  ETag get tag => identifyTag;
}
