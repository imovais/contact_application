// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:contact_app/_UTILS/const.dart';
import 'package:flutter/material.dart';
import '../_UTILS/data.dart';
import 'addbutton.dart';
import 'detailscreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController namecontroller = TextEditingController();
  TextEditingController phonecontroller = TextEditingController();

  //ADD FUNCTION
  addcontact() {
    setState(() {});
    Navigator.pop(context, 'OK');
    Data.contact
        .add({'name': namecontroller.text, 'phone': phonecontroller.text});
    namecontroller.clear();
    phonecontroller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            // APPBAR
            appBar: AppBar(
              foregroundColor: Colors.black,
              backgroundColor: Colors.transparent,
              elevation: 0,
              title: Text('Contact'),
              actions: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(onPressed: () {}, icon: Icon(Icons.search)),
                    IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
                  ],
                )
              ],
            ),
            body: ListView.builder(
              itemCount: Data.contact.length,
              itemBuilder: (context, idx) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailScreen(),
                        ));
                  },
                  child: Card(
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 20,
                        backgroundColor: Colors.blue,
                        backgroundImage: Images.personicon,
                      ),
                      title: Text(Data.contact[idx]['name'].toString()),
                      subtitle: Text(Data.contact[idx]['phone'].toString()),
                      trailing: Icon(color: Colors.green, Icons.call),
                    ),
                  ),
                );
              },
            ),

            //FLOATING ACTION BUTTON
            floatingActionButton: FloatingActionButton(
              onPressed: () => showDialog<String>(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                  titlePadding: EdgeInsets.all(0),
                  contentPadding:
                      EdgeInsets.only(bottom: 150, left: 20, right: 20),
                  title: AppBar(
                    actions: [
                      TextButton(
                          onPressed: () {
                            addcontact();
                          },
                          child: Icon(Icons.done)),
                    ],
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    foregroundColor: Colors.black,
                    title: Text('Add'),
                  ),
                  content: myform(
                      mynamecontroller: namecontroller,
                      myphonecontroller: phonecontroller),
                  // actions: <Widget>[
                  //   // TextButton(
                  //   //   onPressed: () => Navigator.pop(context, 'Cancel'),
                  //   //   child: const Text('Cancel'),
                  //   // ),
                  //   TextButton(
                  //       onPressed: () {
                  //         addcontact();
                  //       },
                  //       child: Icon(Icons.done)),
                  // ],
                ),
              ),
              child: Icon(Icons.add),
            )));
  }
}
