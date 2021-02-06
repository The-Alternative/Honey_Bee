class Descriptors {
  int id;
  String height;
  String weight;
  String bmi;
  String date;

  Descriptors(this.height, this.weight, this.bmi, this.date);

  Descriptors.map(dynamic obj){
    this.height = obj['height'];
    this.weight = obj['weight'];
    this.bmi = obj['bmi'];
    this.date = obj['date'];
    this.id = obj['id'];

  }


  int get _id => id;
String get _height => height;
String get _weight => weight;
String get _bmi => bmi;
String get _date => date;


  Map<String,dynamic> toMap(){
    var map = new Map<String ,dynamic> ();
    map["id"] = _id;
    map["height"] = _height;
    map["weight"] = _weight;
    map["bmi"] = _bmi;
    map["date"] = _date;
    if(id != null){
      map['id'] = _id;
    }
    return map;
  }
  Descriptors.fromeMap(Map<String,dynamic>map){
    this.height = map['height'];
    this.weight = map['weight'];
    this.bmi = map['bmi'];
    this.date = map['date'];
    this.id = map['id'];
  }

}