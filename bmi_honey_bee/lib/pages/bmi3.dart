
import 'dart:ui';
import 'package:bmi_honey_bee/pages/bmi1.dart';
import 'package:bmi_honey_bee/pages/db_helper.dart';
import 'package:flutter/material.dart';
import 'package:bmi_honey_bee/size_config.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:bmi_honey_bee/pages/contact.dart';


class Bmi3 extends StatefulWidget {
  final String title;
  Bmi3({Key key,this.title}): super(key: key);
  @override
  State<StatefulWidget> createState(){
    return _Bmi3State();
  }
}

class _Bmi3State extends State<Bmi3> {

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
  form(){
    return SingleChildScrollView(
      child: Container(
        child:
        Column(
            children: [
              Container(
                width: 300,
                margin: EdgeInsets.only(top: 20),
                child: Form(
                  key: formKey,
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
                        labelText: "الاسم",
                        labelStyle: TextStyle(color: Colors.black),
                        suffixIcon:InkWell(
                          onTap: (){},
                          child:FlatButton(minWidth: 10, child: Image(image: AssetImage('images/ic.png'),fit: BoxFit.cover,),),

                          // ),
                        ),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.yellow[700])
                        )
                    ),
                    cursorColor: Colors.yellow[700],
                  ),
                ),
              ),



              SizedBox(height: 60,),


              Container(
                height: 250,
                child: Center(
                    child: Image(image: AssetImage("images/body.png",),
                      alignment: Alignment.center,
                    )
                ),
              ),
            ]
        ),
      ),);
  }

  clearName(){
    controller.text = '';
  }

  validate(){
    if(formKey.currentState.validate()) {
      formKey.currentState.save();
      Navigator.of(context).pushNamed('Bmi4');
    }
  }


  void _onItemTapped(int index) {
    setState(() {
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => Bmi1()));
    });
  }
  @override



  Widget build(BuildContext context) {
    final screenHeight =MediaQuery.of(context);
    final screenWidth = MediaQuery.of(context);

    return LayoutBuilder(builder: (context , constraints) {
      return OrientationBuilder(builder: (context, orientation) {
        SizeConfig().init(constraints, orientation);

        return MaterialApp(
          debugShowCheckedModeBanner: false,
          builder: DevicePreview.appBuilder,
          home:Directionality(textDirection: TextDirection.rtl,
            child: Scaffold(
              appBar: AppBar(
                toolbarHeight: 60,
                backgroundColor: Colors.yellow[700],
                title: Row(
                  children: [
                    Image.asset("images/group.png",),
                    SizedBox(width: 10,),
                    Text('BMI' ,style: TextStyle(
                      color: Colors.black,
                      fontSize: 20 ,
                    ),
                    ),
                  ],
                ),
              ),

              body: form(),

              floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
              floatingActionButton:SingleChildScrollView(
                child: Container(
                  height: screenWidth.size.height/7,
                  width: screenWidth.size.width/7,
                  margin: EdgeInsets.only(left: 20),
                  child: Column(
                    children: [
                      FloatingActionButton(
                        child: Icon(Icons.add,size: 50,),
                        backgroundColor: Colors.green,
                        onPressed: () {
                          validate();
                          clearName();
                        },
                      ),
                      SizedBox(height: 5,),
                      Text("إضافة")
                    ],
                  ),

                ),
              ),
              bottomNavigationBar: BottomNavigationBar(
                items:  <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                      icon: Center(child: Image(image: AssetImage('images/hom.png'),)),
                      label: "home"
                  ),
                ],
                onTap: _onItemTapped,
              ),


            ),

          ),

        );
      }
      );
    }
    );

  }
}

