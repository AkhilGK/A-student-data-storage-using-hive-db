import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_model/provider/studentProvider.dart';

import 'display_student_screen.dart';
import 'students_list.dart';

class SearchWidget extends SearchDelegate {
  @override
  ThemeData appBarTheme(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return theme;
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null); // for closing the search page and going back
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final studentListProvider = Provider.of<studentProvider>(context);
    final searchResults = studentListProvider.studentListProvider
        .where((student) =>
            student.name.toLowerCase().contains(query.toLowerCase().trim()))
        .toList();

    return searchResults.isEmpty
        ? const Center(
            child: Text("Match not found"),
          )
        : ListView.builder(
            itemBuilder: (ctx, index) {
              final data = searchResults[index];
              if (data.name
                  .toLowerCase()
                  .contains(query.toLowerCase().trim())) {
                return Column(
                  children: [
                    ListTile(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: ((context) {
                              return const ListStudents();
                            }),
                          ),
                        );
                      },
                      title: Text(data.name),
                      leading: CircleAvatar(
                        backgroundImage: FileImage(File(data.photo)),
                      ),
                    ),
                    const Divider()
                  ],
                );
              } else {
                return Container();
              }
            },
            itemCount: searchResults.length,
          );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final studentList = Provider.of<studentProvider>(context);
    final searchResults = studentList.studentListProvider;
    return searchResults.isEmpty
        ? const Center(
            child: Text("Match not found"),
          )
        : ListView.builder(
            itemBuilder: (ctx, index) {
              final data = searchResults[index];
              if (data.name
                  .toLowerCase()
                  .contains(query.toLowerCase().trim())) {
                return Column(
                  children: [
                    ListTile(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: ((context) {
                              return DisplayStudent(
                                  name: data.name,
                                  age: data.age,
                                  address: data.address,
                                  number: data.phnNumber,
                                  index: index,
                                  photo: data.photo);
                            }),
                          ),
                        );
                      },
                      title: Text(data.name),
                      leading: CircleAvatar(
                        backgroundImage: FileImage(File(data.photo)),
                      ),
                    ),
                    const Divider()
                  ],
                );
              } else {
                return Container();
              }
            },
            itemCount: searchResults.length,
          );
  }
}
