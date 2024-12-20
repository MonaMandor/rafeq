// ignore_for_file: avoid_single_cascade_in_expression_statements

import 'dart:collection';
import 'package:rafeq/task_manger/models/task.dart';
import 'package:rafeq/task_manger/widgets/dialog_body_widget.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:rafeq/task_manger/constant.dart';
import 'package:flutter/Material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';


class TaskData extends ChangeNotifier {
  List<Task> _tasks = [];

  UnmodifiableListView<Task> get tasks {
    return UnmodifiableListView(_tasks);
  }

  int get taskCount {
    return _tasks.length;
  }

  void addTask(String? newTaskTitle, String newSubTitle, String date) {
    final task = Task(name: newTaskTitle, subname: newSubTitle, date: date);
    _tasks.add(task);

    notifyListeners();
  }

  void upDateTask(Task task) {
    task.toggleDone();
    notifyListeners();
  }

  void deleteTask(Task task) {
    _tasks.remove(task);
    notifyListeners();
  }

  String formattedDate = DateFormat('dd/MM/yyyy  kk:mm').format(DateTime.now());

  void alertMethod(BuildContext context, Task task) {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.warning,
      headerAnimationLoop: false,
      animType: AnimType.scale,
      showCloseIcon: true,
      closeIcon: Icon(Icons.close, color: Colors.lightBlueAccent
      ),
      btnCancelText: 'No',
      btnOkText: 'Yes',
      btnOkColor: Colors.lightBlueAccent,
      btnCancelColor: Colors.red[300],
      body: DialogBodyWidget(
        dialogTitle: "Delete Tassk?",
        dialogDesc: "Are you sure want to delete this task from the list?",
      ),
      btnCancelOnPress: () {},
      onDismissCallback: (type) {
        debugPrint('Dialog Dissmiss from callback $type');
      },
      btnOkOnPress: () {
        _tasks.remove(task);
        notifyListeners();
      },
      buttonsTextStyle: GoogleFonts.mcLaren(
        textStyle: KDialogButtonTextStyle,
      ),
    )..show();
  }

  void dialogInfo(BuildContext context, Task task) {
    AwesomeDialog(
      context: context,
      headerAnimationLoop: false,
      dialogType: DialogType.noHeader,
  
      customHeader: Image.asset(
        'assets/logo.png',
        height: 78,
        width: 80,
        fit: BoxFit.cover,
      ),
      body: DialogBodyWidget(
        dialogTitle: task.name,
        dialogDesc: task.subname,
      ),
      btnOkOnPress: () {
        debugPrint('OnClcik');
      },
      btnOkColor: Colors.lightBlueAccent,
      btnOkIcon: Icons.check_circle,
       buttonsTextStyle: GoogleFonts.mcLaren(
        textStyle: KDialogButtonTextStyle,
      ),
    )..show();
  }
}
