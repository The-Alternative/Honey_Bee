class Course {
  int _id;
  String _namecourse;
  String _nameteachar;
  String _email;
  int _teacharnumber;

  Course(dynamic obj) {
    _id = obj['id'];
    _namecourse = obj['namecourse'];
    _nameteachar = obj['nameteachar'];
    _email = obj['email'];
    _teacharnumber = obj['teacharnumber'];
  }

  Course.fromMap(Map<String, dynamic> data) {
    _id = data['id'];
    _namecourse = data['namecourse'];
    _nameteachar = data['nameteachar'];
    _email = data['email'];
    _teacharnumber = data['teacharnumber'];
  }

  Map<String, dynamic> toMap() => {
        'id': _id,
        'namecourse': _namecourse,
        'nameteachar': _nameteachar,
        'email': _email,
        'teacharnumber': _teacharnumber
      };

  int get id => _id;
  String get namecourse => _namecourse;
  String get nameteachar => _nameteachar;
  String get email => _email;
  int get teacharnumber => _teacharnumber;
}
