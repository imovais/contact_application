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
              leading: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: Colors.grey.shade300),
                child: Center(
                  child: Text(
                      style: TextStyle(fontSize: 16),
                      Data.recenthistory[i]['name']
                          .toString()[0]
                          .toUpperCase()),
                ),
              ),
              title: Text(
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  Data.recenthistory[i]['name'].toString()),
              subtitle: Text(
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.normal),
                  Data.recenthistory[i]['phone'].toString()),
              trailing: Icon(color: Colors.green.shade700, Icons.call_made));
        },
      ),
    );
  }
}
