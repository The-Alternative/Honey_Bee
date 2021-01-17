import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sqflite/sqflite.dart';
import 'package:ssd/models/note.dart';
import 'package:ssd/utils/database_helper.dart';

class Time_list extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return Time_listState();
  }
}

class Time_listState extends State<Time_list> {
  String _ndate = DateFormat.yMMMd().format(DateTime.now());
  String _clock =
      DateTime.now().hour.toString() + ":" + DateTime.now().minute.toString();
  DatabaseHelper databaseHelper = DatabaseHelper();
  List<Medicine> medicineList;
  int count = 0;
  @override
  Widget build(BuildContext context) {
    if (medicineList == null) {
      medicineList = List<Medicine>();
      updateListView();
    }
    update2ListView();
    print(Timesupdate.res);
    return Scaffold(
      body: getTimesListView(),
    );
  }

  ListView getTimesListView() {
    debugPrint("note");

    TextStyle titleStyle = Theme.of(context).textTheme.subhead;

    return ListView.builder(
      itemCount: count,
      itemBuilder: (BuildContext context, int position) {
        return Card(
            color: Colors.white,
            elevation: 5.0,
            shadowColor: Colors.amber,
            child: Column(children: <Widget>[
              Row(children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: 10.0, right: 15),
                  child: Image.asset("images/med.png",
                      width: 40, height: 40, filterQuality: FilterQuality.low),
                ),
                Text(
                  "الأدوية ",
                  style: TextStyle(color: Colors.black, fontSize: 15),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 100.0, left: 15),
                  child: Icon(
                    Icons.alarm,
                    size: 20,
                    color: Colors.amber,
                  ),
                ),
                Text(_clock)
              ]),
              Divider(
                color: Colors.amber,
                thickness: 2,
              ),
              ListTile(
                leading: CircleAvatar(),
                title: Text(
                  this.medicineList[position].medTitle,
                ),
                subtitle: Text(this.medicineList[position].medform),
                trailing: Text('الجرعة'),
                onTap: () {
                  debugPrint("ListTile Tapped");

                  // navigateToDetail(this.noteList[position],'Edit Note');
                },
              ),
              Padding(
                padding: const EdgeInsets.only(right: 75.0),
                child: Text("1ساعة 35 دقيقة"),
              ),
              Divider(
                color: Colors.amber,
                thickness: 1,
              ),
              Row(children: <Widget>[
                Padding(
                  padding:
                      const EdgeInsets.only(bottom: 8.0, right: 75, left: 75),
                  child: MaterialButton(
                      clipBehavior: Clip.hardEdge,
                      animationDuration: Duration(milliseconds: 5),
                      color: Colors.green,
                      padding: EdgeInsets.only(
                          left: 35, right: 35, top: 15, bottom: 0),
                      child: Text(
                        "تم",
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                      onPressed: () {}),
                ),
                Divider(
                  thickness: 2,
                  height: 5,
                ),
                IconButton(
                    // visualDensity: VisualDensity(horizontal: 2, vertical: 2),
                    icon: Icon(
                      Icons.delete,
                      size: 30,
                      color: Colors.blue,
                    ),
                    onPressed: () {
                      _delete(context, medicineList[position]);
                      //navigateToCrud();
                    }),
              ])
            ]));
      },
    );
  }

  void updateListView() {
    final Future<Database> dbFuture = databaseHelper.initializeDatabase();
    dbFuture.then((database) {
      Future<List<Medicine>> medicineListFuture =
          databaseHelper.getMedicineList();
      medicineListFuture.then((medicineList) {
        setState(() {
          debugPrint("list has change");
          this.medicineList = medicineList;
          this.count = medicineList.length;

          this.medicineList = medicineList;
          this.count = medicineList.length;
        });
      });
    });
    for (int i = 0; i < medicineList.length; i++) print(i);
  }

  void update2ListView() {
    if (Timesupdate.res) {
      Timesupdate.res = false;
      final Future<Database> dbFuture = databaseHelper.initializeDatabase();
      dbFuture.then((database) {
        Future<List<Medicine>> medicineListFuture =
            databaseHelper.getMedicineList();
        medicineListFuture.then((medicineList) {
          setState(() {
            debugPrint("list has change");

            this.medicineList = medicineList;
            this.count = medicineList.length;
          });
        });
      });
    }
  }

  void _delete(BuildContext context, Medicine medicine) async {
    int result = await databaseHelper.deleteMedicine(medicine.medId);
    if (result != 0) {
      _showSnackBar(context, 'medicine Deleted Successfully');
      updateListView();
    }
  }

  void _showSnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(content: Text(message));
    Scaffold.of(context).showSnackBar(snackBar);
  }
}

class Timesupdate {
  static bool res = false;
}
