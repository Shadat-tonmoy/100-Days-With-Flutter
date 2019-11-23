class DateTimeHelper
{
  static String getCurrentTimeString()
  {
    DateTime dateTime = DateTime.now();
    return "${dateTime.hour}:${dateTime.minute} | ${dateTime.day}-${dateTime.month}-${dateTime.year}";  }

}