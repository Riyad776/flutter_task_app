import 'package:flutter/material.dart';
import 'package:flutter_task_app/task_file.dart';

class MyTaskTile extends StatelessWidget {
  final Task tsk;
  final Function update, delete;

  const MyTaskTile({required this.tsk, required this.update, required this.delete});

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      direction: DismissDirection.startToEnd,
      background: Container(color: Colors.red,),
      onDismissed: (direction) {
        delete(tsk.t_id);
        ScaffoldMessenger.of(context).
        showSnackBar(SnackBar(content: const
        Text('Task has been removed'), backgroundColor: Colors.grey[800],));
      },
      key: UniqueKey(),
      child: Container(
        margin: EdgeInsets.all(8),
        decoration: BoxDecoration(
            border: Border.all(
                color: Colors.green.shade700,
                width: 1.5
            )
        ),
        child: ListTile(
          trailing: IconButton(icon: const Icon(Icons.edit),
            iconSize: 20,
            onPressed: () => update(tsk),
          ),

          title: Text(
            tsk.t_name.toString(), style: const TextStyle(fontSize: 20),),
    subtitle: Text('Time : ${tsk.time.hour}:${tsk.time.minute} \n'
        'Date: ${tsk.time.day}/ ${tsk.time.month}/'
    ' ${tsk.time.year} ',

            style: const TextStyle(fontSize: 17),),
        ),
      ),
    );
  }
}
