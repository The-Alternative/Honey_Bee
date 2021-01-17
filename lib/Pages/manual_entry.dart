import 'package:flutter/material.dart';
import 'package:path/path.dart';

class Manual_entry extends StatefulWidget {
  @override
  _Manual_entryState createState() => _Manual_entryState();
}

class _Manual_entryState extends State<Manual_entry> {
  var style1 =
      TextStyle(fontSize: 23, fontWeight: FontWeight.bold, fontFamily: 'Amiri');
  var style2 = TextStyle(
      fontSize: 14,
      color: Colors.black,
      fontWeight: FontWeight.normal,
      fontFamily: 'Amiri');
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
                  child: get_body(),
                ))));
  }

  Widget get_body() {
    return ListView(
      children: <Widget>[
        Padding(
            padding: EdgeInsets.only(bottom: 50.0),
            child: ListTile(
              title: Text('المواعيد', style: style1),
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
                  "الموعد الأول",
                  style: style2,
                ),
                flex: 1,
              ),
              Expanded(
                child: TextFormField(
                  style: style2,
                  expands: false,
                  keyboardType: TextInputType.number,
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
              )
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
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: Colors.amber),
                  )),
                ),
                flex: 2,
              ),
              Expanded(
                child: Icon(Icons.access_time_sharp,
                    size: 75, color: Colors.teal[300]),
                flex: 1,
              )
            ],
          ),
        ),
        Divider(
          color: Colors.amber,
          thickness: 2,
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: <Widget>[
              Expanded(
                child: Text(
                  "الموعد الأول",
                  style: style2,
                ),
                flex: 1,
              ),
              Expanded(
                child: TextFormField(
                  style: style2,
                  expands: false,
                  keyboardType: TextInputType.number,
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
              )
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
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: Colors.amber),
                  )),
                ),
                flex: 2,
              ),
              Expanded(
                child: Icon(Icons.access_time_sharp,
                    size: 75, color: Colors.teal[300]),
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
                  onPressed: () {}),
              flex: 1,
            ),
            Expanded(
              child: FlatButton(
                padding: EdgeInsets.only(),
                child: Text(
                  'الغاء الأمر',
                  style: style2,
                ),
                onPressed: () {},
              ),
              flex: 0,
            ),
          ],
        )
      ],
    );
  }
}
