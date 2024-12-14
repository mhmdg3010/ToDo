import 'dart:core';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo_app/Shared/cubit.dart';
import 'package:todo_app/Shared/states.dart';
import 'package:todo_app/components/components.dart';


class HomeLayout extends StatelessWidget {
  @override

  var ScaffoldKey = GlobalKey<ScaffoldState>();
  var formKey = GlobalKey<FormState>();
  bool isBottomSheetShown = false;
  IconData fabIcon = Icons.edit;
  late Database database;
  var titleController = TextEditingController();
  var timeController = TextEditingController();
  var dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=>AppCubit(),
      child: BlocConsumer<AppCubit,AppStates>(
        listener: (BuildContext context, AppStates state){},
        builder: (BuildContext context, AppStates state){
          AppCubit cubit = AppCubit.get(context);
          return Scaffold(
            key: ScaffoldKey,
            appBar: AppBar(
              title: Text(cubit.titles[cubit.currentIndex]),
            ),
            body:  ConditionalBuilder(
              condition: true,
              builder: (context)=> cubit.screens[cubit.currentIndex],
              fallback: (context) => Center(child: CircularProgressIndicator()),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () async {
                if (isBottomSheetShown) {
                  if(formKey.currentState!.validate())
                  {
                    insertToDatabase(
                      title: titleController.text ,
                      date: dateController.text,
                      time:timeController.text,
                    ).then((value) {
                      getDataFromDatabase(database).then((value) {
                        Navigator.pop(context);
                        /*  setState(()
                      {
                        isBottomSheetShown = false;
                        fabIcon = Icons.edit;
                        tasks = value;
                        print(tasks);
                      });*/
                      });

                    });
                  }
                } else {
                  ScaffoldKey.currentState!.showBottomSheet(
                        (context) => Container(
                      color: Colors.white,
                      padding: EdgeInsets.symmetric(vertical: 20),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Form(
                          key: formKey,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              defaultTextFormFaild(
                                  controller: titleController,
                                  type: TextInputType.text,
                                  validator: ( value ) {
                                    if(value!.isEmpty ){
                                      return 'Task Title must not be empty';
                                    }
                                    return null;
                                  },
                                  label: 'Task Title',
                                  prefixIcon: Icon(Icons.title)),
                              SizedBox(
                                height: 20,),
                              defaultTextFormFaild(
                                  onTap: (){
                                    showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime.now(),
                                      lastDate: DateTime.parse('2024-12-29'),
                                    ).then((value) {
                                      print(DateFormat.yMMMd().format(value!));
                                      dateController.text=DateFormat.yMMMd().format(value);
                                    });
                                  },
                                  controller: dateController,
                                  type: TextInputType.datetime,
                                  validator: ( value ) {
                                    if(value!.isEmpty ){
                                      return 'Date must not be empty';
                                    }
                                    return null;
                                  },
                                  label: 'Date',
                                  prefixIcon: Icon(Icons.calendar_month)),
                              SizedBox(
                                height: 20,),
                              defaultTextFormFaild(
                                  onTap: (){
                                    showTimePicker(
                                        context: context,
                                        initialTime: TimeOfDay.now()).then((value) {
                                      timeController.text =value!.format(context).toString();
                                      print(value.format(context));
                                    });
                                  },
                                  controller: timeController,
                                  type: TextInputType.datetime,
                                  validator: ( value ) {
                                    if(value!.isEmpty ){
                                      return 'time must not be empty';
                                    }
                                    return null;
                                  },
                                  label: 'Time',
                                  prefixIcon: Icon(Icons.timer,))
                            ],
                          ),
                        ),
                      ),
                    ),
                    elevation: 20,
                  ).closed.then((value) {
                    isBottomSheetShown = false;
                    /*   setState(() {
                    fabIcon = Icons.edit;
                  });*/
                  });
                  isBottomSheetShown = true;
                  /*setState(() {
                  fabIcon = Icons.add;
                });*/
                }
              },
              child: Icon(fabIcon),
            ),
            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              currentIndex:  cubit.currentIndex,
              onTap: (index) {

                  cubit.changeIndex(index);

              },
              items: [
                BottomNavigationBarItem(label: 'Tasks', icon: Icon(Icons.menu_sharp)),
                BottomNavigationBarItem(label: 'Done', icon: Icon(Icons.done_all)),
                BottomNavigationBarItem(
                    label: 'Archieved', icon: Icon(Icons.archive_outlined)),
              ],
            ),
          );
        },
      ),
    );
  }


  void createDatabase() {
    openDatabase(
      'todo.db',
      version: 1,
      onCreate: (database, version) {
        // ignore: avoid_print
        print('database is created');
        database
            .execute(
            'CREATE TABLE tasks (id INTEGER PRIMARY KEY , title TEXT , date TEXT , time TEXT , status TEXT )')
            .then((value) {
          // ignore: avoid_print
          print('table is created');
        }).catchError((error) {
          // ignore: avoid_print
          print('error when create table ${error.toString()}');
        });
      },
      onOpen: (database)
      {

      },);
  }

  Future insertToDatabase({
    required String title,
    required String time,
    required String date,
  }) async {
    await database.transaction((txn) {
      txn
          .rawInsert(
          'INSERT INTO tasks(title , date , time , status) VALUES ("$title","$date","$time","new")')
          .then((value) {
        print("$value inserted successfully");
        getDataFromDatabase(database);
      }).catchError((error) {
        // ignore: avoid_print
        print('error when inserting data ${error.toString()}');
      });
      return Future(() => null);
    });
  }
  Future<List<Map>> getDataFromDatabase(database) async {
    return await database.rawQuery('SELECT * FROM tasks');
  }
}

