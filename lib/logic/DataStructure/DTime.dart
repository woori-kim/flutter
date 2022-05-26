class DTime {
  int year = 2022;
  int month = 1;
  int day = 1;
  String dayoftheweek = "";

  final strDay = <String>["일", "월", "화", "수", "목", "금", "토"];
  final monthDay = <int>[31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];

  DTime(this.year, this.month, this.day) {
    if (year > 0 && month > 0 && day > 0) findDayOfTheWeek(year, month, day);
  }

  int getYear() {
    return year;
  }

  void setYear(int year) {
    this.year = year;
  }

  int getMonth() {
    return month;
  }

  void setMonth(int month) {
    this.month = month;
  }

  int getDay() {
    return day;
  }

  void setDay(int day) {
    this.day = day;
  }

  String getDayoftheweek() {
    return dayoftheweek;
  }

  String toString() {
    return '${this.year.toString()}/${this.month.toString()}/${this.day.toString()}/${this.dayoftheweek}요일';
  }

  // 윤년인지 체크
  void isLeapYear(int year) {
    if ((year % 4 == 0 && year % 100 != 0) || (year % 400 == 0))
      monthDay[1] = 29;
    else {
      //윤년이 아닌경우도 생각해줘야..
      monthDay[1] = 28;
    }
  }

  //2022 1.1-->토 기준요일로 계산
  void findDayOfTheWeek(int year, int month, int day) {
    int totalDay = 0;
    if (year < 2022) {
      //2022년 1월1일로부터 몇일 전인지 체크
      for (int i = 2021; i > year; i--) {
        isLeapYear(i);
        for (int j = 0; j <= 11; j++) {
          //해당 년도의 모든 일을 더하기
          totalDay += monthDay[j];
        }
      }
      isLeapYear(year);
      //달의 차이 계산
      for (int i = month; i <= 11; i++) {
        //해당월 이후부터 12월까지의 일 계산
        totalDay += monthDay[i];
      }
      totalDay += monthDay[month - 1] - day + 1;
      dayoftheweek = strDay[(10 - (totalDay) % 7) % 7];
    } else {
      //year>=2022 /2022년 1월1일로부터 몇일이 흘렀는지 체크
      for (int i = 2022; i < year; i++) {
        //그 년도 전까지
        isLeapYear(i);
        for (int j = 0; j <= 11; j++) {
          //해당 년도의 모든 일을 더하기
          totalDay += monthDay[j];
        }
      }
      isLeapYear(year);
      //달의 차이 계산
      for (int i = 0; i < month - 1; i++) {
        //그 달의 날짜는 더하면 안됨
        totalDay += monthDay[i];
      }
      //일 차 계산
      totalDay += day - 1;
      dayoftheweek = strDay[(totalDay + 6) % 7];//6은 토요일 인덱스
    }
  }
}
