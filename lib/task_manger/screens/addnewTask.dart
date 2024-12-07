import 'package:rafeq/core/constansts/strings/context_extensions.dart';
import 'package:rafeq/core/shared/shared_widget/Custom_button.dart';
import 'package:rafeq/core/theme/app_colors.dart';
import 'package:rafeq/task_manger/models/task_data.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AddNewTask extends StatefulWidget {
  @override
  State<AddNewTask> createState() => _AddNewTaskState();
}

class _AddNewTaskState extends State<AddNewTask> {
  final _taskNameFormKey = GlobalKey<FormState>(debugLabel: 'taskDesState');
  final _taskDesFormKey = GlobalKey<FormState>(debugLabel: 'taskNameState');
  final _taskNameController = TextEditingController();
  final _taskDesController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff737373),
      child: Container(
        padding: EdgeInsets.all(30.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Column(
         
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
             IconButton(
            onPressed: (){
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back),

          ),
            Text(
            'إضافة مهمة جديدة',
              textAlign: TextAlign.center,
              style: GoogleFonts.mcLaren(
                textStyle:  GoogleFonts.tajawal(
                  fontSize: 25,
                  fontWeight: FontWeight.w700,
                  color: AppColors.sexthTextColor),
              ),
            ),
            Form(
              key: _taskNameFormKey,
              child: TextFormField(
                controller: _taskNameController,
                decoration: InputDecoration(
                  hintText: 'اسم المهمة',
                  hintStyle: GoogleFonts.tajawal(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  color: AppColors.sexthTextColor),
                ),
                autofocus: true,
                textAlign: TextAlign.left,
                
                style: GoogleFonts.tajawal(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  color: AppColors.sexthTextColor),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'من فضلك ادخل اسم المهمة.';
                  }
                  return null;
                },
              ),
            ),
            Form(
              key: _taskDesFormKey,
              child: TextFormField(
                controller: _taskDesController,
                decoration: InputDecoration(
                  hintText: 'وصف المهمة',
                  hintStyle: GoogleFonts.tajawal(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  color: AppColors.sexthTextColor),
                ),
                autofocus: true,
                textAlign: TextAlign.left,
                style:  GoogleFonts.tajawal(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: AppColors.sexthTextColor),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'من فضلك ادخل وصف المهمة.';
                  }
                  return null;
                },
              ),
            ),
            SizedBox(
              height: context.propHeight(20.0),
            ),
            CustomButton(title: 'اضافه', style:  GoogleFonts.tajawal(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.white)
             
             ,onPressed: () {
                if (_taskNameFormKey.currentState!.validate()) {
                  if (_taskDesFormKey.currentState!.validate()) {
                    Provider.of<TaskData>(context, listen: false).addTask(
                      _taskNameController.text,
                      _taskDesController.text,
                      TaskData().formattedDate,
                    );
                    Navigator.pop(context);
                  }
                } else {
                  return null;
                }
                
              },)
           ],
        ),
      ),
    );
  }
}
