import 'package:firebase_database/firebase_database.dart';

class ProjectEntry {
  String ProjectName;
  DateTime dateTime;
  double Projectbudget;
  String ProjectManager;
  String Projectdesc;
  String key;

  ProjectEntry(this.dateTime, this.ProjectName, this.ProjectManager, this.Projectdesc, this.Projectbudget);

  ProjectEntry.fromSnapshot(DataSnapshot snapshot)
      : key = snapshot.key,
        dateTime =
        new DateTime.fromMillisecondsSinceEpoch(snapshot.value["date"]),
        Projectbudget = snapshot.value["budget"].toDouble(),
        Projectdesc = snapshot.value["desctription"],
        ProjectName = snapshot.value["projectname"],
        ProjectManager = snapshot.value["manager"];



  toJson() {
    return {
      "budget": Projectbudget,
      "date": dateTime.millisecondsSinceEpoch,
      "desctription": Projectdesc,
      "projectname": ProjectName,
      "manager": ProjectManager
    };
  }
}