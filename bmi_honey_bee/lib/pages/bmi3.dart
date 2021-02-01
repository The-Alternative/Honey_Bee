import 'package:flutter/material.dart';
import 'dart:async';
import 'package:bmi_honey_bee/utils/DatabaseConf.dart';
import 'package:bmi_honey_bee/models/contact.dart';
import 'package:sqflite/sqflite.dart';

import 'contact_detail.dart';


class Bmi3 extends StatefulWidget {
  @override
  _Bmi3State createState() => _Bmi3State();
}

class _Bmi3State extends State<Bmi3> {
  // DatabaseConfig config = new DatabaseConfig();
  List<Contact> contactlist;

  int count = 0;

  @override
  Widget build(BuildContext context) {

    if (contactlist == null){
      contactlist = new List<Contact>();
      //upDateListView();
    }

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
          body: getContactList(),
          floatingActionButton: FloatingActionButton(
            onPressed: (){
              NavigatToContact(Contact('','',''),);
              // Navigator.push(context, MaterialPageRoute(builder: (context) {
              //   return ContactDetail();
              // })
              // );

            },
            child: Icon(Icons.add),
            backgroundColor: Colors.yellow[700],
          ),
        ),),);
  }

  ListView getContactList() {
    return ListView.builder(
        itemCount: count,
        itemBuilder: (BuildContext context, int position) {
          return Card(
            child: ListTile(
              leading: Icon(Icons.check),
              title: Text(this.contactlist[position].name),
              subtitle: Text(this.contactlist[position].savedate),
              trailing: GestureDetector(child:
              Icon(Icons.delete),
                onTap: () {
                  //  _delete(context, this.contactlist[position]);
                },
              ),
              onTap: (){
                NavigatToContact(this.contactlist[position]);
              },
            ),
          );
        });
  }

  void NavigatToContact(Contact contact) async {
   bool result = await Navigator.push(context, MaterialPageRoute(builder: (context){
      return ContactDetail(contact);
    }));
   if(result){
    // upDateListView();
   }
  }
//   void _delete (BuildContext context,Contact contact) async{
//      int result = await config.deleteContact(contact.id);
//       if(result != 0){
//        showSenckBar(context,"Name has been deleted");
//
//      }
// // }
//   void showSenckBar(BuildContext context, String msg){
//     final _SnackBar = SnackBar(content: Text(msg));
//     Scaffold.of(context).showSnackBar(_SnackBar);
//   }
//   void upDateListView() {
//   final Future<Database> db = config.intDb();
//   db.then((database){
//     Future<List<Contact>> contacts = config.getContactList();
//     contacts.then((theList){
//       this.contactlist = theList;
//       this.count = theList.length;
//     });
//   });
// }
}

