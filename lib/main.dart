
import 'dart:isolate';

import 'package:android_alarm_manager/android_alarm_manager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ssd/Pages/main_input.dart';
import 'package:ssd/utils/notifiers.dart';
import 'Pages/times_list.dart';
void printHello() {
  final DateTime now = DateTime.now();
  final int isolateId = Isolate.current.hashCode;
  print("[$now] Hello, world! isolate=${isolateId} function='$printHello'");
}


const List<Choice> choices = <Choice>[
  Choice(title: 'مواعيد', icons: Icons.notifications_active_rounded),
  Choice(title: 'أسماء', icons: Icons.notes,),
  Choice(title: 'سجل الدواء', icons: Icons.eleven_mp),];

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
        length: choices.length, child: MyHomePage(title: 'Flutter  Home Page'),
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
                    icon: Icon(Icons.add, size: 45,),
                    onPressed: () {
                      //navigateToCrud();
                    }),
              ],
              leading: Padding(
                child: CircleAvatar(
                    child: Image.asset("images/med.png",)),
                padding: EdgeInsets.only(top: 2, left: 8),
              ),
              titleSpacing: 4,
              bottom: PreferredSize(
                  preferredSize: Size.fromHeight(60),
                  child: Column(children: <Widget>[
                    Divider(height: 0, color: Colors.white, thickness: 2,),
                    TabBar(
                      labelPadding: EdgeInsets.only(left: 30, right: 30),
                      labelStyle: TextStyle(fontSize: 15),
                      unselectedLabelColor: Colors.black,
                      isScrollable: true,
                      tabs: choices.map<Widget>((Choice choice) {
                        return Tab(text: choice.title,);}).toList(),
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
    bool result = await Navigator.push(context, MaterialPageRoute(builder: (context) {
      return Main_input();
    }));

    if (result == true) {
      Timesupdate.res = true;
      Timesupdate.res2=true;
      if (Timesupdate.res)
        debugPrint("fff");
      Time_listState();

      // debugPrint(new update("hhh").s );
      main();
      debugPrint("update");
    }
  }

  TabBarView gettabbar() {
    return TabBarView(children: choices.map((Choice choice) {
        return Padding(padding: const EdgeInsets.all(10),
          child: ChoisePage(choice: choice,),);}).toList(),
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
      return Card(color: Colors.white,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Icon(choice.icons, size: 150.0, color: Colors.pink,),
              Text(choice.title, style: TextStyle(color: Colors.black),),
              Divider(height: 1,), //Directionality(textDirection: TextDecoration.rtl, child: null)
              // dd(choice.title,context),
            ],
          ),
        ),
      );
    ;
  }
}
