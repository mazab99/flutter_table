import 'package:flutter/material.dart';
import 'package:flutter_table/model/table_model.dart';
import 'package:flutter_table/tables_data.dart';

class TablesProvider extends ChangeNotifier {
  final List<TableModel> _dataList = TablesData.tablesDataList;

  List<TableModel> get dataList => [..._dataList];

  List<int> _runningTimeList = [];
  List<int> _joggingTimeList = [];
  List<int> _exerciseTimeList = [];

  separateTime() {
    List<int> runningTimeListInstance = [];
    List<int> joggingTimeListInstance = [];
    List<int> exerciseTimeListInstance = [];

    for (var i = 0; i < _dataList.length; i++) {
      runningTimeListInstance.add(_dataList[i].runningTime!);
      joggingTimeListInstance.add(_dataList[i].joggingTime!);
      exerciseTimeListInstance.add(_dataList[i].exerciseTime!);
    }

    _runningTimeList = runningTimeListInstance;
    _joggingTimeList = joggingTimeListInstance;
    _exerciseTimeList = exerciseTimeListInstance;
  }

  int calculateTotalRunningTime() {
    return _runningTimeList.fold(
        0, (previousValue, element) => previousValue + element);
  }

  int calculateTotalJoggingTime() {
    return _joggingTimeList.fold(
        0, (previousValue, element) => previousValue + element);
  }

  int calculateTotalExerciseTime() {
    return _exerciseTimeList.fold(
        0, (previousValue, element) => previousValue + element);
  }

  int calculateTotalTime() {
    return calculateTotalRunningTime() +
        calculateTotalJoggingTime() +
        calculateTotalExerciseTime();
  }

  int calculateTotalTimeByDate(DateTime? date) {
    TableModel data = _dataList.firstWhere((e) => e.date == date);
    return data.exerciseTime! + data.joggingTime! + data.runningTime!;
  }

  calculateTotalRTEngagement() {
    return ((calculateTotalRunningTime() / calculateTotalTime()) * 100)
        .toStringAsFixed(2);
  }

  calculateTotalRTengagementbyDate(DateTime? date) {
    TableModel data = _dataList.firstWhere((e) => e.date == date);
    return ((data.runningTime! / calculateTotalTime()) * 100)
        .toStringAsFixed(2);
  }

  calculateTotalJTEngagement() {
    return ((calculateTotalJoggingTime() / calculateTotalTime()) * 100)
        .toStringAsFixed(2);
  }

  calculateTotalJTEngagementByDate(DateTime? date) {
    TableModel data = _dataList.firstWhere((e) => e.date == date);
    return ((data.joggingTime! / calculateTotalTime()) * 100)
        .toStringAsFixed(2);
  }

  calculateTotalETEngagement() {
    return ((calculateTotalExerciseTime() / calculateTotalTime()) * 100)
        .toStringAsFixed(2);
  }

  calculateTotalETengagementbyDate(DateTime? date) {
    TableModel data = _dataList.firstWhere((e) => e.date == date);
    return ((data.exerciseTime! / calculateTotalTime()) * 100)
        .toStringAsFixed(2);
  }
}
