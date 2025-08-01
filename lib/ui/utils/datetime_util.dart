import 'package:intl/intl.dart';
import 'package:takeaway_app_flutter_client/i18n/gen/strings.g.dart';
import 'package:timezone/timezone.dart' as tz;

class DateTimeUtil {
  static String formatToAmsterdam(
    String utcString, {
    String pattern = 'yyyy-MM-dd HH:mm',
  }) {
    final utc = DateTime.parse(utcString).toUtc();
    final ams = tz.TZDateTime.from(utc, tz.getLocation('Europe/Amsterdam'));
    return DateFormat(pattern).format(ams);
  }

  static String todayInAmsterdam({String pattern = 'yyyy-MM-dd'}) {
    final amsNow = tz.TZDateTime.now(tz.getLocation('Europe/Amsterdam'));
    return DateFormat(pattern).format(amsNow);
  }

  static String formatFullDateTime(DateTime date, String time) {
    final dt = DateTime(
      date.year,
      date.month,
      date.day,
      int.parse(time.split(':')[0]),
      int.parse(time.split(':')[1]),
    );
    return DateFormat('yyyy-MM-dd HH:mm').format(dt);
  }

  static String formatReserveTimeHuman(String dateTimeStr) {
    if (dateTimeStr.isEmpty) return '';
    final dt = DateTime.parse(dateTimeStr);
    final now = DateTime.now();

    final today = DateTime(now.year, now.month, now.day);
    final tomorrow = today.add(const Duration(days: 1));
    final reserveDay = DateTime(dt.year, dt.month, dt.day);

    final timeStr =
        '${dt.hour.toString().padLeft(2, '0')}:${dt.minute.toString().padLeft(2, '0')}';

    if (reserveDay == today) {
      return '${t.common.today} $timeStr';
    } else if (reserveDay == tomorrow) {
      return '${t.common.tomorrow} $timeStr';
    } else {
      final monthStr = t.common.months[dt.month - 1].substring(0, 3);
      return '${dt.day} $monthStr $timeStr';
    }
  }
}
