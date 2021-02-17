
import 'package:childrensdiary/views/Home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:image_picker/image_picker.dart';


void main() async{

  runApp(new MaterialApp(
    home:new Home(),
  ));
}



import 'dart:isolate';
import 'package:clock_app/views/ViewMedecineRecord/home.dart';
import 'Welcome/home.dart';
import 'utils/notifiredb.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:provider/provider.dart';
import 'views/AddMedcine/main_input.dart';
import 'utils/notifiers.dart';
import 'views/ViewTimes/timeHome.dart';
import 'views/attachmentsMedicine.dart';
import 'views/View Medicine/medicineView.dart';
import 'views/ViewTimes/times_list.dart';
void printHello() {
  final DateTime now = DateTime.now();
  final int isolateId = Isolate.current.hashCode;
  // print("[$now] Hello, world! isolate=${isolateId} function='$printHello'");
}

bool result =false;

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
FlutterLocalNotificationsPlugin();

const List<Choice> choices = <Choice>[
  Choice(title: 'مواعيد', icons: Icons.notifications_active_rounded),
  Choice(title: 'اسماء', icons: Icons.notes,),
  Choice(title: 'سجل الدواء', icons: Icons.eleven_mp),];

class Choice {
  final String title;
  final IconData icons;
  const Choice({this.title, this.icons});
}

main() async {
  WidgetsFlutterBinding.ensureInitialized();

  var initializationSettingsAndroid =
  AndroidInitializationSettings('codex_logo');
  var initializationSettingsIOS = IOSInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
      onDidReceiveLocalNotification:
          (int id, String title, String body, String payload) async {});
  var initializationSettings = InitializationSettings(
      initializationSettingsAndroid, initializationSettingsIOS);
  await flutterLocalNotificationsPlugin.initialize(initializationSettings,
      onSelectNotification: (String payload) async {
        if (payload != null) {
          debugPrint('notification payload: ' + payload);
        }
      });
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<SingleNotifier>(
        create: (_) => SingleNotifier(),
      ),
      ChangeNotifierProvider<MultipleNotifier>(
        create: (_) => MultipleNotifier([]),
      ),
      ChangeNotifierProvider<CountryProvider>(
          create: (context) => CountryProvider()),
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
          fontFamily: 'Times'),
      home: DefaultTabController(
        length: 3, child: MyHomePage(title: 'Flutter  Home Page'),
      ),
    );
  }
}


