import 'package:rafeq/core/theme/app_colors.dart';
import 'package:rafeq/task_manger/constant.dart';
import 'package:rafeq/task_manger/models/task_data.dart';
import 'package:rafeq/task_manger/widgets/task_tile.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AllTask extends StatelessWidget {
  const AllTask({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var appBar = AppBar(
      backgroundColor: AppColors.sexthTextColor,
      elevation: 0.0,
      title: Text(
       'قائمة المهام',
        style:  GoogleFonts.tajawal(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color:Colors.white
                ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.all( 8.0),
          child: Center(
              child: Text(
            "${Provider.of<TaskData>(context).taskCount} مهمة",
            textAlign: TextAlign.left,
            style: GoogleFonts.mcLaren(
              textStyle:  GoogleFonts.tajawal(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: Colors.white),
            ),
          )),
        )
      ],
    );
    return Scaffold(
      appBar: appBar,
      body: Consumer<TaskData>(
        builder: (context, taskData, _) {
          if (taskData.taskCount == 0) {
            return Center(
              child: Text(
             'ٌقائمة المهام فارغة',
                style:  GoogleFonts.tajawal(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: AppColors.sexthTextColor),
              ),
            );
          }
          return ListView.builder(
            itemBuilder: (context, index) {
              final task = taskData.tasks[index];
              return TaskTile(
                isChecked: taskData.tasks[index].isDone,
                taskTittle: task.name,
                taskSubTitle: task.subname,
                formatedDate: task.date,
                checkBoxCallBack: (checkboxState) {
                  taskData.upDateTask(task);
                },
                ontap: () => taskData.alertMethod(context, task),
                onTextTap: () => taskData.dialogInfo(context, task),
              );
            },
            itemCount: taskData.taskCount,
          );
        },
      ),
    );
  }
}
