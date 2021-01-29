import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sqflite/sqflite.dart';
import 'package:ssd/models/db_models.dart';
import 'package:ssd/utils/database_helper.dart';

class Time_list extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return Time_listState();
  }
}

class Time_listState extends State<Time_list> {

  var style1 = TextStyle(fontSize: 14, fontWeight: FontWeight.bold, fontFamily: 'Amiri');
  var style2 = TextStyle(fontSize: 14, fontWeight: FontWeight.normal, fontFamily: 'Amiri');
  var style4 = TextStyle(fontSize: 14, fontWeight: FontWeight.normal, fontFamily: 'Amiri', color: Colors.white);
  String _ndate = DateFormat.yMMMd().format(DateTime.now());
  String _clock = DateTime.now().hour.toString() + ":" + DateTime.now().minute.toString();
  DatabaseHelper databaseHelper = DatabaseHelper();
  List<Card_info> cardList;
  List<MedicineDays> daysList;
  bool reff=true;
  int count = 0;
  int count2=0;
  int count3=0;
  Time_listState(){

  }
  bool _loading = false;

  void _onLoading() {
    setState(() {
      _loading = true;
      new Future.delayed(new Duration(seconds: 1), _login);
    });}
  Future _login() async{
    setState((){
      addCardListView();

        print('lengthcard;ist:${cardList.length}');
      cardList.clear();
        _loading = false;
    });
  }
  @override
  Widget build(BuildContext context) {
    if (daysList == null ) {
      daysList= List<MedicineDays>();
      addDaysListView();
    }
    if (cardList == null ) {
      cardList= List<Card_info>();
     addCardListView();
    }
    // if(Timesupdate.res2 ){
    //   addTimesListView();
    //   debugPrint("Timesupdate");
    //   //Time_listState();
    //   Timesupdate.res2=false;
    // }
  //  addTimesListView();
    //updateCardInfo();
    // return Scaffold(
    //   body: getTimesListView(),
    // );
    return build2(context);
  }

