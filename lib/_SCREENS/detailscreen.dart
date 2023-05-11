// ignore_for_file: prefer_const_constructors,, prefer_typing_uninitialized_variables, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  final Map data;

  const DetailScreen({super.key, required this.data});

  // get idx => data;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          foregroundColor: Colors.black,
          title: Text('Contact Detail'),
          actions: [
            Padding(
                padding: const EdgeInsets.only(right: 5),
                child: IconButton(
                    iconSize: 30,
                    onPressed: () {},
                    icon: Icon(Icons.more_vert)))
          ],
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.grey.shade300),
                    child: Center(
                        child: Text(
                            style: TextStyle(fontSize: 40),
                            data['name'].toString()[0])),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    data['name'].toString()),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                        style: TextStyle(fontSize: 22),
                        data['phone'].toString()),
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: Colors.green),
                          width: 40,
                          height: 40,
                          child: IconButton(
                              onPressed: () {},
                              icon: Icon(color: Colors.white, Icons.call)),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.yellow.shade700),
                          width: 40,
                          height: 40,
                          child: IconButton(
                              onPressed: () {},
                              icon: Icon(color: Colors.white, Icons.sms)),
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Call History',
                    style: TextStyle(color: Colors.grey.shade500, fontSize: 18),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: 5,
                    itemBuilder: (context, idx) {
                      return ListTile(
                        title: Text(
                          'Apr 27, 14:30',
                          style: TextStyle(fontSize: 18),
                        ),
                        subtitle: Text('03424135444'),
                        trailing: Text('missed'),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
