import 'package:flutter/cupertino.dart';

import 'package:hive_flutter/adapters.dart';
import 'package:flutter/material.dart';
import 'package:student_model/db/models/data_modal.dart';

class studentProvider extends ChangeNotifier {
  List<StudentModel> studentListProvider = ([]);

  Future<void> addStudent(StudentModel value) async {
    final studentDB = await Hive.openBox<StudentModel>('student_db');
    final id = await studentDB.add(value);
    value.id = id;
    studentListProvider.add(value);
    notifyListeners();
    //here we use notifylisteners because to notify the list without this the list widget won't work
  }

  Future<void> getallstudents() async {
    final studentDB = await Hive.openBox<StudentModel>('student_db');
    studentListProvider.clear();
    notifyListeners();
    studentListProvider.addAll(studentDB.values);
  }

  Future<void> deleteStudent(int id) async {
    final studentDB = await Hive.openBox<StudentModel>('student_db');
    await studentDB.deleteAt(id);
    getallstudents();
  }

  Future<void> editList(int id, StudentModel value) async {
    final studentDatabase = await Hive.openBox<StudentModel>('student_db');
    studentDatabase.putAt(id, value);
    getallstudents();
  }
}
