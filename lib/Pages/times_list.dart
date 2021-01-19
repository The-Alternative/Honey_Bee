import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sqflite/sqflite.dart';
import 'package:ssd/models/db_models.dart';
import 'package:ssd/utils/database_helper.dart';

class Time_list extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return Time_listState();
  }
}

class Time_listState extends State<Time_list> {
  String _ndate = DateFormat.yMMMd().format(DateTime.now());
  String _clock = DateTime.now().hour.toString() + ":" + DateTime.now().minute.toString();
  DatabaseHelper databaseHelper = DatabaseHelper();
  List<Card_info> cardList;
  int count = 0;
  @override
  Widget build(BuildContext context) {
    if (cardList == null ) {
      cardList= List<Card_info>();
      addCardListView();



    }
   updateCardInfo();
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
        return Card(color: Colors.white, elevation: 5.0, shadowColor: Colors.amber,
            child: Column(children: <Widget>[
              Row(children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: 10.0, right: 15),
                  child: Image.asset("images/med.png",
                      width: 40, height: 40, filterQuality: FilterQuality.low),
                ),
                Text("الأدوية ", style: TextStyle(color: Colors.black, fontSize: 15),),
                Padding(
                  padding: const EdgeInsets.only(right: 100.0, left: 15),
                  child: Icon(Icons.alarm, size: 20, color: Colors.amber,),
                ),
                Text(_clock)
              ]),
              Divider(color: Colors.amber, thickness: 2,
              ),
              ListTile(
                leading: CircleAvatar(),
                title: Text(this.cardList[position].medicine,),
                subtitle: Text(this.cardList[position].person_name),
                trailing: Text(""),
                onTap: () {
                  debugPrint("ListTile Tapped");
                  // navigateToDetail(this.noteList[position],'Edit ');
                },
              ),
              Padding(padding: const EdgeInsets.only(right: 75.0), child: Text("1ساعة 35 دقيقة"),),
              Divider(color: Colors.amber, thickness: 1,
              ),
              Row(children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0, right: 75, left: 75),
                  child: MaterialButton(
                      clipBehavior: Clip.hardEdge,
                      animationDuration: Duration(milliseconds: 5),
                      color: Colors.green,
                      padding: EdgeInsets.only(
                          left: 35, right: 35, top: 15, bottom: 0),
                      child: Text("تم", style: TextStyle(color: Colors.white, fontSize: 15),),
                      onPressed: () {
                       // cardList=List<Card_info>();
                     //   print(cardList.length);
                    // if(cardList!=null)
                  // print(cardList.elementAt(0).medicine);


                      }),
                ),
                Divider(thickness: 2, height: 5,),
                IconButton(
                    icon: Icon(Icons.delete, size: 30, color: Colors.blue,), onPressed: () {
                      _delete(context, cardList[position].diagId);
                    }),
              ])
            ]));
      },
    );
  }

  addCardListView(){
    final Future<Database> dbFuture = databaseHelper.initializeDatabase();
    Future<List<Card_info>> cardListFuture = databaseHelper.getAllIds();
    cardListFuture.then((cardList) {
      setState(() {
        debugPrint("list has change");
        this.cardList = cardList;
        this.count = cardList.length;
         print(cardList.length);

      });
  });
  }

  void updateCardInfo() {
    if (Timesupdate.res)
    {
      print("add");
      addCardListView();
      Timesupdate.res = false;

    }

  }

  void _delete(BuildContext context, int id) async {
    int result = await databaseHelper.deleteDiagon(id);
    if (result != 0) {
      _showSnackBar(context, ' Deleted Successfully');
      addCardListView();
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
