import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/Shared/states.dart';
import 'package:todo_app/modules/ToDo%20App/Archieved%20Tasks.dart';
import 'package:todo_app/modules/ToDo%20App/Done%20Tasks.dart';
import 'package:todo_app/modules/ToDo%20App/New%20Tasks.dart';

class AppCubit extends Cubit<AppStates>{

  AppCubit() : super (AppInitialStates());

  static AppCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;
  List<Widget> screens = [
    NewTasks(),
    DoneTasks(),
    ArchievedTasks(),
  ];
  List<String> titles = [
    'New Tasks',
    'Done Tasks',
    'Archieved Tasks',
  ];

  void changeIndex(int index){
    currentIndex = index;
    emit(AppChangeBotNavBar());

  }
}