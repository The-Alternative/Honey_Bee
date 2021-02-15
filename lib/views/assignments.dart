import 'package:flutter/material.dart';

class Assignments extends StatefulWidget {
  @override
  _AssignmentsState createState() => _AssignmentsState();
}

class _AssignmentsState extends State<Assignments> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            leadingWidth: 60,
            toolbarHeight: 65,
            title: Row(
              textDirection: TextDirection.rtl,
              children: [
                Image.asset(
                  "images/logo.png",
                  height: 52,
                  width: 52,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'الدراسة',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                ),
                SizedBox(),
              ],
            ),
            backgroundColor: Colors.amber[400],
          ),
          body: Padding(
            padding: EdgeInsets.all(50),
            child: Center(
              child: ListView(
                children: [
                  Row(
                    children: [
                      ClipOval(
                        child: Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                            border:
                                Border.all(color: Colors.amber[400], width: 2),
                            borderRadius:
                                BorderRadius.all(Radius.circular(100)),
                            image: DecorationImage(
                              image: AssetImage("images/homework.png"),
                              scale: 4.0,
                            ),
                          ),
                          child: FlatButton(
                            child: null,
                            onPressed: () {},
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 60,
                      ),
                      ClipOval(
                        child: Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                            border:
                                Border.all(color: Colors.amber[400], width: 2),
                            borderRadius:
                                BorderRadius.all(Radius.circular(100)),
                            image: DecorationImage(
                              image: AssetImage("images/presentation.png"),
                              scale: 4.0,
                            ),
                          ),
                          child: FlatButton(
                            child: null,
                            onPressed: () {},
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 15,
                      ),
                      Text('برنامج دراسي'),
                      SizedBox(
                        width: 75,
                      ),
                      Text('مواعيد المحاضرات'),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      ClipOval(
                        child: Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                            border:
                                Border.all(color: Colors.amber[400], width: 2),
                            borderRadius:
                                BorderRadius.all(Radius.circular(100)),
                            image: DecorationImage(
                              image: AssetImage("images/surface1.png"),
                              scale: 4.0,
                            ),
                          ),
                          child: FlatButton(
                            child: null,
                            onPressed: () {},
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 60,
                      ),
                      ClipOval(
                        child: Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                            border:
                                Border.all(color: Colors.amber[400], width: 2),
                            borderRadius:
                                BorderRadius.all(Radius.circular(100)),
                            image: DecorationImage(
                              image: AssetImage("images/exam.png"),
                              scale: 2.75,
                            ),
                          ),
                          child: FlatButton(
                            child: null,
                            onPressed: () {},
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 30,
                      ),
                      Text('وظائف'),
                      SizedBox(
                        width: 130,
                      ),
                      Text('امتحان'),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}