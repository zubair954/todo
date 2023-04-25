import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/controllers/task_controller.dart';
import 'package:todo/res/colors.dart';
import 'package:todo/ui/create_task.dart';
import 'package:todo/widgets/custom_button.dart';

import '../model/task.dart';
import '../res/text_style.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TaskController ctr = Get.put<TaskController>(TaskController());
  String show = "all";
  List<Task> comTasks = <Task>[];
  List<Task> uncomTasks = <Task>[];

  


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: (){
        Get.to(() => const CreateTaskScreen() );
      },
      child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text("Tasks",style: AppTextStyles.heading(Colors.white, FontWeight.bold, 18),
      )),
      body: SafeArea(child: Container(
        padding: const EdgeInsets.all(16),
        child: Obx(
          () => ctr.tasks.isEmpty ? const Center(child: Text("No Data"),) : Column(
            children: [
              Row(
                 children: [
                   Expanded(child: customButton(title: "Completed", btnColor: AppColors.blue, titleColor: AppColors.white, width: Get.width,onTap: (){
                                        // ctr.tasks.removeAt(index);
                                        // Get.back();
                                        comTasks.clear();
                                        for (var task in ctr.tasks) {
      if(task.isCompleted){
        comTasks.add(task);
      }else{
        uncomTasks.add(task);
      }
    }
                                        setState(() {
                                        
                                          show = "com";
                                        });
                                      })),
                   SizedBox(width: 10,),
                   Expanded(child: customButton(title: "Uncompleted", btnColor: AppColors.blue, titleColor: AppColors.white, width: Get.width,onTap: (){
                                        // ctr.tasks.removeAt(index);
                                        // Get.back();
                                        uncomTasks.clear();
                                        for (var task in ctr.tasks) {
      if(task.isCompleted){
        comTasks.add(task);
      }else{
        uncomTasks.add(task);
      }
    }
                                        setState(() {
                                          
                                          show = "uncom";
                                        });
                                      })),
                   SizedBox(width: 10,),
                   Expanded(child: customButton(title: "All", btnColor: AppColors.blue, titleColor: AppColors.white, width: Get.width,onTap: (){
                                        // ctr.tasks.removeAt(index);
                                        // Get.back();
                                        setState(() {
                                          show = "all";
                                        });
                                      })),                                          
                 ],
              ),
              SizedBox(height: 10,),
              if(show == "all")
              Expanded(
                child: ListView.builder(
                  itemCount: ctr.tasks.length,
                  shrinkWrap: true,
                  itemBuilder: (context,index){
                  return Container(
                    width: Get.width,
                    margin: const EdgeInsets.only(bottom: 10),
                    padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                    decoration: BoxDecoration(
                      color: AppColors.white54,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.lightGrey,
                          offset: const Offset(0, 2),
                          blurRadius: 2,
                          spreadRadius: 2
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Checkbox(value: ctr.tasks[index].isCompleted, onChanged: (bool? vale){
                              // print(vale);
                              setState(() {
                                ctr.tasks[index].isCompleted = vale!;
                              });
                                
                            }),
                            const SizedBox(width: 10,),
                            Text(ctr.tasks[index].title),
                          ],
                        ),
                        GestureDetector(
                          onTap: (){
                            Get.dialog(Dialog(child: Container(
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: AppColors.white54,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Center(child: Text("Are you sure")),
                                  const SizedBox(height: 10,),
                                  Row(
                                    children: [
                                      Expanded(child: customButton(title: "Yes", btnColor: AppColors.red, titleColor: AppColors.white, width: Get.width,onTap: (){
                                        ctr.tasks.removeAt(index);
                                        Get.back();
                                      })),
              
                                      const SizedBox(width: 10,),
                                      Expanded(child: customButton(title: "No", btnColor: AppColors.blue, titleColor: AppColors.white, width: Get.width,onTap: (){
                                        Get.back();
                                      }))
                                    ],
                                  ),
                                ],
                              ),
                            ),));
                            // ctr.tasks.removeAt(index);
                          },
                          child: Icon(Icons.delete,color: AppColors.red,)),
                      ],
                    ),
                  );
                }),
              ),
              if(show == "com")
              Expanded(
                child: ListView.builder(
                  itemCount: comTasks.length,
                  shrinkWrap: true,
                  itemBuilder: (context,index){
                  return Container(
                    width: Get.width,
                    margin: const EdgeInsets.only(bottom: 10),
                    padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                    decoration: BoxDecoration(
                      color: AppColors.white54,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.lightGrey,
                          offset: const Offset(0, 2),
                          blurRadius: 2,
                          spreadRadius: 2
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Checkbox(value: comTasks[index].isCompleted, onChanged: (bool? vale){
                              // print(vale);
                              setState(() {
                                ctr.tasks[index].isCompleted = vale!;
                                comTasks[index].isCompleted = vale;
                              });
                                
                            }),
                            const SizedBox(width: 10,),
                            Text(comTasks[index].title),
                          ],
                        ),
                        GestureDetector(
                          onTap: (){
                            Get.dialog(Dialog(child: Container(
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: AppColors.white54,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Center(child: Text("Are you sure")),
                                  const SizedBox(height: 10,),
                                  Row(
                                    children: [
                                      Expanded(child: customButton(title: "Yes", btnColor: AppColors.red, titleColor: AppColors.white, width: Get.width,onTap: (){
                                        ctr.tasks.removeAt(index);
                                        comTasks.removeAt(index);
                                        Get.back();
                                      })),
              
                                      const SizedBox(width: 10,),
                                      Expanded(child: customButton(title: "No", btnColor: AppColors.blue, titleColor: AppColors.white, width: Get.width,onTap: (){
                                        Get.back();
                                      }))
                                    ],
                                  ),
                                ],
                              ),
                            ),));
                            // ctr.tasks.removeAt(index);
                          },
                          child: Icon(Icons.delete,color: AppColors.red,)),
                      ],
                    ),
                  );
                }),
              ),
              if(show == "uncom")
              Expanded(
                child: ListView.builder(
                  itemCount: uncomTasks.length,
                  shrinkWrap: true,
                  itemBuilder: (context,index){
                  return Container(
                    width: Get.width,
                    margin: const EdgeInsets.only(bottom: 10),
                    padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                    decoration: BoxDecoration(
                      color: AppColors.white54,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.lightGrey,
                          offset: const Offset(0, 2),
                          blurRadius: 2,
                          spreadRadius: 2
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Checkbox(value:uncomTasks[index].isCompleted, onChanged: (bool? vale){
                              // print(vale);
                              setState(() {
                                ctr.tasks[index].isCompleted = vale!;
                                uncomTasks[index].isCompleted = vale;
                              });
                                
                            }),
                            const SizedBox(width: 10,),
                            Text(uncomTasks[index].title),
                          ],
                        ),
                        GestureDetector(
                          onTap: (){
                            Get.dialog(Dialog(child: Container(
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: AppColors.white54,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Center(child: Text("Are you sure")),
                                  const SizedBox(height: 10,),
                                  Row(
                                    children: [
                                      Expanded(child: customButton(title: "Yes", btnColor: AppColors.red, titleColor: AppColors.white, width: Get.width,onTap: (){
                                        ctr.tasks.removeAt(index);
                                        uncomTasks.removeAt(index);
                                        Get.back();
                                      })),
              
                                      const SizedBox(width: 10,),
                                      Expanded(child: customButton(title: "No", btnColor: AppColors.blue, titleColor: AppColors.white, width: Get.width,onTap: (){
                                        Get.back();
                                      }))
                                    ],
                                  ),
                                ],
                              ),
                            ),));
                            // ctr.tasks.removeAt(index);
                          },
                          child: Icon(Icons.delete,color: AppColors.red,)),
                      ],
                    ),
                  );
                }),
              ),
              SizedBox(height: 10,),
              
            ],
          ),
        ),
      )),
    );
  }
}