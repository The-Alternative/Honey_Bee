
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class MedicineDatabase{
  String medicinTable = 'med_table';
  String medicinView = 'med_view';
  String medId = 'id'; //primry/forign..key
  String medTitle = 'title';
  String medform = 'form';
  //////////////////////////////////////////////////
  String diagonTable = 'diagon_table';
  String diagid = 'd_id'; //primry/forign..key
  String doctname = 'd_name';
  String medAmount = 'amount';
  String instruction = 'description';
  String diagon = 'diagon';
  String img_direct = 'img_direct';
  String times = 'times';
  String dayes = 'dayes';
  String first_date = 'fdate';
  String last_date = 'ldate';
  String first_clock = 'fclock';
  String notice = 'notic';
  //////////////////////////////////////////////////
  String patientTable = 'patent_table';
  String patname = 'p_name';
  String patId = 'p_id'; //primry/forign..key
  //////////////////////////////////////////////////
  String midDayesTable = 'mDayes_table';
  String dayesId = 'day_id';
  String day_date = 'd_date';
  String sortNum = 'sortn';

  /////////////////////////////////////////////////////////
  String dayTimesTable = 'mTimes_table';
  String timesId = 'tid';
  String day_time = 'd_time';
  String day_time_state = 'd_t_state';
  setDatabase() async{
    String databasePath = await getDatabasesPath();
    String path = join(databasePath,"medicine_db");
    Database database = await openDatabase(path,version: 1,onCreate: (Database db,int version)async{
      await db.execute(
          'CREATE TABLE '
              '$medicinTable($medId INTEGER PRIMARY KEY AUTOINCREMENT, '
              '$medTitle TEXT UNIQUE, '
              '$medform TEXT)');
      await db.execute(
          'CREATE TABLE'
              ' $patientTable($patId INTEGER PRIMARY KEY AUTOINCREMENT,'
              ' $patname TEXT UNIQUE)');
      await db.execute(
          'CREATE TABLE $diagonTable($diagid INTEGER PRIMARY KEY AUTOINCREMENT,'
              '$doctname TEXT, $medAmount INTEGER, $diagon TEXT,$instruction TEXT,$first_date TEXT,$first_clock TEXT,'
              '$dayes TEXT,$times TEXT,$img_direct TEXT,$notice TEXT'
              ',$medId INTEGER FORIGN KEY REFERENCES $medicinTable($medId),'
              '$patId INTEGER FORIGN KEY REFERENCES $patientTable($patId))');
      await db.execute(
          'CREATE TABLE'
              ' $midDayesTable($dayesId INTEGER PRIMARY KEY AUTOINCREMENT,'
              '$day_date TEXT UNIQUE,'
              '$sortNum int)');
      await db.execute(
          'CREATE TABLE'
              ' $dayTimesTable($timesId INTEGER PRIMARY KEY AUTOINCREMENT, $day_time TEXT,'
              '$day_time_state int,'
              '$dayesId INTEGER FORIGN KEY REFERENCES $midDayesTable($dayesId),'
              '$diagid INTEGER FORIGN KEY REFERENCES $diagonTable($diagid) )');

      await db.execute(
          'CREATE TABLE'
              ' $medicinView($medId INTEGER PRIMARY KEY AUTOINCREMENT, '
              '$medTitle TEXT UNIQUE, '
              '$medform TEXT,'
              '$diagid INTEGER,'
              '$patname TEXT,'
              '$img_direct TEXT'
              ',$first_date TEXT,'
              '$first_clock TEXT,'
              '$doctname TEXT,'
              '$patId INTEGER,'
              '$diagon TEXT,'
              '$notice TEXT,'
              '$medAmount TEXT,'
              '$last_date TEXT)');
    });
    return database;
  }

}