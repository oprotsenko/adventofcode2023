import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

part 'main_event.dart';
part 'main_state.dart';
part 'day_one.dart';



class MainBloc extends Bloc<MainEvent, MainState> {
  MainBloc() : super(MainState()) {
    _day1();
  }

  String task1 = '';
  String task2 = '';

  late final List<String> _fileContent;

  Future<void> _day1() async {
    await _getListOfLines();
    task1 = await _task1(_fileContent);
    task2 = await _task2(_fileContent);
  }

  Future<void> _getListOfLines() async {
    final file = await rootBundle.loadString('assets/task.txt');
    _fileContent = file.split('\n');
  }
}
