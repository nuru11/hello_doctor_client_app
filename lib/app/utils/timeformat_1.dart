import 'package:intl/intl.dart';

class TimeFormat {
  String formatDate(DateTime? dateTime) {
    if (dateTime == null) {
      return '';
    } else {
      String date =
          DateFormat("EEEE, dd MMMM, yyyy HH:mm a").format(dateTime).toString();
      return date;
    }
  }
}
