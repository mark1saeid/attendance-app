import 'package:intl/intl.dart';
import 'package:timezone/data/latest.dart' as tzData;
import 'package:timezone/timezone.dart' as tz;


String formatDateID(String pattern, String? dateStr) {
  if (dateStr == null) return "-";
  final date =
      DateFormat(pattern, "en-SA").format(DateTime.parse(dateStr).toLocal());

  return date;
}

String parseUtcToLocal({
  String utcPattern = 'y-M-d H:m:s',
  required String pattern,
  String? date,
}) {
  if (date == null) return '-';
  final dateUtc = DateFormat(utcPattern).parse(date).toLocal();
  final dateLocal = DateFormat(pattern, 'en-SA').format(dateUtc);

  return dateLocal;
}

String timeHm(String? time) {
  if (time == null) return '-';
  var dateTimeUtc = DateFormat.Hms().parse(time).toLocal();
  var timeIn12 = DateFormat.jm('en-SA').format(dateTimeUtc);
  return timeIn12.toString();
}

String timeParseHm(String? utcTime) {
  if (utcTime == null) return '-';

  tzData.initializeTimeZones();

  final ksaTimeZone = tz.getLocation('Asia/Riyadh');

  var dateTimeUtc =
      DateFormat.Hms().parseUtc(utcTime); // Parse as UTC (not local)

  var dateTimeKsa = tz.TZDateTime.from(dateTimeUtc, ksaTimeZone);

  var timeIn12Format = DateFormat.jm('en-SA').format(dateTimeKsa);

  return timeIn12Format;
}
