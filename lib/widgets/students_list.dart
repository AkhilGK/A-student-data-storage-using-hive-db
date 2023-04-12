import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_model/provider/studentProvider.dart';
import '../db/functions/db_functions.dart';
import 'display_student_screen.dart';
import 'edit_student.dart';

class ListStudents extends StatefulWidget {
  const ListStudents({super.key});

  @override
  State<ListStudents> createState() => _ListStudentsState();
}

class _ListStudentsState extends State<ListStudents> {
  @override
  Widget build(BuildContext context) {
    return Consumer<studentProvider>(
      builder: (context, studentList, child) {
        return ListView.separated(
            itemBuilder: ((context, index) {
              //thelist inside provider
              final data = studentList.studentListProvider[index];
              return Padding(
                padding: const EdgeInsets.all(15.0),
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 30,
                    backgroundImage: FileImage(
                      File(data.photo),
                    ),
                  ),
                  title: Text(data.name),
                  trailing: Wrap(
                    spacing: 12, // space between two icons
                    children: <Widget>[
                      IconButton(
                        onPressed: (() {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: ((context) {
                                return EditStudent(
                                    name: data.name,
                                    age: data.age,
                                    address: data.address,
                                    number: data.phnNumber,
                                    index: index,
                                    image: data.photo,
                                    photo: '');
                              }),
                            ),
                          );
                          // EditStudent();
                        }),
                        icon: const Icon(
                          Icons.edit,
                          color: Colors.blue,
                        ),
                        tooltip: 'Edit',
                      ),

                      IconButton(
                        onPressed: (() {
                          showDialog(
                            context: context,
                            builder: ((context) {
                              return Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: AlertDialog(
                                  title: const Text(
                                    'Alert!',
                                    style: TextStyle(
                                      color: Colors.red,
                                    ),
                                  ),
                                  content: const Text(
                                    "Do you want to delete this student",
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: (() {
                                        popoutfuction(context);
                                        Provider.of<studentProvider>(context,
                                                listen: false)
                                            .deleteStudent(index);
                                      }),
                                      child: const Text('Yes'),
                                    ),
                                    TextButton(
                                        onPressed: (() {
                                          popoutfuction(context);
                                        }),
                                        child: const Text('No'))
                                  ],
                                ),
                              );
                            }),
                          );
                        }),
                        icon: const Icon(
                          Icons.delete_outline,
                          color: Colors.red,
                        ),
                        tooltip: 'Delete',
                      ),
                      // icon-2
                    ],
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: ((context) {
                          return DisplayStudent(
                            name: data.name,
                            age: data.age,
                            address: data.address,
                            number: data.phnNumber,
                            index: index,
                            photo: data.photo,
                          );
                        }),
                      ),
                    );
                  },
                ),
              );
            }),
            separatorBuilder: ((context, index) {
              return const Divider();
            }),
            itemCount: studentList.studentListProvider.length);
      },
    );
  }

  popoutfuction(BuildContext context) {
    return Navigator.of(context).pop();
  }
}
