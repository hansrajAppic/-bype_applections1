// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';

void main() {
  runApp(UserDetails());
}

class UserDetails extends StatelessWidget {
  final List<Map<String, String>> dataList = [
    {'title': 'Title 1', 'subtitle': 'Subtitle 1'},
    {'title': 'Title 2', 'subtitle': 'Subtitle 2'},
    {'title': 'Title 3', 'subtitle': 'Subtitle 3'},
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My Flutter App'),
          
        ),
        // Other widgets of your app go here
        body: Column(
          children: [
            ListView.builder(
              shrinkWrap: true,
              itemCount: dataList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: const Color(0xffFFFFFF),
                      boxShadow: const [
                        BoxShadow(
                          color: Color.fromARGB(69, 143, 145, 135),
                          blurRadius: 4,
                        ),
                      ],
                    ),
                    child: ListTile(
                      leading: CircleAvatar(
                        child: Text((index + 1).toString()),
                      ),
                      title: Text(dataList[index]['title']!),
                      subtitle: Text(dataList[index]['subtitle']!),
                      onTap: () {
                        // Add your onTap functionality here
                      },
                    ),
                  ),
                );
              },
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("submited")),
          ],
        ),
      ),
    );
  }
}
