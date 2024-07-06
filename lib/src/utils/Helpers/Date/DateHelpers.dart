// ignore_for_file: file_names

class DateHelpers {
  static String getStartDate() {
    var startDate = DateTime.now();

    return "${startDate.toLocal().day}/${startDate.toLocal().month}/${startDate.toLocal().year}";
  }
}
