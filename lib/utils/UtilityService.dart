class UtilityService {
  String getDateTimeDashboard() {
    DateTime now = DateTime.now();
    String date = now.day.toString();
    if (date[date.length-1] == "1") {
      date = now.day.toString() + "st";
    } else if (now.day.toString()[date.length-1] == "2" && now.day.toString()[0] != "1") {
      date = now.day.toString() + "nd";
    } else if (now.day.toString()[date.length-1] == "3") {
      date = now.day.toString() + "rd";
    } else {
      date = now.day.toString() + "th";
    }
    List months =
    [
      'jan',
      'feb',
      'mar',
      'apr',
      'may',
      'jun',
      'jul',
      'aug',
      'sep',
      'oct',
      'nov',
      'dec'
    ];
    String current_mon = months[(now.month) - 1];
    current_mon = "${current_mon[0].toUpperCase()}${current_mon.substring(1).toLowerCase()}";
    return date + " " + current_mon + " " + now.year.toString();
  }
}