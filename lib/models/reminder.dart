class Reminder
{
  String name = "Rappel";
  DateTime nextRem;
  int maxRemNb = 3;
  int remID = 0;
  String? docRef;
  bool succeeded = false;

  Reminder({required this.name, required this.remID, required this.nextRem, required this.maxRemNb, this.docRef})
  {
    if(maxRemNb < 3) {
      maxRemNb = 3;
    }
    if(maxRemNb > 7) {
      maxRemNb = 7;
    }
  }

  bool remindIsPast()
  {
    DateTime today = DateTime.now();
    return (nextRem.difference(today) < const Duration(days: -1));
  }

  bool remindThatDate(DateTime date)
  {
    return (nextRem.year == date.year) &&
        (nextRem.month == date.month) &&
        (nextRem.day == date.day);
  }

  //Renvoie false si il n'y a pas de prochain rappel
  bool toNextReminder() {
    if (succeeded) remID++;

    if (remID >= maxRemNb) return false;

    nextRem = (remID == 0 || (!succeeded))
        ? nextRem.add(const Duration(days: 1))
        : nextRem.add(Duration(days: remID));

    return true;
  }
}