  ListView getTimesListView() {
    debugPrint("note");
    return ListView.builder(
        itemCount: count2,shrinkWrap:true,
        itemBuilder: (BuildContext context, int position) {
          return ListView(children: <Widget>[ListView.builder(
      itemCount: count,shrinkWrap:true,physics: ClampingScrollPhysics(),

            itemBuilder: (BuildContext context, int position) {
        return Card(color: Colors.white, elevation: 5.0, shadowColor: Colors.amber,
            child: Column(children: <Widget>[
              Row(children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: 10.0, right: 15),
                  child: Image.asset("images/med.png",
                      width: 40, height: 40, filterQuality: FilterQuality.low),
                ),
                Text("الأدوية ", style: TextStyle(color: Colors.black, fontSize: 15),),
                Padding(
                  padding: const EdgeInsets.only(right: 100.0, left: 15),
                  child: Icon(Icons.alarm, size: 20, color: Colors.amber,),
                ),
                Text(_clock)
              ]),
              Divider(color: Colors.amber, thickness: 2,
              ),
              ListTile(
                leading: CircleAvatar(),
                title: Text(this.cardList[position].medicine,),
                subtitle: Text(this.cardList[position].person_name),
                trailing: Text(""),
                onTap: () {
                  debugPrint("ListTile Tapped");
                  // navigateToDetail(this.noteList[position],'Edit ');
                },
              ),
              Padding(padding: const EdgeInsets.only(right: 75.0), child: Text("1ساعة 35 دقيقة"),),
              Divider(color: Colors.amber, thickness: 1,
              ),
              Row(children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0, right: 75, left: 75),
                  child: MaterialButton(
                      clipBehavior: Clip.hardEdge,
                      animationDuration: Duration(milliseconds: 5),
                      color: Colors.green,
                      padding: EdgeInsets.only(
                          left: 35, right: 35, top: 15, bottom: 0),
                      child: Text("تم", style: TextStyle(color: Colors.white, fontSize: 15),),
                      onPressed: () {
                        getDayName("");
                       // cardList=List<Card_info>();
                     //   print(cardList.length);
                    // if(cardList!=null)
                  // print(cardList.elementAt(0).medicine);


                      }),
                ),
                Divider(thickness: 2, height: 5,),
                IconButton(
                    icon: Icon(Icons.delete, size: 30, color: Colors.blue,), onPressed: () {
                      _delete(context, cardList[position].diagId);
                    }),
              ])
            ]));
      },
    )]); });
  }
  Widget build2(BuildContext context) {
    //if (!loaded) _loadZones();
    var body =new Column(
      children: <Widget>[
        new Padding(padding: EdgeInsets.fromLTRB(0, 1, 0, 0)),
        Row(
          children: <Widget>[

            Expanded(
              flex: 1,
              child: InkWell(
                  child: FlatButton(
                      child:  Icon(Icons.refresh),
                      shape: RoundedRectangleBorder(
                          side: BorderSide(
                              color: Colors.amber)),
                      splashColor: Colors.green,
                      color: Colors.white,
                      onPressed: () {
                        Timesupdate.res=true;
                        Timesupdate.res2=true;
                        updateCardInfo();
                        /* ... */
                      })),
            ),Padding(
              padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
            ),
            Expanded(
              flex: 1,
              child: InkWell(
                child:  Text('الاسم',style: style1),
              ),
            ),

            Expanded(
              flex: 2,
              child: InkWell(
                  child: DropdownButton(isExpanded: true,iconEnabledColor: Colors.amber,)),
            ),
          ],
        ),Divider(color: Colors.amber,),
        new Expanded(
            child: Container(child: getday()))
      ],
    );
    var bodyProgress = new Container(
      child: new Stack(
        children: <Widget>[
          body,
          new Container(
            alignment: AlignmentDirectional.center,
            decoration: new BoxDecoration(
              color: Colors.white70,
            ),
            child: new Container(
              decoration: new BoxDecoration(
                  color: Colors.blue[200],
                  borderRadius: new BorderRadius.circular(10.0)
              ),
              width: 300.0,
              height: 600.0,
              alignment: AlignmentDirectional.center,
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Center(
                    child: new SizedBox(
                      height: 50.0,
                      width: 50.0,
                      child: new CircularProgressIndicator(
                        value: null,
                        strokeWidth: 7.0,
                      ),
                    ),
                  ),
                  new Container(
                    margin: const EdgeInsets.only(top: 25.0),
                    child: new Center(
                      child: new Text(
                        "loading.. wait...",
                        style: new TextStyle(
                            color: Colors.white
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
    return new Scaffold(
        body: _loading ? bodyProgress : body);

  }

  ListView getday(){
    if(count2!=0)
    return ListView.builder(
        shrinkWrap: true, physics: ClampingScrollPhysics(),  //Added
        itemCount: count2,
        itemBuilder: (BuildContext context, int index) {

          MedicineDays day = daysList[index];
          //List<Card_info> places = zone.;
          // print(zone.toString());
          //  print(places.length);
          return InkWell(
              onTap: () {
              },
              child: Card(
                  color: Colors.white,
                  margin: EdgeInsets.fromLTRB(0,0 , 0, 0),
                  child: new InkWell(
                      child: new Column(
                        children: <Widget>[
                          Container(color: Colors.black12,
                            child: ListTile(
                                leading: Text(getDayName(day.dayDate)),
                                title: Row(
                                  children: <Widget>[
                                    Text(
                                      ' ${day.dayDate}',
                                      style: TextStyle(fontSize: 20),
                                    ),
                                  ],
                                )),
                          ),
                          getdaytime(day.dayesId),

                        ],
                      ))));
        });
  }
  ListView getdaytime(int id){

    //addTimesListView();
    List<Card_info>selecttimesList= List<Card_info>();
    for(int i=0;i<cardList.length;i++)
      {
        if(cardList[i].dayesId== id)
          selecttimesList.add(cardList[i]);
      }
   return ListView(physics: ClampingScrollPhysics(),
       shrinkWrap: true, children:<Widget> [
     ListView.builder(   //removed Flexible
        shrinkWrap: true,physics: ClampingScrollPhysics(), //Added
        itemCount: selecttimesList.length,
        itemBuilder: (BuildContext ct, int ii) {
         return
           Card(color: Colors.white, elevation: 5.0, shadowColor: Colors.amber,
             child: Column(children: <Widget>[
               Container(color: Colors.amber,
                 child: Row(children: <Widget>[
                   Padding(
                     padding: EdgeInsets.only(left: 15.0, right: 15,top: 5,bottom: 5), child:Image.asset("images/med.png" ,
                         width: 40, height: 40),
                   ) ,
                   Text("الأدوية ", style: style1),
                   Padding(
                     padding: const EdgeInsets.only(right: 100.0, left: 15),
                     child: Icon(Icons.alarm, size: 20, color: Colors.amber,),
                   ),
                   Text('${selecttimesList[ii].day_time}')
                 ]),
               ),

               ListTile(
                 leading: CircleAvatar(),
                 title: Text( '${selecttimesList[ii].medicine}',),
                 subtitle: Text('${selecttimesList[ii].person_name}'),
                 trailing: Text(""),
                 onTap: () {
                   debugPrint("ListTile Tapped");
                   // navigateToDetail(this.noteList[position],'Edit ');
                 },
               ),
               Padding(padding: const EdgeInsets.only(right: 75.0), child: Text("1ساعة 35 دقيقة"),),
               Divider(color: Colors.amber, thickness: 1,
               ),
               Row(children: <Widget>[
                 Padding(
                   padding: const EdgeInsets.only(bottom: 16.0, right: 75, left: 75),
                   child: FlatButton(
                       child: const Text('تم',style: TextStyle(color:Colors.white ,fontSize: 20),),
                       shape: RoundedRectangleBorder(
                           side: BorderSide(
                               color: Colors.teal)),
                       splashColor: Colors.white10,
                       color: Colors.green,
                       onPressed: () {
                         getDayName(daysList.elementAt(0).dayDate);
                         /* ... */
                       })
                 ),
                 Divider(thickness: 2, height: 5,),
                 IconButton(
                     icon: Icon(Icons.delete, size: 30, color: Colors.blue,), onPressed: () {
                  // _delete(context, cardList[position].diagId);
                 }),
               ])
             ]));
        })]);
    // return Text(
    //   "● ${selecttimesList[i].dayTime}",
    //   textAlign: TextAlign.start,
    // );
  }
  String  getDayName(String s)
  {
    var arr = List(3);
  arr = s.split('/');
  int _day = int.parse(arr[2]);
   int _month = int.parse(arr[1]);
   int _year = int.parse(arr[0]);
    var dforma =DateTime(_year,_month,_day);
    var now = DateTime.now();
    var dna =DateFormat.EEEE().format(dforma);
    return '$dna';
  }
  addCardListView(){
    //final Future<Database> dbFuture = databaseHelper.initializeDatabase();
    Future<List<Card_info>> cardListFuture = databaseHelper.getAllIds();
    cardListFuture.then((cardList) {
      setState(() {
        debugPrint("list has change");
        this.cardList = cardList;
        this.count = cardList.length;
         print(cardList.length);

      });
  });
  }
  addDaysListView(){
    final Future<Database> dbFuture = databaseHelper.initializeDatabase();
    Future<List<MedicineDays>>daysFuture = databaseHelper.getmidDayesList();
    daysFuture.then((DaysList) {
      setState(() {
        debugPrint("list has change");
        this.daysList = DaysList;
        this.count2 = DaysList.length;
        print(DaysList.elementAt(0).dayDate);

      });
    });
    int a= daysList.length;
    print('lengthday:$a');
  }
  // addTimesListView(){
  // //  final Future<Database> dbFuture = databaseHelper.initializeDatabase();
  //   Future<List<MedicineTimes>>timesFuture = databaseHelper.getDayTimesList();
  //   timesFuture.then((timesList) {
  //     setState(() {
  //       debugPrint("list has change");
  //       this.timesList = timesList;
  //       this.count3 = timesList.length;
  //    //    for(int i=0;i<timesList.length;i++)
  //    //      {
  //    //        int ii=timesList.elementAt(i).dayesId;
  //    // //  print('$ii'+"  "+timesList.elementAt(i).dayTime);
  //    //      }
  //
  //     });
  //   });
  // }
  void updateCardInfo() async {
    if (Timesupdate.res)
    {
      print("add");
      addDaysListView();
      //addCardListView();
      //addTimesListView();
      _onLoading();
      Timesupdate.res = false;

    }

  }

  void _delete(BuildContext context, int id) async {
    int result = await databaseHelper.deleteDiagon(id);
    if (result != 0) {
      _showSnackBar(context, ' Deleted Successfully');
      addCardListView();
    }
  }

  void _showSnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(content: Text(message));
    Scaffold.of(context).showSnackBar(snackBar);
  }
}

class Timesupdate {
  static bool res = false;
  static bool res2 = false;
 static List<MedicineTimes>timesList;

}
