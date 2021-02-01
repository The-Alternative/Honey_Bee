
import 'dart:async';

class Descriptors{
  int height;
  int weight;
  double best;
  Descriptors(this.height,this.weight,this.best);
  Map<String,dynamic> toMap(){
    var map = <String, dynamic>{
      'height':height,
      'weight':weight,
      'best':best,
    };
    return map;
  }
  Descriptors.fromMap( Map <String, dynamic> map){
    height = map['height'];
    weight = map['weight'];
    best = map['best'];
  }
}
