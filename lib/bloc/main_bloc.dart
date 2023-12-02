import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

part 'main_event.dart';

part 'main_state.dart';

part 'day_one.dart';

part 'day_two.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  MainBloc() : super(MainState()) {
    _day1();
    _day2();
  }

  Future<List<String>> _getListOfLines(String fileName) async {
    final file = await rootBundle.loadString(fileName);
    return file.split('\n');
  }

  Future<void> _day1() async {
    final List<String> fileContent =
        await _getListOfLines('assets/day_one.txt');
    print('day one task one: ${await _task1(fileContent)}');
    print('day one task two: ${await _task2(fileContent)}');
  }

  Future<void> _day2() async {
    final List<String> fileContent =
        await _getListOfLines('assets/day_two.txt');
    print('day two task one: ${await _task1Day2(fileContent)}');
    print('day two task two: ${await _task2Day2(fileContent)}');
  }
}
