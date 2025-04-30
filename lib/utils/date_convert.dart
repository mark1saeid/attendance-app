import 'package:intl/intl.dart';

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
  var dateTimeUtc = DateFormat.Hms().parse(utcTime).toLocal();
  var timeIn12 = DateFormat.jm('en-SA').format(dateTimeUtc);
  return timeIn12.toString();
}
