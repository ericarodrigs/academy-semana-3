import 'package:intl/intl.dart';

DateTime converterToDate({required String value}) {
  int day = int.parse(value.substring(0, 2));

  int month = int.parse(value.substring(3, 5));

  int year = int.parse(value.substring(6));

  DateTime date = DateTime(year, month, day);

  return date;
}

bool validateDate(String value) {
  if (isDate(value.replaceAll('/', '-'), "dd-MM-yyyy")) {
    DateTime date = converterToDate(value: value);

    if (date.compareTo(DateTime.now()) > 0) {
      return false;
    }

    return true;
  }

  return false;
}

bool isDate(String input, String format) {
  try {
    DateFormat(format).parseStrict(input);
    return true;
  } catch (e) {
    return false;
  }
}
