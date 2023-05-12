// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:contact_app/_UTILS/const.dart';
import 'package:flutter/material.dart';

import '../_UTILS/data.dart';

class RecentHistory extends StatefulWidget {
  const RecentHistory({super.key});

  @override
  State<RecentHistory> createState() => _RecentHistoryState();
}

class _RecentHistoryState extends State<RecentHistory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Recent History'),
            Text(
              'All',
              style: TextStyle(color: Colors.grey.shade400),
            ),
          ],
        ),
        actions: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(onPressed: () {}, icon: Icon(Icons.search)),
              PopupMenuButton(
                  icon: Icon(Icons.more_vert),
                  onSelected: (value) {
                    if (value == 1) {
                      setState(() {});
                      Data.recenthistory.clear();
                    }
                  },
                  itemBuilder: (context) => [
                        PopupMenuItem(
                          value: 1,
                          child: Text('Clear All'),
                        ),
                      ])
            ],
          )
        ],
      ),
      body: Data.recenthistory.isEmpty
          ? SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/images/box.png'),
                  Text(
                      style:
                          TextStyle(fontSize: 18, color: Colors.grey.shade600),
                      'You have no History')
                ],
              ))
          : ListView.builder(
              shrinkWrap: true,
              reverse: true,
              itemCount: Data.recenthistory.length,
              itemBuilder: (context, i) {
                return ListTile(
                    onTap: () => makePhoneCall(
                        Data.recenthistory[i]['phone'].toString()),
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
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                        Data.recenthistory[i]['name'].toString()),
                    subtitle: Text(
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.normal),
                        Data.recenthistory[i]['phone'].toString()),
                    trailing:
                        Icon(color: Colors.green.shade700, Icons.call_made));
              },
            ),
    );
  }
}
