class MedicineInfo {
  int medId;
  String medTitle;
  String medform;
  int diagonid;

  MedicineInfo(
      {this.medId,
        this.medTitle,
        this.medform, this.diagonid});

  factory MedicineInfo.fromMap(Map<String, dynamic> json) => MedicineInfo(
    medId: json["id"],
    medTitle: json["title"],
    medform: json["form"],
    diagonid:json["d_id"],
  );
  Map<String, dynamic> toMap() => {
    "id": medId,
    "title": medTitle,
    "form": medform,
    "d_id":diagonid,
  };
}
class TestDay {
  int id;
  int count;

  TestDay(
      {this.id,
        this.count,
        });

  factory TestDay.fromMap(Map<String, dynamic> json) => TestDay(
    id: json["ddd"],
    count: json["ccc"],
  );
  Map<String, dynamic> toMap() => {
    "ddd": id,
    "ccc": count,

  };
}

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
    map['notic'] = _notice;
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
    this._notice = map['notic'];
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

class MedicineDays {
  int _dayesId;
  int _sortn;
  int get sortn => _sortn;
  set sortn(int value) {
    _sortn = value;
  }

  String _dayDate;
  MedicineDays(this._dayDate,this._sortn,[this._dayesId]);
  MedicineDays.WithId();
  int get dayesId => _dayesId;
  set dayesId(int value) {
    _dayesId = value;
  }

  String get dayDate => _dayDate;

  set dayDate(String value) {
    _dayDate = value;
  }
  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    if (_dayesId != null) {
      map['day_id'] = _dayesId;
    }
    map['sortn'] =_sortn;
    map['d_date'] = _dayDate;;
    return map;
  }



  // Extract a Times object from a Map object
  MedicineDays.fromMapObject(Map<String, dynamic> map) {
    this._dayesId = map['day_id'];
    this._sortn =map['sortn'];
    this._dayDate = map['d_date'];
  }

}
class MedicineTimes {
  int _timesId;
  int _dayesId;
  int _digonId;
  String _dayTime;
  int _medicineState;

  MedicineTimes(this._dayesId, this._dayTime, this._medicineState,this._digonId,
      [this._timesId]);
  MedicineTimes.WithId();

  int get digonId => _digonId;

  set digonId(int value) {
    _digonId = value;
  }

  String get dayTime => _dayTime;

  set dayTime(String value) {
    _dayTime = value;
  }

  int get dayesId => _dayesId;

  int get timesId => _timesId;

  set timesId(int value) {
    _timesId = value;
  }

  set dayesId(int value) {
    _dayesId = value;
  }
  int get medicineState => _medicineState;

  set medicineState(int value) {
    _medicineState = value;
  }
  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    if (_timesId != null) {
      map['tid'] = _timesId;
    }
    map['d_id'] = _digonId;
    map['day_id'] = _dayesId;
    map['d_time'] = _dayTime;
    map['d_t_state'] = _medicineState;
    return map;
  }



  // Extract a Times object from a Map object
  MedicineTimes.fromMapObject(Map<String, dynamic> map) {
    this._timesId = map['tid'];
    this._dayesId = map['day_id'];
    this._digonId = map['d_id'];
    this._dayTime = map['d_time'];
    this._medicineState = map['d_t_state'];
  }
}

class Card_info {
  int _diagId,_timesId,_dayesId,_day_time_state,_sortn;

  get sortn => _sortn;

  set sortn(value) {
    _sortn = value;
  }

  get timesId => _timesId;

  set timesId(value) {
    _timesId = value;
  }

  int get diagId => _diagId;

  set diagId(int value) {
    _diagId = value;
  }
  String _person_name,_day_time;

  get day_time => _day_time;

  set day_time(value) {
    _day_time = value;
  }

  String _medicine,_dayDate;

  get dayDate => _dayDate;

  set dayDate(value) {
    _dayDate = value;
  }

  String _amount;
  Card_info(this._person_name, this._medicine, this._amount,this._timesId,this._dayesId,this._day_time,this._day_time_state,
     this._sortn,this._dayDate, [this._diagId]);
  Card_info.WithId();

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
    this.timesId =map['tmid'];
    this._dayesId =map['dayid'];
    this.day_time =map['d_time'];
    this.day_time_state =map['d_t_state'];
    this._diagId = map["dgid"];
    this._dayDate =map['d_date'];
    this._sortn = map["sortn"];
  }

  get dayesId => _dayesId;

  set dayesId(value) {
    _dayesId = value;
  }

  get day_time_state => _day_time_state;

  set day_time_state(value) {
    _day_time_state = value;
  }
}
  ////////////////////////////////////////////////clocl..date//////////////////////
class Medicine_Date{
  int _day,_month,_year;

  Medicine_Date(this._day, this._month, this._year);

  get year => _year;

  set year(value) {
    _year = value;
  }

  get month => _month;

  set month(value) {
    _month = value;
  }

  int get day => _day;

  set day(int value) {
    _day = value;
  }


}
class Medicine_clocl{
  int _dayDate;
      String _clock;
  Medicine_clocl(this._dayDate,this._clock);

  int get dayDate => _dayDate;

  set dayDate(int value) {
    _dayDate = value;
  }

  get clock => _clock;

  set clock(value) {
    _clock = value;
  }
}

