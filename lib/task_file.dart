
class Task {
   int? t_id;
   String t_name;
   final taskTime time;
 Task({required this.t_id, required this.t_name, required this.time});


// Convert a Task into Map
  Map<String ,dynamic> toMap(){
    var map = new Map<String, dynamic>();
    map['t_id']=t_id;
    map['t_name']= t_name;
    map['t_day'] = time.day;
    map['t_month']= time.month;
    map['t_year']=time.year;
    map['dayName']=time.dayName;
    map['t_hour']=time.hour;
    map['t_minute']=time.minute;

    return map;
  }
}


class taskTime{
  final int day;
  final int month;
  final int year;
  final int hour;
  final int minute;
  final String dayName;
  taskTime({ required this.hour, required this.minute,required this.day,required this.dayName,required this.month , required this.year});

}







