//
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_model/constants/constants.dart';
import 'package:student_model/provider/studentProvider.dart';
import 'package:student_model/widgets/add_students.dart';

import '../widgets/search_screen.dart';
import '../widgets/students_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    Provider.of<StudentProvider>(context).getallstudents();
    return Scaffold(
      appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 82, 63, 85),
          title: const Center(
            child: Text(
              'Student Log',
              style: ktextStyle,
            ),
          ),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.search),
              tooltip: 'Open search',
              onPressed: () {
                showSearch(
                  context: context,
                  delegate: SearchWidget(),
                );
              },
            ),
          ],
          toolbarHeight: 80),
      body: const ListStudents(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 82, 63, 85),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return const AddStudentClass();
              },
            ),
          );
        },
        tooltip: 'Add students',
        child: const Icon(Icons.add),
      ),
    );
  }
}
