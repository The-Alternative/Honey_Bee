import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ssd/Pages/times_radioButton.dart';
import 'package:ssd/Pages/process time.dart';
import 'package:ssd/models/const_data.dart';
import 'package:ssd/models/db_models.dart';
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
  TextEditingController _nameController = TextEditingController();
  DatabaseHelper _helper = DatabaseHelper();
  String _appBarTitle;
  Medicine _medicin = Medicine();
  Patient _patient = new Patient();
  Diagon _diagonObject = Diagon();
  Times _timesObject = Times.WithId();
  TextEditingController _patnameController = TextEditingController();
  TextEditingController _noticeController = TextEditingController();
  TextEditingController _medTitleController = TextEditingController();
  TextEditingController _medAmountController = TextEditingController();
  TextEditingController _imgDirectController = TextEditingController();
  var style1 = TextStyle(fontSize: 14, fontWeight: FontWeight.bold, fontFamily: 'Amiri');
  var style2 = TextStyle(fontSize: 14, fontWeight: FontWeight.normal, fontFamily: 'Amiri');
  var style4 = TextStyle(fontSize: 14, fontWeight: FontWeight.normal, fontFamily: 'Amiri', color: Colors.white);
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
                controller: _patnameController,
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
                controller: _medTitleController,
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
                controller: _medAmountController,
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
                controller: _noticeController,
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
                  MaterialButton(color: Colors.green, padding: EdgeInsets.only(left: 35, right: 35, top: 15, bottom: 5),
                      child: Text("موافق", style: style4,
                      ), onPressed: () {
                    _save();
                      }),
                  MaterialButton(color: Colors.blue, padding: EdgeInsets.only(left: 35, right: 35, top: 15, bottom: 5),
                      child: Text("الغاء الأمر", style: style4), onPressed: () {
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
    _patient.patName = _patnameController.text;
  }

  void update_medTitle() {
    _medicin.medTitle = _medTitleController.text;
  }

  void update_medAmount() {
    _diagonObject.medAmount = _medAmountController.text;
  }

  void update_mtTitle() {
    _diagonObject.times = Entry.times_num;
  }

  void updateteartTime() {
    _diagonObject.dayes = Entry.teratment_days;
  }

  void updateInstruction() {
    _diagonObject.instruction = Entry.instruc;
  }

  void update_Firstdate() {
    _diagonObject.firstClock = Entry.first_clock;
    _diagonObject.firstDate = Entry.first_date;
  }

  void update_diagon() {
    _diagonObject.doctName = Entry.doct_name;
    _diagonObject.diagon = Entry.pain;
  }

  void update_relatedMed() {
    //.description = relatedMedTitleController.text;
  }
  void update_doctname() {
    // diagon.doctName = doctnameController.text;
  }
  void update_img_direct() {
    _diagonObject.img_direct = _imgDirectController.text;
  }

////////////////////////////////////////////////////////////////////////////
  void _save() async {
    moveToLastScreen();
    int result, result2, res3, res4;
    _medicin.medTitle = _medTitleController.text;
    _medicin.medform = "كبسولة";
    _patient.patName = _patnameController.text;
    _diagonObject.notice = _noticeController.text;
    _diagonObject.medId = await _helper.insert_medicine(_medicin);
    _diagonObject.patId = await _helper.insertPatient(_patient); //id
    result2 = await _helper.insertDiagon(_diagonObject);
    debugPrint("insert_diagon$result2");

    int z = _diagonObject.patId;
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
    if ((month == 1) || (month == 3) || (month == 5) || (month == 7) || (month == 8) || (month == 10) || (month == 12))
    {if (day <= 30) {day++;}
      else
        {
        if (day <= 31 && month == 12)
        {day = 1 ;month = 1 ; year++;}
        else
          {month++ ; day++;}
        }
    } else
      {if (month == 2)
      {if ((year / 4) != 0)
        {month++;day == 1;}
        else day++;
      }
    }
    if ((month == 1) || (month == 4) || (month == 6) || (month == 9) || (month == 11))
    {if (day <= 29) {day++;}
      else {month++;day = 1;}
    }
  }
}
