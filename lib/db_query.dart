
import 'package:flutter_task_app/task_file.dart';
import 'package:flutter_task_app/db_helper.dart';
class DBQuery{
  DBHelper dbHelper = DBHelper();

  // Query to insert into Database
  Future<Task> SaveTask (Task task) async{
    var dbClient = await dbHelper.datebase;
    task.t_id = await dbClient.insert( DBHelper.taskTable, task.toMap());
    print('task has been saved' + '   ${task.t_id}');
    return task;
  }

// Query to get All tasks in the Database
  Future<List<Task>>  getAllTask()async{
    final dbClient= await dbHelper.datebase;

    final List<Map<String, dynamic>> myList = await dbClient.query(DBHelper.taskTable);
    return List.generate(myList.length, (index)
    {
    taskTime time=  taskTime(
        hour: myList[index]['t_hour'],
        minute: myList[index]['t_minute'],
        day:myList[index]['t_day'],
        dayName:myList[index]['dayName'],
        month: myList[index]['t_month'],
        year:myList[index] ['t_year']);

      return Task(t_id:  myList[index]['t_id'],t_name: myList[index]['t_name'], time: time);
    });
  }

  // Update a Raw in DB
Future<int> updateTask(Task tsk) async{
    var dbClient = await dbHelper.datebase;
    return await dbClient.update(DBHelper.taskTable,tsk.toMap(),
        where: '${DBHelper.t_id} = ?', whereArgs: [tsk.t_id]);
}


//Delete a Raw in DB
 Future<int> deleteTask(int id) async{
    var dbClient= await dbHelper.datebase;
    return await dbClient.delete(DBHelper.taskTable,where: '${DBHelper.t_id} = ?', whereArgs: [id]);
 }

Future<void> closeDB()async{
    print('Closing Database');
    await DBHelper.db!.close();
}
}