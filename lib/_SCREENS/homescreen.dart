// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_interpolation_to_compose_strings

//import 'package:contact_app/_UTILS/const.dart';
import 'package:contact_app/_UTILS/add.dart';
import 'package:flutter/material.dart';
import '../_UTILS/const.dart';
import '../_UTILS/data.dart';
import 'form.dart';
import 'detailscreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController namecontroller = TextEditingController();
  TextEditingController phonecontroller = TextEditingController();
  TextEditingController surnamecontroller = TextEditingController();

  //ADD FUNCTION
  addcontact() {
    setState(() {});
    Navigator.pop(context, 'OK');
    Data.contact.add({
      'name': namecontroller.text + " " + surnamecontroller.text,
      'phone': phonecontroller.text
    });
    namecontroller.clear();
    phonecontroller.clear();
    surnamecontroller.clear();
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
              actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search))],
            ),
            body: ListView.builder(
              itemCount: Data.contact.length,
              itemBuilder: (context, idx) {
                return ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                DetailScreen(data: Data.contact[idx]),
                          ));
                    },
                    leading: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.grey.shade300),
                      child: Center(
                        child: Text(
                            style: TextStyle(fontSize: 16),
                            Data.contact[idx]['name']
                                .toString()[0]
                                .toUpperCase()),
                      ),
                    ),
                    title: Text(
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                        Data.contact[idx]['name'].toString()),
                    subtitle: Text(
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.normal),
                        Data.contact[idx]['phone'].toString()),
                    trailing: PopupMenuButton(
                        icon: Icon(Icons.more_vert),
                        onSelected: (value) {
                          if (value == 1) {
                            makePhoneCall(
                                Data.contact[idx]['phone'].toString());
                            ontabrecenthistory(
                                idx,
                                Data.contact[idx]['name'].toString(),
                                Data.contact[idx]['phone'].toString());
                          }
                          if (value == 2) {
                            makeSms(Data.contact[idx]['phone'].toString());
                          }
                          if (value == 3) {
                            addtofavorite(
                                idx,
                                Data.contact[idx]['name'].toString(),
                                Data.contact[idx]['phone'].toString());
                          }
                          if (value == 4) {
                            setState(() {});
                            Data.contact.removeAt(idx);
                          }
                        },
                        itemBuilder: (context) => [
                              PopupMenuItem(
                                value: 1,
                                child: Text('Call'),
                              ),
                              PopupMenuItem(
                                value: 2,
                                child: Text('Sms'),
                              ),
                              PopupMenuItem(
                                value: 3,
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text('Add to '),
                                    Icon(color: Colors.red, Icons.favorite)
                                  ],
                                ),
                              ),
                              PopupMenuItem(
                                value: 4,
                                child: Text('Delete'),
                              ),
                            ]));
              },
            ),

            //FLOATING ACTION BUTTON
            floatingActionButton: FloatingActionButton(
              elevation: 0,
              backgroundColor: Colors.grey.shade800,
              onPressed: () => showDialog<String>(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                  scrollable: true,
                  titlePadding: EdgeInsets.all(0),
                  contentPadding:
                      EdgeInsets.only(bottom: 150, left: 20, right: 20),
                  title: AppBar(
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    foregroundColor: Colors.black,
                    title: Text('Create New Contact'),
                  ),
                  content: myform(
                      mysurnamecontroller: surnamecontroller,
                      mynamecontroller: namecontroller,
                      myphonecontroller: phonecontroller),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () => Navigator.pop(context, 'Cancel'),
                      child: Icon(Icons.close),
                    ),
                    TextButton(
                        onPressed: () {
                          addcontact();
                        },
                        child: Icon(Icons.done)),
                  ],
                ),
              ),
              child: Icon(Icons.add),
            )));
  }
}
