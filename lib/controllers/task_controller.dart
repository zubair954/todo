
import 'package:get/get.dart';

import '../model/task.dart';

class TaskController extends GetxController{
  List<Task> tasks = <Task>[].obs;

  addTask(String title,String date,String des,bool isCompleted){
   Task task = Task(title, date, des, isCompleted);
    tasks.add(task);
  }
}