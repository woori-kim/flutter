class UCurrency {
  static final UCurrency _instance = UCurrency._internalConstructor();

  factory UCurrency() {
    return _instance;
  }

  UCurrency._internalConstructor();

  final han1 = [
    "",
    "\uC77C",
    "\uC774",
    "\uC0BC",
    "\uC0AC",
    "\uC624",
    "\uC721",
    "\uCE60",
    "\uD314",
    "\uAD6C"
  ];
  //0,1,2,3,4,5,6,7,8,9

  final han2 = ["", "\uC2ED", "\uBC31", "\uCC9C"];
  //ten , hundred , thousand
  //sib , baek , chun

  final han3 = ["", "\uB9CC", "\uC5B5", "\uC870"];
  //han3[4]=_T("\uACBD");
  //ten thousand , one hundred million , trillion
  //man , uk , jo

  BigInt toOriginValue(String strValue) {
    strValue = strValue.replaceAll("\uC6D0", ""); //remove won

    int joidx = strValue.indexOf(han3[3]);
    int ukidx = strValue.indexOf(han3[2]);
    int manidx = strValue.indexOf(han3[1]);

    BigInt jj = BigInt.zero;
    BigInt uu = BigInt.zero;
    BigInt mm = BigInt.zero;

    if (joidx != -1) {
      String temp = strValue.substring(0, joidx);
      jj = BigInt.parse(temp);
      jj *= BigInt.parse('1000000000000');
      strValue = strValue.substring(joidx + 1);
    }
    if (ukidx != -1) {
      ukidx = strValue.indexOf(han3[2]);
      String temp = strValue.substring(0, ukidx);
      uu = BigInt.parse(temp);
      uu *= BigInt.parse('100000000');
      strValue = strValue.substring(ukidx + 1);
    }
    if (manidx != -1) {
      manidx = strValue.indexOf(han3[1]);
      String temp = strValue.substring(0, manidx);
      mm = BigInt.parse(temp);
      mm *= BigInt.parse('10000');
      strValue = strValue.substring(manidx + 1);
    }

    BigInt etc = BigInt.zero;
    if (strValue.isEmpty == false) {
      etc = BigInt.parse(strValue);
    }

    return jj + uu + mm + etc;
  }

  String toCurrencyString(BigInt money, bool isAllkorean) {
    String str = money.toString();

    String result = "";
    int len = str.length;

    const int billlimit = 16; //1000trillion
    bool bOverflow = false;
    if (len > billlimit) {
      bOverflow = true;
    }

    var billStr = ["", "", "", ""];
    //0won ,1man , 2uk ,3jo

    var resultBillStr = ["", "", "", ""];
    for (int i = 0; i < 4; i++) {
      if (len < 4 || i == 3) {
        billStr[i] = str;
        break;
      } else {
        String temp = str.substring(len - 4);
        String newvalue = billStr[i] + temp;
        billStr[i] = newvalue;
        str = str.substring(0, len - 4);
        len = str.length;
      }
    }

    if (isAllkorean == true) {
      for (int i = 0; i < 4; i++) {
        if (billStr[i].isEmpty) {
          continue;
        }
        int len2 = billStr[i].length;
        for (int j = len2 - 1; j >= 0; j--) {
          String character = billStr[i][len2 - j - 1];
          if (character.compareTo("0") == 0) {
            continue;
          }

          if (isAllkorean == true) {
            String temp = han1[int.parse(character)];
            String newvalue = resultBillStr[i] + temp;
            resultBillStr[i] = newvalue;
          } else {
            String newvalue = resultBillStr[i] + character;
            resultBillStr[i] = newvalue;
          }

          if (bOverflow && i == 3) {
            if (int.parse(character) == 0) {
              String newvalue = '${resultBillStr[i]}\uC601';
              resultBillStr[i] += newvalue;
            }
          } else {
            if (int.parse(character) > 0) {
              String newvalue = resultBillStr[i] + han2[j % 4];
              resultBillStr[i] = newvalue;
            }
          }
        }
      }
    }

    for (int i = 3; i >= 0; i--) {
      if (isAllkorean == true) {
        if (resultBillStr[i].isNotEmpty) {
          String newvalue = result + resultBillStr[i] + han3[i];
          result = newvalue;
        }
      } else {
        if (billStr[i].isNotEmpty) {
          if (int.parse(billStr[i]) > 0) {
            String newvalue = result + billStr[i] + han3[i];
            result = newvalue;
          }
        }
      }
    }

    if (result.isNotEmpty) {
      result = '$result\uC6D0';
    }

    return result;
  }
}
