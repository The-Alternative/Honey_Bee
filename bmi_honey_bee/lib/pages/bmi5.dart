import 'package:bmi_honey_bee/pages/bmi1.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'contact.dart';
import 'db_helper.dart';



class Bmi5 extends StatefulWidget {
  @override
  _Bmi5State createState() => _Bmi5State();
}
class _Bmi5State extends State<Bmi5> {
  Future<List<Contact>> contact;
  TextEditingController controller = TextEditingController();
  String name;
  int curUserId;

  final formKey = new GlobalKey<FormState>();
  var dbHelper;
  bool isUpdating;
  @override
  void initState(){
    super.initState();
    dbHelper = DBHelper();
    isUpdating =false;
}

  refreshList(){
    setState(() {
      contact = dbHelper.getContact();
    });
}

  clearName(){
    controller.text = '';
  }

  validate(){
    if(formKey.currentState.validate()) {
      formKey.currentState.save();
      Navigator.of(context).pushNamed('Bmi1');
    }
  }

  void _onItemTapped(int index) {
    setState(() {
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => Bmi1()));
    });
  }

  @override
  Widget build(BuildContext context) {
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

            body:SingleChildScrollView(
              child: Container(
              height: 400, width: 400,
              decoration: BoxDecoration(image: DecorationImage(
                image: AssetImage("images/body.png",),
                alignment: Alignment.bottomCenter,
              ),
              ),
              child: ListView(
                children: [
                  SizedBox(height: 40,),
                  Center(
                    child: Container(
                      height: 200,
                      width: 300,
                      decoration: BoxDecoration(color: Colors.white, boxShadow: [BoxShadow(color: Colors.grey[400], spreadRadius: .1, blurRadius: 3, offset: Offset(2, 2))],),

                        child: Column(
                          children: [
                            Form(
                                key: formKey,
                                child: Column(
                                    children: [
                                      Container(
                                        width: 250,
                                        padding: EdgeInsets.only(top: 40),
                                        child: TextFormField(
                                    validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter name';
                    }
                    return null;
                  },
                  controller: controller,
                  keyboardType: TextInputType.text,
                  onSaved: (val) => name = val,
                                          decoration: InputDecoration(
                                              contentPadding: EdgeInsets.all(10),
                                              hintText: "أدخل الاسم",
                                              labelStyle: TextStyle(color: Colors.black),
                                              suffixIcon:InkWell(
                                                onTap: (){},
                                                child:FlatButton(minWidth: 10, child: Image(image: AssetImage('images/ic.png'),fit: BoxFit.cover,),),

                                              ),
                                              focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.yellow[700]))
                                          ),
                                          cursorColor: Colors.yellow[700],
                                        ),
                                      ),
                                      Padding(padding: EdgeInsets.only(top: 40)),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          FlatButton(
                                            child: Text("الغاء الأمر"),
                                            onPressed: () {
                                              return Navigator.of(context).pop();
                                            },),
                                          SizedBox(width: 40,),
                                          FlatButton(
                                            child: Text("موافق"),
                                            onPressed: () {
                                              setState(() {
                                                clearName();
                                                validate();
                                                Navigator.of(context).push(MaterialPageRoute(builder: (context) => Bmi1()));
                                              });
                                            },)
                                        ],
                                      )
                                    ]
                                )
                            ),
                            // Text(_calcresult!= null? '$_calcresult':''),
                            // Text(_result!= null? _result: ''),
                          ],
                        ),
                      ),
                    ),
                ],
              ),
            ),),


            bottomNavigationBar: BottomNavigationBar(
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                    icon: Icon(Icons.home_outlined, size: 30, color: Colors.grey,),
                    label: "home"
                ),

              ],
              onTap: _onItemTapped,
            ),

          ),

        )

    );
  }
}