// //all fuctions->get,delete,edit

// import 'package:hive_flutter/adapters.dart';
// import 'package:flutter/material.dart';
// import '../models/data_modal.dart';

// ValueNotifier<List<StudentModel>> studentListNotifier = ValueNotifier([]);

// Future<void> addStudent(StudentModel value) async {
//   final studentDB = await Hive.openBox<StudentModel>('student_db');
//   final id = await studentDB.add(value);
//   value.id = id;
//   studentListNotifier.value.add(value);
//   studentListNotifier.notifyListeners();
//   //here we use notifylisteners because to notify the list without this the list widget won't work
// }

// Future<void> getallstudents() async {
//   final studentDB = await Hive.openBox<StudentModel>('student_db');
//   studentListNotifier.value.clear();
//   studentListNotifier.notifyListeners();
//   studentListNotifier.value.addAll(studentDB.values);
// }

// Future<void> deleteStudent(int id) async {
//   final studentDB = await Hive.openBox<StudentModel>('student_db');
//   await studentDB.deleteAt(id);
//   getallstudents();
// }

// Future<void> editList(int id, StudentModel value) async {
//   final studentDatabase = await Hive.openBox<StudentModel>('student_db');
//   studentDatabase.putAt(id, value);
//   getallstudents();
// }
