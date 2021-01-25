import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ssd/Pages/times_radioButton.dart';
import 'package:ssd/Pages/process time.dart';
import 'package:ssd/models/data.dart';
import 'package:ssd/models/note.dart';
import 'package:ssd/utils/database_helper.dart';
import 'diagon.dart';
import 'first_date.dart';
import 'instruction.dart';

class Main_input extends StatefulWidget {
  @override
  _Main_inputState createState() => _Main_inputState();
}

class _Main_inputState extends State<Main_input> {
  File _image;
  TextEditingController nameController = TextEditingController();
  DatabaseHelper helper = DatabaseHelper();
  String appBarTitle;
  Medicine medicin = Medicine();
  Patient patient = new Patient();
  Diagon diagon_object = Diagon();
  Times times_object = Times.WithId();
  TextEditingController patnameController = TextEditingController();
  TextEditingController noticeController = TextEditingController();
  TextEditingController medTitleController = TextEditingController();
  TextEditingController medAmountController = TextEditingController();
  TextEditingController img_directController = TextEditingController();
  var style1 =
      TextStyle(fontSize: 14, fontWeight: FontWeight.bold, fontFamily: 'Amiri');
  var style2 = TextStyle(
      fontSize: 14, fontWeight: FontWeight.normal, fontFamily: 'Amiri');
  var style4 = TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.normal,
      fontFamily: 'Amiri',
      color: Colors.white);
  @override
  Widget build(BuildContext context) {
    var style3 = TextStyle(color: Colors.black, fontFamily: 'Amiri');
    return MaterialApp(
        home: Directionality(
            textDirection: TextDirection.rtl, child: homePage()));
  }

  Widget homePage() {
    return Scaffold(
      appBar: AppBar(
        title: Text("kk"),
      ),
      body: ListView(
        children: <Widget>[
          Row(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
            Expanded(
              child: Padding(
                  padding:
                      EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 5),
                  child: Text("17:35")),
              flex: 1,
            ),
            Expanded(
              child: Padding(
                  padding:
                      EdgeInsets.only(right: 15, left: 15, top: 15, bottom: 5),
                  child: Text("20/12/2020")),
              flex: 0,
            )
          ]),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                backgroundImage: _image == null ? null : FileImage(_image),
                radius: 75,
                foregroundColor: Colors.amber,
                backgroundColor: Colors.amber,
              ),
              GestureDetector(onTap: pickImage, child: Icon(Icons.camera_alt))
            ],
          ),
          Padding(
              padding:
                  EdgeInsets.only(right: 15.0, left: 15, bottom: 15, top: 50),
              child: TextField(
                controller: patnameController,
                onSubmitted: (value) {},
                style: style2,
                decoration: InputDecoration(
                    labelText: 'اسم المريض',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.amber),
                      borderRadius: BorderRadius.circular(15),
                    )),
              )),
          Padding(
              padding:
                  EdgeInsets.only(right: 15.0, left: 15, bottom: 15, top: 5),
              child: TextField(
                controller: medTitleController,
                style: style2,
                decoration: InputDecoration(
                    labelText: 'اسم الدواء',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15))),
              )),
          Padding(
              padding:
                  EdgeInsets.only(right: 15.0, left: 15, bottom: 15, top: 5),
              child: TextField(
                controller: medAmountController,
                style: style2,
                decoration: InputDecoration(
                    labelText: 'الجرعة',
                    hintText: "1 كبسولة",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15))),
              )),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: <
              Widget>[
            MaterialButton(
                color: Colors.deepOrange,
                padding:
                    EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 5),
                child: Text(
                  "المواعيد",
                  style: style4,
                ),
                onPressed: () async {
                  bool result = await Navigator.push(context,
                      MaterialPageRoute(builder: (context) {
                    return Radiooo();
                  }));
                  if (result == true) {
                    update_mtTitle();
                    print(Entry.code + Entry.times_num);
                  }
                }),
            MaterialButton(
                clipBehavior: Clip.hardEdge,
                animationDuration: Duration(milliseconds: 5),
                color: Colors.green,
                padding:
                    EdgeInsets.only(left: 35, right: 35, top: 15, bottom: 5),
                child: Text(
                  "تاريخ البدء",
                  style: style4,
                ),
                onPressed: () async {
                  bool result = await Navigator.push(context,
                      MaterialPageRoute(builder: (context) {
                    return First_date();
                  }));
                  if (result == true) {
                    update_Firstdate();
                    print(Entry.first_clock + Entry.first_date);
                  }
                }),
            MaterialButton(
                color: Colors.blue,
                padding:
                    EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 5),
                child: Text(
                  "مدة العلاج",
                  style: style4,
                ),
                onPressed: () async {
                  bool result = await Navigator.push(context,
                      MaterialPageRoute(builder: (context) {
                    return Process_time();
                  }));
                  if (result == true) {
                    updateteartTime();
                    print(Entry.teratment_days);
                  }
                })
          ]),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: <
              Widget>[
            MaterialButton(
                color: Colors.deepOrange,
                padding:
                    EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 5),
                child: Text(
                  "التعليمات",
                  style: style4,
                ),
                onPressed: () async {
                  bool result = await Navigator.push(context,
                      MaterialPageRoute(builder: (context) {
                    return Instruction();
                  }));
                  if (result == true) {
                    updateInstruction();
                    debugPrint(Entry.instruc);
                  }
                }),
            MaterialButton(
                color: Colors.green,
                padding:
                    EdgeInsets.only(left: 35, right: 35, top: 15, bottom: 5),
                child: Text(
                  "التشخيص",
                  style: style4,
                ),
                onPressed: () async {
                  bool result = await Navigator.push(context,
                      MaterialPageRoute(builder: (context) {
                    return Diagonsis();
                  }));
                  if (result == true) {
                    update_diagon();
                    print(Entry.pain + Entry.doct_name);
                  }
                }),
            MaterialButton(
                color: Colors.blue,
                padding:
                    EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 5),
                child: Text(
                  "المرفقات",
                  style: style4,
                ),
                onPressed: () {})
          ]),
          Padding(
              padding:
                  EdgeInsets.only(right: 15.0, left: 15, bottom: 0, top: 15),
              child: TextField(
                controller: noticeController,
                style: style2,
                decoration: InputDecoration(
                    labelText: 'ملاحظات',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15))),
              )),
          Divider(
            color: Colors.amber,
          ),
          ListTile(
            title: Text(
              "إظهار المواعيد",
              style: style1,
            ),
            subtitle: Text(
              "إظهار مواعيد هذا الدواء في قائمة المهام في الصفحة الرئيسية للتطبيق",
              style: style2,
            ),
            trailing: Switch(
              value: true,
              onChanged: (value) {
                setState(() {});
              },
              activeTrackColor: Colors.lightGreenAccent,
              activeColor: Colors.green,
            ),
          ),
          Divider(
            color: Colors.amber,
          ),
          ListTile(
            leading: Icon(Icons.music_note, size: 50, color: Colors.black),
            title: Text(
              "نغمة الرنين",
              style: style1,
            ),
            trailing: DropdownButton(),
          ),
          Divider(
            color: Colors.amber,
          ),
          ListTile(
            leading: Icon(Icons.palette, size: 50, color: Colors.black),
            title: Text("اللون", style: style1),
            trailing: DropdownButton(),
          ),
          Divider(
            color: Colors.amber,
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 15),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  MaterialButton(
                      color: Colors.green,
                      padding: EdgeInsets.only(
                          left: 35, right: 35, top: 15, bottom: 5),
                      child: Text(
                        "موافق",
                        style: style4,
                      ),
                      onPressed: () {
                        _save();
                      }),
                  MaterialButton(
                      color: Colors.blue,
                      padding: EdgeInsets.only(
                          left: 35, right: 35, top: 15, bottom: 5),
                      child: Text("الغاء الأمر", style: style4),
                      onPressed: () {
                        moveToLastScreen();
                      })
                ]),
          )
        ],
      ),
    );
  }

  void pickImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);

    setState(() {
      _image = image;
    });
  }

  void update_patname() {
    patient.patName = patnameController.text;
  }

  void update_medTitle() {
    medicin.medTitle = medTitleController.text;
  }

  void update_medAmount() {
    diagon_object.medAmount = medAmountController.text;
  }

  void update_mtTitle() {
    diagon_object.times = Entry.times_num;
  }

  void updateteartTime() {
    diagon_object.dayes = Entry.teratment_days;
  }

  void updateInstruction() {
    diagon_object.instruction = Entry.instruc;
  }

  void update_Firstdate() {
    diagon_object.firstClock = Entry.first_clock;
    diagon_object.firstDate = Entry.first_date;
  }

  void update_diagon() {
    diagon_object.doctName = Entry.doct_name;
    diagon_object.diagon = Entry.pain;
  }

  void update_relatedMed() {
    //.description = relatedMedTitleController.text;
  }
  void update_doctname() {
    // diagon.doctName = doctnameController.text;
  }
  void update_img_direct() {
    diagon_object.img_direct = img_directController.text;
  }

