

import 'package:flutter/material.dart';
import 'dart:async';
import 'package:bmi_honey_bee/utils/DatabaseConf.dart';
import 'package:bmi_honey_bee/models/contact.dart';
import 'package:sqflite/sqflite.dart';
import 'package:bmi_honey_bee/pages/bmi3.dart';

class ContactDetail extends StatefulWidget {
  Contact contact;
  ContactDetail(Contact contact);


  @override
  _ContactDetailState createState() => _ContactDetailState();
}

class _ContactDetailState extends State<ContactDetail> {

  Contact contact;
  _ContactDetailState({this.contact});
 // final DatabaseConfig db = new DatabaseConfig();

  TextEditingController name =TextEditingController();

  @override
  Widget build(BuildContext context) {

    // name.text = contact.name;

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Directionality(textDirection: TextDirection.rtl,
        child: Scaffold(
        appBar: AppBar(toolbarHeight: 60, backgroundColor: Colors.yellow[700],
        title: Row(
        children: [
        Image.asset("images/group.png",),
              SizedBox(width: 10,),
             Text('BMI', style: TextStyle(
    color: Colors.black,
    fontSize: 20,
    ),
    ),
    ],
    ),
    ),
          body: Padding(
            padding: EdgeInsets.only(top: 15.0,left: 10.0,right: 10.0),
          child: ListView(
            children: [
          TextFormField(
             controller: name,
            onChanged: (value){
              contact.name = value;

            },
            decoration: InputDecoration(
              labelText: "Name",
              border: OutlineInputBorder(
                borderSide: BorderSide(width: 1),
              )
            ),
          ),
              Padding(
                  padding: EdgeInsets.only(top: 15.0,bottom: 15.0),
              child: Row(
                children: [
                  Expanded(
                      child: RaisedButton(
                        color: Colors.blue[900],
                        textColor: Colors.white,
                        child: Text("حفظ"),
                        onPressed: (){
                          setState(() {
                           Save();

                          });
                        },
                      )
                  ),
                  SizedBox(width: 5,),
                  Expanded(
                      child: RaisedButton(
                        color: Colors.blue[900],
                        textColor: Colors.white,
                        child: Text("جذف"),
                        onPressed: (){
                          setState(() {
                            //delete();

                          });
                        },
                      )
                  )
                ],
              ),
              )
            ],
          ),
          ),

    ),),);
  }
  void Save() async{
  //  contact.savedate = DateFormat.yMMMd().format(DateTime.now());
    int result;
    if(contact.id != null){
      result = await DatabaseConfig().insertContact(contact);
    }else{
      result = await DatabaseConfig().upDateContact(contact);
    }

    if(result == 0){
      showAlertDialog('sorry','contact not saved');
    }
    showAlertDialog('successfully','contact has been saved successfully');
  }
  void showAlertDialog(String title, String msg){
    AlertDialog alertDialog =AlertDialog(
      title: Text(title),
      content: Text(msg),
    );
    showDialog(context: context,builder: (_) => alertDialog);
  }
  void delete() async{
    goBack();
    if(contact.id == null){
      showAlertDialog('ok Deleted', "no contact was deleted");
      return;
    }
    int result = await DatabaseConfig().deleteContact(contact.id);
    if(result == 0){
      showAlertDialog('ok Deleted', "no contact was deleted");
    }else{
      showAlertDialog('ok Deleted', "contact has been deleted");
    }
  }

  void goBack(){
    Navigator.pop(context, true);
  }
}
