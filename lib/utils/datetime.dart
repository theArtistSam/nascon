import 'dart:core';

class Datetime {
  static String format(DateTime datetime) {
    return '${datetime.day.toString()}/${datetime.month.toString()}/${datetime.year.toString()}';
  }
}
