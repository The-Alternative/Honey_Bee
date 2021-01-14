
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Bmi4 extends StatefulWidget {
  @override
  _Bmi4State createState() => _Bmi4State();
}

class _Bmi4State extends State<Bmi4> {
  @override
  Widget build(BuildContext context) {
    return
      MaterialApp(
        debugShowCheckedModeBanner: false,
        home:
        Directionality(textDirection: TextDirection.rtl,child:
        Scaffold(
          appBar: AppBar(
            toolbarHeight: 60,
            backgroundColor: Colors.yellow[700],
            title: Row(
              children: [
                Image.asset("images/group.png",),
                SizedBox(width: 10,),
                Expanded(child:  Text('BMI' ,style: TextStyle(color: Colors.black,),),),
              ],
            ),
          ),
          body:SingleChildScrollView(child:
          Container(
           
            decoration: BoxDecoration(image: DecorationImage(image: AssetImage("images/body.png"))),

                 child: ListView(
                   children: [
                     Container(
                       margin: EdgeInsets.only(top: 20),
                       child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                         children: [
                           Image(image: AssetImage("images/group.png"),),
                           Text("ff")
                         ],
                       ),
                     ),
                  Container(
                     margin: EdgeInsets.only(top: 30,left: 11,right: 11),
                    height: 200,width: 300,

                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow:[ BoxShadow(color: Colors.grey[400],spreadRadius: .1,blurRadius: 3,)],),

                    child: Container(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.only(top:30,left: 15,right: 11),
                      child: Column(
                          children: [
                            Form(
                                child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                         crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Padding(padding: EdgeInsets.all(20)),
                                          Expanded(flex:2,child: Text("الوزن",style: TextStyle(fontSize: 15),)),
                                          SizedBox(width: 30,),
                                          Expanded(flex:2,child: Text("الطول",style: TextStyle(fontSize: 15),)),
                                          SizedBox(width: 30,),
                                          Expanded(flex:2,child: Text("BMI",style: TextStyle(fontSize: 15),)),
                                        ],
                                      ),
                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Padding(padding: EdgeInsets.all(5)),
                                          Expanded(flex:1,child:TextFormField(
                                            readOnly: true,
                                          )),
                                          Expanded(flex:1,child: TextFormField(
                                            readOnly: true,),),
                                          Expanded(flex:1,child: TextFormField(
                                            readOnly: true,)),
                                        ],
                                      ),
                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Padding(padding: EdgeInsets.all(5)),
                                          Expanded(flex:1,child:Text("")),
                                         IconButton(icon: (Icon(FontAwesomeIcons.solidTrashAlt,color: Colors.blue,)), onPressed: (){}),
                                        ],
                                      ),
                                    ]
                                )
                            ),

                          ]

                      ),

                    ),
            ),]
                 ),
               ),),

          floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,

          floatingActionButton: SingleChildScrollView(child:
          FloatingActionButton(

            child: Icon(Icons.add,size: 40,),
            onPressed: (){
              Navigator.of(context).pushNamed('Bmi5');
            },
            backgroundColor: Colors.green,
            tooltip: "add",
          ),
        ),
        ),)

    );
  }
}
