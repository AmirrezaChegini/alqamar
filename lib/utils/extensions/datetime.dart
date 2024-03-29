import 'package:hijri/hijri_calendar.dart';
import 'package:intl/intl.dart';

extension DatatimeExt on DateTime {
  int getHijriDate() {
    return HijriCalendar.fromDate(this).hDay;
  }

  int getHijriYear() {
    return HijriCalendar.fromDate(this).hYear;
  }

  String getHijriMonth() {
    int month = HijriCalendar.fromDate(this).hMonth;

    const List<String> hijriMonth = [
      '',
      'محرم',
      'صفر',
      'ربیع الاول',
      'ربیع الثانی',
      'جمادی الاول',
      'جمادی الثانیه',
      'رجب',
      'شعبان',
      'رمضان',
      'شوال',
      'ذیقعده ',
      'ذیحجه',
    ];

    return hijriMonth[month];
  }

  String getFormatDate() {
    return DateFormat('yyyy-MM-dd').format(this);
  }

  String getGeregorianMonth() {
    return DateFormat('MMMM').format(this);
  }

  String getNextGeregorianMonth() {
    return DateFormat('MMMM').format(add(const Duration(days: 31)));
  }

  String getGregorianDay() {
    return DateFormat('EEEE').format(this);
  }

  String getHijriDay() {
    return DateFormat('EEEE', 'ar').format(this);
  }
}
