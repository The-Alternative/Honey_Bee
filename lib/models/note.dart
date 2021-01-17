class Medicine {
  int _medId;
  String _medTitle;
  String _medform;
  Medicine();
  Medicine.WithId(this._medTitle, this._medform, [this._medId]);

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    if (_medId != null) {
      map['id'] = _medId;
    }
    map['title'] = _medTitle;
    map['form'] = _medform;

    return map;
  }

  // Extract a Patint object from a Map object
  Medicine.fromMapObject(Map<String, dynamic> map) {
    this._medId = map['id'];
    this._medTitle = map['title'];
    this._medform = map['form'];
  }
  int get medId => _medId;
  set medId(int value) {
    _medId = value;
  }

  String get medTitle => _medTitle;

  set medTitle(String value) {
    _medTitle = value;
  }

  String get medform => _medform;

  set medform(String value) {
    _medform = value;
  }
}

class Patient {
  int _patId;
  String _patName;

  Patient();
  Patient.withId(this._patName, [this._patId]);

  String get patName => _patName;

  set patName(String value) {
    _patName = value;
  }

  int get patId => _patId;

  set patId(int value) {
    _patId = value;
  }

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    if (_patId != null) {
      map['p_id'] = _patId;
    }
    map['p_name'] = _patName;

    return map;
  }

  // Extract a Patint object from a Map object
  Patient.fromMapObject(Map<String, dynamic> map) {
    this._patId = map['p_id'];
    this._patName = map['p_name'];
  }
}

class Diagon {
  int _diagonId;
  int _patId;
  String _doctName;
  String _medAmount;
  String _diagon;
  String _instruction;
  String _dayes;
  String _firstDate;
  String _firstClock;
  String _times;
  String _img_direct;
  String _notice;
  String get notice => _notice;

  set notice(String value) {
    _notice = value;
  }

  int _medId;
  String get firstDate => _firstDate;

  set firstDate(String value) {
    _firstDate = value;
  }

  Diagon.withId(
      this._patId,
      this._doctName,
      this._medAmount,
      this._diagon,
      this._instruction,
      this._firstDate,
      this._firstClock,
      this._dayes,
      this._times,
      this._img_direct,
      this._medId,
      this._notice,
      [this._diagonId]);
  Diagon();
  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    if (_diagonId != null) {
      map['diagonId'] = _diagonId;
    }
    map['d_id'] = _diagonId;
    map['p_id'] = _patId;
    map['d_name'] = _doctName;
    map['amount'] = _medAmount;
    map['diagon'] = _diagon;
    map['description'] = _instruction;
    map["fdate"] = _firstDate;
    map["fclock"] = _firstClock;
    map['dayes'] = _dayes;
    map['times'] = _times;
    map['img_direct'] = _img_direct;
    map['notice'] = _notice;
    map['id'] = _medId;
    return map;
  }

  // Extract a Diagon object from a Map object
  Diagon.fromMapObject(Map<String, dynamic> map) {
    this._diagonId = map['d_id'];
    this._patId = map['p_id'];
    this._doctName = map['d_name'];
    this._medAmount = map['amount'];
    this._diagon = map['diagon'];
    this._instruction = map['description'];
    this._firstDate = map['fdate'];
    this.firstClock = map['fclock'];
    this._dayes = map['dayes'];
    this._times = map['times'];
    this._img_direct = map['img_direct'];
    this._notice = map['notice'];
    this._medId = map['id'];
  }

  int get diagonId => _diagonId;

  set diagonId(int value) {
    _diagonId = value;
  }

  int get patId => _patId;

  set patId(int value) {
    _patId = value;
  }

  String get doctName => _doctName;

  set doctName(String value) {
    _doctName = value;
  }

  String get medAmount => _medAmount;

  set medAmount(String value) {
    _medAmount = value;
  }

  String get diagon => _diagon;

  set diagon(String value) {
    _diagon = value;
  }

  String get instruction => _instruction;

  set instruction(String value) {
    _instruction = value;
  }

  String get dayes => _dayes;

  set dayes(String value) {
    _dayes = value;
  }

  String get times => _times;

  set times(String value) {
    _times = value;
  }

  String get img_direct => _img_direct;

  set img_direct(String value) {
    _img_direct = value;
  }

  int get medId => _medId;

  set medId(int value) {
    _medId = value;
  }

  String get firstClock => _firstClock;

  set firstClock(String value) {
    _firstClock = value;
  }
}

class Times {
  int _timesId;
  int _digonId;
  String _dayDate;
  String _dayTime;
  int _medicineState;

  Times(this._digonId, this._dayDate, this._dayTime, this._medicineState,
      [this._timesId]);
  Times.WithId();
  String get dayTime => _dayTime;

  set dayTime(String value) {
    _dayTime = value;
  }

  int get digonId => _digonId;

  int get timesId => _timesId;

  set timesId(int value) {
    _timesId = value;
  }

  set digonId(int value) {
    _digonId = value;
  }

  String get dayDate => _dayDate;

  set dayDate(String value) {
    _dayDate = value;
  }

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    if (_timesId != null) {
      map['mtId'] = _timesId;
    }
    map['digonId'] = _digonId;
    map['mtTitle'] = _dayDate;

    return map;
  }

  int get medicineState => _medicineState;

  set medicineState(int value) {
    _medicineState = value;
  }

  // Extract a Times object from a Map object
  Times.fromMapObject(Map<String, dynamic> map) {
    this._timesId = map['mtId'];
    this._digonId = map['d_id'];
    this._dayDate = map['d_date'];
    this._dayTime = map['d_time'];
    this._medicineState = map['d_t_state'];
  }
}

class Card_info {
  String _person_name;
  String _medicine;
  String _amount;

  Card_info(this._person_name, this._medicine, this._amount);

  String get amount => _amount;

  set amount(String value) {
    _amount = value;
  }

  String get medicine => _medicine;

  set medicine(String value) {
    _medicine = value;
  }

  String get person_name => _person_name;

  set person_name(String value) {
    _person_name = value;
  }

  Card_info.fromMapObject(Map<String, dynamic> map) {
    this._person_name = map['p_name'];
    this._medicine = map['title'];
    this._amount = map['amount'];
  }
}
