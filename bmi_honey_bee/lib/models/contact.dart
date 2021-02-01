class Contact {
  int id;
  String name;
  String savedate;
  String height;

  Contact(this.name,this.savedate,this.height);


  Contact.withId(this.id, this.name, this.savedate,
      this.height);
  // Contact.map(dynamic con){
  //   this.id = con['id'];
  //   this.name = con['name'];
  //   this.savedate =con['savedate'];
  // }

  int get _id => id;
  String get _name => name;
  String get _savedate => savedate;
  String get _height => height;


Map<String,dynamic> toMap(){
  var map = Map<String ,dynamic> ();
  map["id"] = this.id;
  map["name"] = this.name;
  map["savedate"] = this.savedate;
  map["height"] = this.height;
}
Contact.getMap(Map<String , dynamic> map){
  this.id =  map["id"];
  this.name= map["name"] ;
  this.savedate = map["savedate"];
  this.height = map["height"];
}

  // Map<String , dynamic> toMap(){
  //   var map =new Map<String,dynamic>();
  //   map['name'] = _name;
  //   if(id != null){
  //     map['id'] = _id;
  //   }
  //   return map;
  // }
  //
  // Contact.fromeMap(Map<String,dynamic>map){
  //   this.id = map['id'];
  //   this.name = map['name'];
  //   this.savedate = map['savedate'];
  // }
}