// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../_UTILS/data.dart';

class RecentHistory extends StatelessWidget {
  const RecentHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text('All'),
        actions: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(onPressed: () {}, icon: Icon(Icons.search)),
              IconButton(onPressed: () {}, icon: Icon(Icons.more_vert)),
            ],
          )
        ],
      ),
      body: ListView.builder(
        //reverse: true
        itemCount: Data.recenthistory.length,
        itemBuilder: (context, i) {
          return ListTile(
            title: Text(Data.recenthistory[i]['name'].toString()),
          );
        },
      ),
    );
  }
}
