// ignore_for_file: prefer_const_constructors

import 'package:rafeq/core/constansts/strings/asset_manger.dart';
import 'package:rafeq/core/constansts/strings/context_extensions.dart';
import 'package:rafeq/core/theme/app_colors.dart';
import 'package:rafeq/task_manger/constant.dart';
import 'package:rafeq/task_manger/models/task_data.dart';
import 'package:rafeq/task_manger/screens/addnewTask.dart';
import 'package:rafeq/task_manger/screens/all_task.dart';
import 'package:rafeq/task_manger/widgets/task_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';

class TasksScreens extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
          backgroundColor: AppColors.sexthTextColor,
          child: Center(
            child: Icon(
              Icons.add,
              size: 30.0,
              color: Colors.white,
            ),
          ),
          onPressed: () {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              builder: (context) => SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom),
                  child: AddNewTask(),
                ),
              ),
            );
          }),
      backgroundColor: AppColors.sexthTextColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //back button
        
          Container(
            padding: EdgeInsets.only(
                top: context.propHeight(60.0),
                left: context.propWidth(30.0),
                bottom: context.propHeight(30.0),
                right: context.propWidth(30.0)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [  IconButton(onPressed: 
          () => Navigator.pop(context)
          , icon: Icon(Icons.arrow_back_ios, color: Colors.white)),

                    CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 25.0,
                      child: IconButton(
                        onPressed: () => Navigator.push(context,
                            MaterialPageRoute(builder: (context) => AllTask())),
                        icon: Icon(
                          Icons.list,
                          size: 30.0,
                          color: 
                          AppColors.sexthTextColor
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      'المهام اليوميه',
                      style:  GoogleFonts.tajawal(
                  fontSize: 28,
                  fontWeight: FontWeight.w600,
                  color: Colors.white
                      ),
                    ),
                    Expanded(
                      child: Image.asset(
                        AssetManger.logo,
                        height: 100,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: context.propHeight(10.0),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "${Provider.of<TaskData>(context).taskCount} مهمه",
                      style:  GoogleFonts.tajawal(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.white
                      ),
                    ),
                    Container(
                      height: context.propHeight(30.0),
                      width: context.propWidth(200),
                     
                      decoration: kDateContainerDecoration,
                      child: Center(
                        child: Text(
                          TaskData().formattedDate,
                          style: kAlertDescStyle,
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 18.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                ),
              ),
              child: TaskLists(),
            ),
          ),
        ],
      ),
    );
  }
}
