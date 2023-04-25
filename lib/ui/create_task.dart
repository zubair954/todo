import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:todo/controllers/task_controller.dart';
import 'package:todo/res/colors.dart';
import 'package:todo/res/text_style.dart';
import 'package:todo/widgets/custom_button.dart';

import '../widgets/custom_text_field.dart';

class CreateTaskScreen extends StatefulWidget {
  const CreateTaskScreen({super.key});

  @override
  State<CreateTaskScreen> createState() => _CreateTaskScreenState();
}

class _CreateTaskScreenState extends State<CreateTaskScreen> {
  TextEditingController title = TextEditingController();
  TextEditingController dateInput = TextEditingController();
  TextEditingController des = TextEditingController();
  TaskController ctr = Get.find<TaskController>();
  OutlineInputBorder border = OutlineInputBorder(borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(width: 1,color: AppColors.black));

  @override
  void initState() {
    dateInput.text = ""; //set the initial value of text field
    super.initState();
  }

  @override
  void dispose() {
    title.dispose();
    dateInput.dispose();
    des.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create New Task",style: AppTextStyles.heading(Colors.white, FontWeight.bold, 18),),
      ),
      body: SafeArea(child: 
      Container(
        padding: const EdgeInsets.all(16),
        // height: 40,
        child: SingleChildScrollView(
          child: Column(
           children: [
            customTextField(ctr: title, hint: "Title"),
            const SizedBox(height: 10,),

            TextField(
              controller: dateInput,
              
              decoration: InputDecoration(
                 
                 hintText: "Enter Date",
                  border: border,
                  focusedBorder: border, 
                  ),
              readOnly: true,
              onTap: () async{
                 FocusScope.of(context).unfocus();
                DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime.now(),
                    
                    lastDate: DateTime(2100));

                if(pickedDate != null){
                  String formattedDate =
                      DateFormat('yyyy-MM-dd').format(pickedDate);

                  setState(() {
                    dateInput.text =
                        formattedDate; 
                  });    
                  
                }
              },
              ),
            
            
            const SizedBox(height: 10,),

            customTextField(ctr: des, hint: "Description",maxLines: 10),
            const SizedBox(height: 10,),
           customButton(title: "Create", btnColor: AppColors.blue, titleColor: AppColors.white, width: Get.width,onTap: (){
            if(title.text.isEmpty){
              Get.snackbar("Alert", "Title is required");
              return;
            }
            if(dateInput.text.isEmpty ){
              Get.snackbar("Alert", "Date is required");
              return;
            }
            if(des.text.isEmpty){
              Get.snackbar("Alert", "Description is required");
              return;
            }

            ctr.addTask(title.text, dateInput.text, des.text, false);
            Get.snackbar("Success", "Task Added");
            title.clear();
            dateInput.clear();
            des.clear();

           })
           ],
          ),
        ),
      ),
      ),
    );
  }
}