//
// import 'package:bmi_honey_bee/pages/bmi1.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// // import '../models/contact.dart';
// import 'package:sqflite/sqflite.dart';
// import 'package:bmi_honey_bee/utils/DatabaseConf.dart';
// import 'package:bmi_honey_bee/models/contact.dart';
// import 'dart:async';
//
//
//
// class Bmi3 extends StatefulWidget {
//   String screen;
//   Contact contact;
//   Bmi3({this.screen , this.contact});
//
//
//   @override
//   State<StatefulWidget> createState(){
//
//     return _Bmi3State(contact:contact,screen: screen);
//   }
// }
//
// class _Bmi3State extends State<Bmi3> {
//
//   String screen;
//   Contact contact;
//   _Bmi3State({this.screen , this.contact});
//
//  // DatabaseConfig config = new DatabaseConfig();
//   List<Contact> contactlist;
//  TextEditingController controllername = new TextEditingController();
//
//   @override
//   void initState(){
//     super.initState();
//   }
//
//   // refreshList(){
//   //   setState(() {
//   //     contact = dbHelper.getContact();
//   //   });
//   // }
//
//   // clearName(){
//   //   controller.text = '';
//   // }
//
//   // validate(){
//   //   if(formKey.currentState.validate()) {
//   //     formKey.currentState.save();
//   //     Navigator.of(context).pushNamed('Bmi1');
//   //   }
//   // }
//
//   void _onItemTapped(int index) {
//     setState(() {
//      // Navigator.of(context).push(MaterialPageRoute(builder: (context) => Bmi1()));
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     //controllername.text= contact.name;
//
//     return MaterialApp(
//         debugShowCheckedModeBanner: false,
//         home: Directionality(textDirection: TextDirection.rtl,
//           child: Scaffold(
//             appBar: AppBar(toolbarHeight: 60, backgroundColor: Colors.yellow[700],
//               title: Row(
//                 children: [
//                   Image.asset("images/group.png",),
//                   SizedBox(width: 10,),
//                   Text('BMI', style: TextStyle(
//                     color: Colors.black,
//                     fontSize: 20,
//                   ),
//                   ),
//                 ],
//               ),
//             ),
//
//             body:SingleChildScrollView(
//               child: Container(
//                 height: 400, width: 400,
//                 decoration: BoxDecoration(image: DecorationImage(
//                   image: AssetImage("images/body.png",),
//                   alignment: Alignment.bottomCenter,
//                 ),
//                 ),
//                 child: ListView(
//                   children: [
//                     SizedBox(height: 40,),
//                     Center(
//                       child: Container(
//                         height: 200,
//                         width: 300,
//                         decoration: BoxDecoration(
//                           color: Colors.white,
//                           boxShadow: [BoxShadow(color: Colors.grey[400], spreadRadius: .1, blurRadius: 3, offset: Offset(2, 2))],
//                         ),
//
//                         child: Column(
//                           children: [
//                             Form(
//                                 //key: formKey,
//                                 child: Column(
//                                     children: [
//                                       Container(
//                                         width: 200,
//                                         height: 40,
//                                         decoration: BoxDecoration(
//                                           border: Border.all(width: 1,color: Colors.orange[100]),
//                                           boxShadow:[BoxShadow(color: Colors.grey[400],spreadRadius: .1,blurRadius: 1,
//                                           )],
//                                           color: Colors.white,
//                                         ),
//
//                                         margin: EdgeInsets.only(top: 40),
//                                         child: TextFormField(
//                                           controller: controllername,
//                                           onChanged: (value){
//                                             contact.name =value;
//                                           },
//                                           //
//                                           // validator: (value) {
//                                           //   if (value.isEmpty) {
//                                           //     return 'Please enter name';
//                                           //   }
//                                           //   return null;
//                                           // },
//                                         // controller: nameController,
//                                           keyboardType: TextInputType.text,
//                                           decoration: InputDecoration(
//                                               contentPadding: EdgeInsets.all(10),
//                                               hintText: "أدخل الاسم",
//                                               hintStyle: TextStyle(color: Colors.grey[500]),
//
//                                              focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.yellow[700])),
//                                             enabledBorder: UnderlineInputBorder(
//                                               borderSide: BorderSide(
//                                                   color: Colors.yellow[700]),
//                                             ),
//                                           ),
//
//                                           cursorColor: Colors.yellow[700],
//                                         ),
//                                       ),
//                                       Padding(padding: EdgeInsets.only(top: 40)),
//                                       Row(
//                                         mainAxisAlignment: MainAxisAlignment.center,
//                                         children: [
//                                           FlatButton(
//                                             child: Text("الغاء الأمر"),
//                                             onPressed: () {
//                                               return Navigator.of(context).pop();
//                                             },),
//                                           SizedBox(width: 40,),
//                                            FlatButton(
//                                             child:
//                                             Text('حفظ',style: new TextStyle(fontSize: 15,color: Colors.black)),
//
//                                             onPressed: () {
//                                              // save();
//                                               Navigator.of(context).push(MaterialPageRoute(builder: (context) => Bmi1()));
//                                             }
//                                           )
//                                         ],
//                                       )
//                                     ]
//                                 )
//                             ),
//
//                           ],
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),),
//
//
//             bottomNavigationBar: BottomNavigationBar(
//               items: const <BottomNavigationBarItem>[
//                 BottomNavigationBarItem(
//                     icon: Center(
//                         child: Image(image: AssetImage('images/hom.png'),)),
//                     label: "home"
//                 ),
//
//               ],
//                onTap: _onItemTapped,
//             ),
//
//           ),
//
//         )
//
//     );
//
//   }
// }
// // void save() async{
// //   int result;
// //   if (!= null){
// //
// //   }
// //
// // }
// // void showAlertDialog(String title, String msg){
// // AlertDialog alertDialog = AlertDialog(
// //   title: Text(title),
// //   content: Text(msg),
// // );
// // showDialog(context: context, builder: (_) => alertDialog);
// // }
