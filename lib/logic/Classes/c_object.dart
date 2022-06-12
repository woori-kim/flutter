import 'dart:collection';

import 'package:flutter_application_1/logic/Classes/c_country.dart';
import 'package:flutter_application_1/logic/Classes/mixin/mixin_timelisten.dart';
import 'package:flutter_application_1/logic/DataStructure/d_asset.dart';
import 'package:flutter_application_1/logic/DataStructure/d_time.dart';
import 'package:flutter_application_1/logic/Enum/e_reservedtag.dart';
import 'package:flutter_application_1/logic/interface/i_timeslave.dart';
import 'package:uuid/uuid.dart';

class CObject with TimeListen implements ITimeSlave {
  CCountry belong;
  final String name;
  late final String id;
  HashSet<DAsset> assetSet = HashSet();
  HashMap<ETag, DAsset> propertyMap = HashMap();

  CObject(this.belong, this.name) {
    timeListen(this);
    const uuid = Uuid();
    id = uuid.v1();
  }

  @override
  void dayChange(DTime newTime) {
    throw Exception("[$name] [$id] dayChange not implement");
  }
}

/**
 * [todo]
 * 3. 회사 property 월급 지급일에 멤버들한테 일괄 지급
 * 4. 은행 property 대출이자 지정된 날짜에 고객한테 일괄 지급
 */
