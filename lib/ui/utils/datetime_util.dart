import 'package:intl/intl.dart';
import 'package:timezone/timezone.dart' as tz;

class DateTimeUtil {
  static String formatToAmsterdam(String utcString, {String pattern = 'yyyy-MM-dd HH:mm'}) {
    final utc = DateTime.parse(utcString).toUtc();
    final ams = tz.TZDateTime.from(utc, tz.getLocation('Europe/Amsterdam'));
    return DateFormat(pattern).format(ams);
  }

  static String todayInAmsterdam({String pattern = 'yyyy-MM-dd'}) {
    final amsNow = tz.TZDateTime.now(tz.getLocation('Europe/Amsterdam'));
    return DateFormat(pattern).format(amsNow);
  }
}