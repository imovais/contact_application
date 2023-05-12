// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../_UTILS/data.dart';
import '../_WIDGETS/groupcontainer.dart';

class GroupScreen extends StatelessWidget {
  const GroupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        elevation: 0,
        title: Text('Groups'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Wrap(
              runSpacing: 20,
              spacing: 20,
              children: [
                groupcontainer(
                    bgcolor: Colors.green.shade100,
                    heading: 'Family',
                    subheading: '18 Members'),
                groupcontainer(
                    bgcolor: Colors.red.shade100,
                    heading: 'Friends',
                    subheading: '9 Members'),
                groupcontainer(
                    bgcolor: Colors.blue.shade100, heading: 'New Group'),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Text(
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.black54),
                'Favourites'),
            Divider(color: Colors.black87),
            Expanded(
              child: ListView.builder(
                itemCount: Data.favourites.length,
                itemBuilder: (context, indx) {
                  return ListTile(
                    leading: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.red.shade100),
                      child: Center(
                        child: Text(
                            style: TextStyle(
                                fontSize: 16,
                                color: Color.fromARGB(255, 224, 15, 0),
                                fontWeight: FontWeight.bold),
                            Data.favourites[indx]['name']
                                .toString()[0]
                                .toUpperCase()),
                      ),
                    ),
                    title: Text(
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                        Data.favourites[indx]['name'].toString()),
                    trailing: Icon(
                        size: 20, color: Colors.red.shade800, Icons.favorite),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
