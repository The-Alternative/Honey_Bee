class Habit {
  String name;
  int isActive;
  int typeId;
  int createdDate;
  int id;

  Habit(this.name, this.isActive, this.typeId, this.createdDate);

  Habit.map(dynamic obj){
    this.name = obj['name'];
    this.isActive = obj['isActive'];
    this.typeId = obj['typeId'];
    this.createdDate = obj['createdDate'];
    this.id = obj['id'];

  }

  String get _name => name;
  int get _isActive => isActive;
  int get _typeId => typeId;
  int get _createdDate => createdDate;
  int get _id => id;

  Map<String , dynamic> toMap(){
    var map =new Map<String,dynamic>();
    map['name'] = _name;
    map['isActive'] = _isActive;
    map['typeId'] = _typeId;
    map['createdDate'] = _createdDate;
    if(id != null){
      map['id'] = _id;
    }
    return map;
  }

  Habit.fromeMap(Map<String,dynamic>map){
    this.name = map['name'];
    this.isActive = map['isActive'];
    this.typeId = map['typeId'];
    this.createdDate = map['createdDate'];
    this.id = map['id'];
  }
}