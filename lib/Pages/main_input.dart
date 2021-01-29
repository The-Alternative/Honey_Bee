import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ssd/Pages/times_list.dart';
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
  //MedicineTimes _timesObject = MedicineTimes.WithId();
  TextEditingController _patnameController = TextEditingController();
  TextEditingController _noticeController = TextEditingController();
  TextEditingController _medTitleController = TextEditingController();
  TextEditingController _medAmountController = TextEditingController();
  TextEditingController _imgDirectController = TextEditingController();
  int _day, _month, _year;
  int _lastDay;
  int _hour;
  int _menuts,d;
  List<Medicine_clocl> _clockList;
  List<Medicine_Date> _dateList;
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
                      // _cancel();
                        Timesupdate.res2 =true;
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
    var arr = List(3);

    arr = Entry.first_date.split('/');
    _day = int.parse(arr[2]);
    _month = int.parse(arr[1]);
    _year = int.parse(arr[0]);
    print(_month);
    arr = Entry.first_clock.split(':');
    _hour = int.parse(arr[0]);
    _menuts = int.parse(arr[1]);
    print(_hour);
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
    int result, _diagonId, res3, res4;
    Timesupdate.res2 =true;
    _medicin.medTitle = _medTitleController.text;
    _medicin.medform = "كبسولة";
    _patient.patName = _patnameController.text;
    _diagonObject.notice = _noticeController.text;
    _diagonObject.medId = await _helper.insert_medicine(_medicin);
    _diagonObject.patId = await _helper.insertPatient(_patient); //id
    _diagonId = await _helper.insertDiagon(_diagonObject);
    _dateList = List<Medicine_Date>();_clockList=List<Medicine_clocl>();
    _calcDaylist(int.parse(Entry.teratment_days));
    if(_diagonId!=0 && _dateList.length!=0 &&int.parse(Entry.times_num)!=0)
      _cancel(_diagonId);
   // _calcTimeList(_diagonId);
    int l=_dateList.length;
    debugPrint("insert_diagon$_diagonId");
    int z = _diagonObject.patId;
    moveToLastScreen();
    debugPrint("insert_patent  $z");

    if (_diagonId != 0) {
      // Success
      _showAlertDialog('Status', 'diagon:$_diagonId Saved Successfully');
    } else {
      // Failure
      _showAlertDialog('Status', 'daiagon Saving Note');
    }
    //moveToLastScreen();

  }

/////////////////////////////////////////////////////////////////////////////////
  void moveToLastScreen() {
    Navigator.pop(context, true);
  }
////////////////////////////
  _cancel(int id){
    Timesupdate.res2 =true;
    _dateList = List<Medicine_Date>();
    _clockList=List<Medicine_clocl>();

    _calcDaylist(int.parse(Entry.teratment_days));
    _calcTimeList(id);

    int l=_clockList.length;
   // print('_clockList :$l');

    // for(int i=0;i<_clockList.length;i++)
    //   {
    //     int a= _clockList[i].dayDate;
    //
    //     print('$a :'+_clockList[i].clock);
    //   }
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

  _calcTimeList(int diagon) async {
    var arr=List(2);
    int dayId =0;
   // _clockList=  List<Medicine_clocl>();
    arr = Entry.first_clock.split(':');
    _hour = int.parse(arr[0]);
   // print('rrrr$_hour');
    double times_num=24/int.parse(Entry.times_num);
    int xx= times_num.round();
    //print('new time:$times_num');
    _clockList.clear();
    _menuts = int.parse(arr[1]);
    for (var x = 0; x < _dateList.length; x++) {
      int a = _dateList.elementAt(x).day;
      int b = _dateList.elementAt(x).month;
      int c = _dateList.elementAt(x).year;
      String forma ='$c'+'/' +formal(b)+'/'+formal(a);
      String forma2 = '$c'+formal(b)+formal(a);

      dayId =0;
    dayId = await _helper.insertDayes(MedicineDays(diagon, forma,int.parse(forma2)));
     // print('new day:$dayId');
    if(dayId!=0)
     _calcTimeDay(dayId,xx);
    }
  }
  String formal(int num){
    String forma = '$num';
    if(forma.length==1)
      forma='0'+forma;
    return forma;
  }
  _calcTimeDay(int dateDayId,int w) async {
    while(_hour<24){
     String s=formal(_hour)+':'+formal(_menuts);
      //add to list
      _clockList.add(Medicine_clocl(dateDayId,s));
     //int q = await _helper.insert_DayTimes(MedicineTimes(dateDayId,s,1));
     _hour=_hour+w;
    }
    for(int i=0;i<_clockList.length;i++)
      {    //  int q = await _helper.insert_DayTimes(MedicineTimes(dateDayId,_clockList[i].clock,1));
       String s =_clockList[i].clock;
      print('$i'+s);
      }
     // int q = await _helper.insert_DayTimes(MedicineTimes(dateDayId,_clockList[i].clock,1));
    //_clockList.clear();
     for(int i=0;i<_clockList.length;i++)
    {
      int a= _clockList[i].dayDate;
      String ss =_clockList[i].clock;
      //print('$a :'+ss);
       _helper.insert_DayTimes(MedicineTimes(dateDayId,ss,1));
    }
    _clockList.clear();
     _hour = _hour-24;
    //print('new h:$_hour');
  }
  _calcDaylist(int teartmentDay) {
    var arr = List(3);
    arr = Entry.first_date.split('/');
    int maxDayes =0;
    _day = int.parse(arr[2]);
    _month = int.parse(arr[1]);
    _year = int.parse(arr[0]);
     d=0;
    int j = 1;
    int w ;
    _lastDay = _day + teartmentDay;
    //print(_day);
    //print(_lastDay);
    _dateList.clear();

    for (d = _day; d < _lastDay; d++) {
      if ((_month == 1) ||
          (_month == 3) ||
          (_month == 5) ||
          (_month == 7) ||
          (_month == 8) ||
          (_month == 10)) {
        w = 31;
        if (d <= 31) {
          _calc1MadicineDateDay( d);
        } else {
          if(_month == 7) w=32;
          if(_month ==1) {if(_year%4==0)w=30;else w=29;}
          calc2MadicineDateDay(j, w);
        }
      }
      if ((_month == 2) ||
          (_month == 4) ||
          (_month == 6) ||
          (_month == 9) ||
          (_month == 11)) {
        w = 32;
        if (d < 31) {
          _calc1MadicineDateDay( d);
        } else {
          calc2MadicineDateDay( j, w);
        }
      }
      if (_month == 12) {
        if (d <= 31) {
          _calc1MadicineDateDay(d);
        } else {
          calc3MadicineDateDay(d, j);
        }
      }
      if (_month == 2) {
        w=32;
        if(_year%4==0)  maxDayes=29;else maxDayes=28;
        if (d < maxDayes) {
          _calc1MadicineDateDay(d);
        } else {
          calc2MadicineDateDay(j, w);
        }
      }
    }
  }

  _calc1MadicineDateDay(int i) {
    _dateList.add(Medicine_Date(i,_month,_year));
  }

  calc2MadicineDateDay( int j, int w) {
    _month++;
    print('work2');
    while (j < w && d < _lastDay) {
      _dateList.add(Medicine_Date(j,_month,_year));
      j++;
     d++;
    }
    j = 1;
  }

  calc3MadicineDateDay( int i, int j) {
    _year++;
    while (j <= 31 && i < _lastDay) {
      _dateList.add(Medicine_Date(j,1,_year));
      j++;
      i++;
    }
    _month = 1;

    j = 1;
  }
}
