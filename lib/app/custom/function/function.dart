class FunctionClass{
  static int calculateRemainingDays(String expiryDateString) {
    DateTime expiryDate = DateTime.parse(expiryDateString);
    DateTime currentDate = DateTime.now();

    Duration difference = expiryDate.difference(currentDate);

    return difference.inDays;
  }
  static String formatDateTime(DateTime dateTime) {
    return "${dateTime.day}/${dateTime.month}/${dateTime.year}";
  }
}