////////////////////////////////////////////////////////////////////////////
  void _save() async {
    moveToLastScreen();
    int result, result2, res3, res4;
    medicin.medTitle = medTitleController.text;
    medicin.medform = "كبسولة";
    patient.patName = patnameController.text;
    diagon_object.notice = noticeController.text;
    diagon_object.medId = await helper.insert_medicine(medicin);
    diagon_object.patId = await helper.insertPatient(patient); //id
    result2 = await helper.insertDiagon(diagon_object);
    debugPrint("insert_diagon$result2");

    int z = diagon_object.patId;
    debugPrint("insert_patent  $z");
    //int w = diagon_object.medId;

    // debugPrint('med$result');
    ///////////////////////////////////////////////////////////////////////////////
    // if (z != 0) {
    //   // Success
    //   _showAlertDialog('Status', 'medicin Saved Successfully');
    // } else {
    //   // Failure
    //   _showAlertDialog('Status', 'Problem Saving Note');
    // }
  }

/////////////////////////////////////////////////////////////////////////////////
  void moveToLastScreen() {
    Navigator.pop(context, true);
  }

/////////////////////////////////////////////////////////////////////////////////
  void _showAlertDialog(String title, String message) {
    AlertDialog alertDialog = AlertDialog(
      title: Text(title),
      content: Text(message),
    );
    message = "mosa";
    showDialog(context: context, builder: (_) => alertDialog);
  }
  ////////////////////////////////////////////////////////////////////////////

  void calcTimesobject(int clock_first, int w) {
    for (var i = 0; i < int.parse(Entry.teratment_days); i++) {
      //day =day +1
      int day, month, year;
      nextDay(day, month, year);
      for (var j = 0; j < int.parse(Entry.times_num); j++) {
        //clock =clock +1
        nextTime(clock_first, w);
      }
    }
  }

  nextTime(clock_first, w) {
    int minuts, hour;
    clock_first = clock_first + w;
    while (minuts > 60) {
      if (hour > 24) {
        hour = 0;
        break;
      }
      hour = hour + 1;
      minuts = minuts - 60;
    }
  }

  nextDay(int day, int month, int year) {
    if ((month == 1) ||
        (month == 3) ||
        (month == 5) ||
        (month == 7) ||
        (month == 8) ||
        (month == 10) ||
        (month == 12)) {
      if (day <= 30) {
        day++;
      } else {
        if (day <= 31 && month == 12) {
          day = 1;
          month = 1;
          year++;
        } else {
          month++;
          day++;
        }
      }
    } else {
      if (month == 2) {
        if ((year / 4) != 0) {
          month++;
          day == 1;
        } else
          day++;
      }
    }
    if ((month == 1) ||
        (month == 4) ||
        (month == 6) ||
        (month == 9) ||
        (month == 11)) {
      if (day <= 29) {
        day++;
      } else {
        month++;
        day = 1;
      }
    }
  }
}
