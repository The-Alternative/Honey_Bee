import 'package:flutter/material.dart';

class Manual_entry extends StatefulWidget {
  @override
  _Manual_entryState createState() => _Manual_entryState();
}

class _Manual_entryState extends State<Manual_entry> {
  var style1 = TextStyle(fontSize: 23, fontWeight: FontWeight.bold, fontFamily: 'Times');
  var style2 = TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.normal, fontFamily: 'Times');
  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
            appBar: AppBar(
                title: Text(" Times",)),
            body: Padding(
                padding: EdgeInsets.only(top: 5.0, bottom: 5),
                child: Card(color: Colors.white, elevation: 15.0, child: get_body(),))));
  }

  Widget get_body() {
    return ListView(
      children: <Widget>[
        Padding(
            padding: EdgeInsets.only(bottom: 25.0,top: 25),
            child: ListTile(
              title: Text('المواعيد', style: style1),
              trailing: Image.asset("assets/calendar2.png" ,
    width: 75, height: 75,))),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: <Widget>[
              Expanded(
                child: Text("الموعد الأول", style: style2,), flex: 1,),
              Expanded(
                child: TextFormField(style: style2, expands: false,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.amber),)),
                ), flex: 2,),
              Expanded(
                child:
                Image.asset("assets/calendar3.png" ,
                  width: 60, height: 60,), flex: 1,)
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: <Widget>[
              Expanded(
                child: Text("الساعة", style: style2,), flex: 1,),
              Expanded(
                child: TextFormField(style: style2, expands: false, keyboardType: TextInputType.number,
                  decoration: InputDecoration(enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.amber),),),
                ), flex: 2,
              ),
              Expanded(
                child:  Image.asset("assets/clock.png" ,
                  width: 60, height: 60,),
                flex: 1,)
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15,right: 15),
          child: Divider(
            color: Colors.amber,
            thickness: 1,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row
            (
            children: <Widget>
            [
              Expanded(
                child: Text("الموعد الأول", style: style2,), flex: 1,),
              Expanded(
                child: TextFormField(
                  style: style2, expands: false, keyboardType: TextInputType.number,
                  decoration: InputDecoration(enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.amber),)),
                ), flex: 2,),
              Expanded(
                child: Image.asset("assets/calendar3.png" ,
                  width: 60, height: 60,), flex: 1,)
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row
            (
            children: <Widget>
            [
              Expanded(child: Text("الساعة", style: style2,), flex: 1,),
              Expanded(child: TextFormField(style: style2, expands: false, keyboardType: TextInputType.number,
                  decoration: InputDecoration(enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.amber),)),), flex: 2,),
              Expanded(
                child: Image.asset("assets/clock.png" ,
                  width: 60, height: 60,), flex: 1,)
            ],
          ),
        ), Padding(
          padding: const EdgeInsets.only(left: 15,right: 15),
          child: Divider(
            color: Colors.amber,
            thickness: 1,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>
          [
          Image.asset("assets/add_alarm.png" ,
           width: 25, height: 25,color: Colors.teal,)],),
        Padding(
          padding: const EdgeInsets.only(bottom: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>
            [
              Expanded(
                child: FlatButton(child: Text('حفظ', style: style2,),
                    onPressed: () {}), flex: 1,),
              Expanded(
                child: FlatButton(
                  padding: EdgeInsets.only(),
                  child: Text('الغاء الأمر', style: style2,),
                  onPressed: () {},
                ), flex:1,),
            ],
          ),
        )
      ],
    );
  }
}
