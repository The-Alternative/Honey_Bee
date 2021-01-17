import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:ssd/models/const_data.dart';

class First_date extends StatefulWidget {
  @override
  _First_dateState createState() => _First_dateState();
}

class _First_dateState extends State<First_date> {
  var style1 = TextStyle(fontSize: 23, fontWeight: FontWeight.bold, fontFamily: 'Amiri');
  var style2 = TextStyle(fontSize: 14, color: Colors.black, fontWeight: FontWeight.normal, fontFamily: 'Amiri');
  TextEditingController dateController = TextEditingController();
  TextEditingController clockController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
            appBar: AppBar(
                title: Text(
              " Times",
            )),
            body: Padding(
                padding: EdgeInsets.only(top: 5.0, bottom: 5),
                child: Card(
                  color: Colors.white,
                  elevation: 15.0,
                  child: get_body(context),
                ))));
  }

  Widget get_body(BuildContext context) {
    return ListView(
      children: <Widget>[
        Padding(
            padding: EdgeInsets.only(bottom: 50.0),
            child: ListTile(
              title: Text('تاريخ البدء', style: style1),
              trailing: Icon(
                Icons.date_range,
                size: 100,
                color: Colors.blue[500],
              ),
            )),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: <Widget>[
              Expanded(
                child: Text(
                  "التاريخ",
                  style: style2,
                ),
                flex: 1,
              ),
              Expanded(
                child: TextFormField(
                  style: style2,
                  expands: false,
                  controller: dateController,
                  onTap: () {
                    DatePicker.showDatePicker(context,
                        showTitleActions: true,
                        minTime: DateTime(2018, 3, 5),
                        maxTime: DateTime(2050, 6, 7),
                        theme: DatePickerTheme(
                            headerColor: Colors.orange,
                            backgroundColor: Colors.blue,
                            itemStyle: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                            doneStyle:
                                TextStyle(color: Colors.white, fontSize: 16)),
                        onConfirm: (date) {
                      // update.udate='confirm $date';
                      print('confirm $date');
                      ch_date('$date');
                    }, currentTime: DateTime.now(), locale: LocaleType.en);
                  },
                  readOnly: true,
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: Colors.amber),
                  )),
                ),
                flex: 2,
              ),
              Expanded(
                child:
                    Icon(Icons.date_range, size: 75, color: Colors.teal[300]),
                flex: 1,
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: <Widget>[
              Expanded(
                child: Text(
                  "الساعة",
                  style: style2,
                ),
                flex: 1,
              ),
              Expanded(
                child: TextFormField(
                  style: style2,
                  expands: false,
                  controller: clockController,
                  readOnly: true,
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: Colors.amber),
                  )),
                  onTap: () {
                    DatePicker.showTime12hPicker(context,
                        showTitleActions: true, onConfirm: (date) {
                      print('confirm $date');
                      ch_time('$date');
                    }, currentTime: DateTime.now());
                  },
                ),
                flex: 2,
              ),
              Expanded(
                child: Icon(
                  Icons.access_time_sharp,
                  size: 75,
                  color: Colors.teal[300],
                ),
                flex: 1,
              )
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: FlatButton(
                  child: Text(
                    'حفظ',
                    style: style2,
                  ),
                  onPressed: () {
                    update_tdata(dateController.text, clockController.text);
                    succses_moveToLastScreen(context);
                  }),
              flex: 1,
            ),
            Expanded(
              child: FlatButton(
                padding: EdgeInsets.only(),
                child: Text(
                  'الغاء الأمر',
                  style: style2,
                ),
                onPressed: () {
                  clear_tdata();
                  fail_moveToLastScreen(context);
                },
              ),
              flex: 0,
            ),
          ],
        )
      ],
    );
  }

  void ch_time(String s) {
    setState(() {
      clockController.text = s.substring(11, 16);
    });
  }

  void ch_date(String s) {
    setState(() {
      dateController.text = s.substring(0, 10);
    });
  }

  void succses_moveToLastScreen(BuildContext context1) {
    Navigator.pop(context1, true);
  }

  void fail_moveToLastScreen(BuildContext context1) {
    Navigator.pop(context1, false);
  }

  void update_tdata(String s1, String s2) {
    Entry.first_date = s1; //عدد المرات
    Entry.first_clock = s2;
  }

  void clear_tdata() {
    Entry.first_clock = "";
    Entry.first_date = "";
  }
}

class CustomPicker extends CommonPickerModel {
  String digits(int value, int length) {
    return '$value'.padLeft(length, "0");
  }

  CustomPicker({DateTime currentTime, LocaleType locale})
      : super(locale: locale) {
    this.currentTime = currentTime ?? DateTime.now();
    this.setLeftIndex(this.currentTime.hour);
    this.setMiddleIndex(this.currentTime.minute);
    this.setRightIndex(this.currentTime.second);
  }

  @override
  String leftStringAtIndex(int index) {
    if (index >= 0 && index < 24) {
      return this.digits(index, 2);
    } else {
      return null;
    }
  }

  @override
  String middleStringAtIndex(int index) {
    if (index >= 0 && index < 60) {
      return this.digits(index, 2);
    } else {
      return null;
    }
  }

  @override
  String rightStringAtIndex(int index) {
    if (index >= 0 && index < 60) {
      return this.digits(index, 2);
    } else {
      return null;
    }
  }

  @override
  String leftDivider() {
    return "|";
  }

  @override
  String rightDivider() {
    return "|";
  }

  @override
  List<int> layoutProportions() {
    return [1, 2, 1];
  }

  @override
  DateTime finalTime() {
    return currentTime.isUtc
        ? DateTime.utc(
            currentTime.year,
            currentTime.month,
            currentTime.day,
            this.currentLeftIndex(),
            this.currentMiddleIndex(),
            this.currentRightIndex())
        : DateTime(
            currentTime.year,
            currentTime.month,
            currentTime.day,
            this.currentLeftIndex(),
            this.currentMiddleIndex(),
            this.currentRightIndex());
  }
}
