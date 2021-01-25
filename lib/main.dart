<<<<<<< HEAD
import 'package:android_alarm_manager/android_alarm_manager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:ssd/Pages/main_input.dart';
import 'package:ssd/utils/database_helper.dart';
import 'package:ssd/utils/notifiers.dart';
import 'Pages/times_list.dart';
import 'models/note.dart';

const List<Choice> choices = <Choice>[
  Choice(title: 'مواعيد', icons: Icons.notifications_active_rounded),
  Choice(
    title: 'أسماء',
    icons: Icons.notes,
  ),
  Choice(title: 'سجل الدواء', icons: Icons.eleven_mp),
];

class Choice {
  final String title;
  final IconData icons;

  const Choice({this.title, this.icons});
}

Future<void> main() async {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<SingleNotifier>(
        create: (_) => SingleNotifier(),
      ),
      ChangeNotifierProvider<MultipleNotifier>(
        create: (_) => MultipleNotifier([]),
      )
    ],
    child: MyApp(),
  ));
  await AndroidAlarmManager.initialize();
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          primaryColor: Colors.redAccent,
          primaryColorDark: Colors.red,
          fontFamily: 'Amiri'),
      home: DefaultTabController(
        length: choices.length,
        child: MyHomePage(title: 'Flutter  Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          appBar: AppBar(
              title: const Text(
                "الأدوية ",
                style: TextStyle(color: Colors.black, fontSize: 25),
              ),
              backgroundColor: Colors.amber[400],
              actions: <Widget>[
                IconButton(
                    visualDensity: VisualDensity(horizontal: 2, vertical: 3),
                    padding: EdgeInsets.only(left: 15),
                    icon: Icon(
                      Icons.add,
                      size: 45,
                    ),
                    onPressed: () {
                      //navigateToCrud();
                    }),
              ],
              leading: Padding(
                child: CircleAvatar(
                    child: Image.asset(
                  "images/med.png",
                )),
                padding: EdgeInsets.only(top: 2, left: 8),
              ),
              titleSpacing: 4,
              bottom: PreferredSize(
                  preferredSize: Size.fromHeight(60),
                  child: Column(children: <Widget>[
                    Divider(
                      height: 0,
                      color: Colors.white,
                      thickness: 2,
                    ),
                    TabBar(
                      labelPadding: EdgeInsets.only(left: 30, right: 30),
                      labelStyle: TextStyle(fontSize: 15),
                      unselectedLabelColor: Colors.black,
                      isScrollable: true,
                      tabs: choices.map<Widget>((Choice choice) {
                        return Tab(
                          //iconMargin: EdgeInsets.only(left: 45, right: 45),

                          text: choice.title,
                        );
                      }).toList(),
                    ),
                  ]))),
          body: gettabbar(),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              navigateTomain_input();
            },
            tooltip: 'Add Note',
            child: Icon(Icons.add),
          ), // This trailing comma makes auto-formatting nicer for build methods.
        ));
  }

  void navigateTomain_input() async {
    bool result =
        await Navigator.push(context, MaterialPageRoute(builder: (context) {
      return Main_input();
    }));

    if (result == true) {
      Timesupdate.res = true;
      if (Timesupdate.res) debugPrint("fff");
      Time_listState();
      // debugPrint(new update("hhh").s );

      main();
      debugPrint("update");
    }
  }

  TabBarView gettabbar() {
    return TabBarView(
      children: choices.map((Choice choice) {
        return Padding(
          padding: const EdgeInsets.all(10),
          child: ChoisePage(
            choice: choice,
          ),
        );
      }).toList(),
    );
  }
}

class ChoisePage extends StatelessWidget {
  const ChoisePage({Key key, this.choice}) : super(key: key);
  final Choice choice;

  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle = Theme.of(context).textTheme.display1;
    return ff(choice.title);
  }

  Widget ff(String s) {
    if (s == 'مواعيد') {
      debugPrint("refresh");

      //NoteListState().updateListView();       //note_list.updateListView();
      return Time_list();
    } else
      return Card(
        color: Colors.white,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Icon(
                choice.icons,
                size: 150.0,
                color: Colors.pink,
              ),
              Text(
                choice.title,
                style: TextStyle(color: Colors.black),
              ),
              Divider(
                height: 1,
              ), //Directionality(textDirection: TextDecoration.rtl, child: null)

              // dd(choice.title,context),
            ],
          ),
        ),
      );
    ;
  }
}
=======
import 'package:childrensdiary/models/event.dart';
import 'package:childrensdiary/views/AddEvent.dart';
import 'package:childrensdiary/views/AddHealthNote.dart';
import 'package:childrensdiary/views/ChildDevelopment.dart';
import 'package:childrensdiary/views/ChildEvents.dart';
import 'package:childrensdiary/views/ChildHabits.dart';
import 'package:childrensdiary/views/ChildHealth.dart';
import 'package:childrensdiary/views/ChildInfo.dart';
import 'package:childrensdiary/views/Habits.dart';
import 'package:childrensdiary/views/Home.dart';
import 'package:childrensdiary/controllers/childController.dart';
import 'package:childrensdiary/controllers/healthController.dart';
import 'package:childrensdiary/models/child.dart';
import 'package:childrensdiary/models/health.dart';
import 'package:childrensdiary/views/Search.dart';
import 'package:childrensdiary/views/Test.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:childrensdiary/Routes.dart';

import 'controllers/eventController.dart';

//List list1;
void main() async{
  var db = new ChildController();
  WidgetsFlutterBinding.ensureInitialized();
////  int childSaved = await db.saveChild(
////    new Child('Ali', 'male',1, 'glfdmklghd', 0)
////  );
////  print("saved child : $childSaved");
  Child list=await db.getChild(5);
  print(list.name);
//
//  print('----------------------');
  var db2 = new EventController();
//  WidgetsFlutterBinding.ensureInitialized();
//  int healthSaved = await db2.saveHealth(
//      new Health('ssssssss', 'ssssss', 143, 54, 37, 15, 15, 453)
//  );
//  print("saved health : $healthSaved");
  List list1=await db2.getChildEvents(5);
  print(list1[3]);
//   list1=await db2.getAllHealth();
//  for(int i=5; i <list1.length; i++)
////    Health x = Health.map(list1[i]);
//  print('id: ${Health.map(list1[i]).id}');
  runApp(new MaterialApp(
    home:new Home(),
  ));
}


>>>>>>> 22712bb269e3af37d3dd509b94b8b0688d8c551f
