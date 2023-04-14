import 'dart:io';
import 'package:flutter/material.dart';
import 'package:student_model/constants/constants.dart';
import 'edit_student.dart';

class DisplayStudent extends StatelessWidget {
  final String name;
  final String age;
  final String address;
  final String number;
  final String photo;
  final int index;
  const DisplayStudent({
    super.key,
    required this.name,
    required this.age,
    required this.address,
    required this.number,
    required this.index,
    required this.photo,
    // required String photo,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 82, 63, 85),
        title: const Text('Student Details'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                const Center(
                  child: Text(
                    'Student Full Details',
                    style: TextStyle(fontSize: 25, color: Color(0xFF284350)),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                CircleAvatar(
                  radius: 80,
                  backgroundImage: FileImage(
                    File(
                      photo,
                    ),
                  ),
                ),
                kHeight10,
                detailsFields(title: 'Name', data: name),
                kHeight10,
                detailsFields(title: 'Age', data: age),
                kHeight10,
                detailsFields(title: 'Address', data: address),
                kHeight10,
                detailsFields(title: 'Phone No', data: number),
                ElevatedButton.icon(
                    onPressed: (() {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: ((context) {
                        return EditStudent(
                            name: name,
                            age: age,
                            address: address,
                            number: number,
                            index: index,
                            image: photo,
                            photo: '');
                      })));
                    }),
                    icon: const Icon(
                      Icons.edit,
                    ),
                    label: const Text('Edit'))
              ],
            ),
          ),
        ),
      ),
    );
  }

  Text detailsFields({required String title, required String data}) {
    return Text(
      '$title : $data',
      style: const TextStyle(
        fontSize: 20,
      ),
    );
  }
}
