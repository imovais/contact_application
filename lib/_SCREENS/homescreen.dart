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
              itemCount: Data.contact.length,
              itemBuilder: (context, idx) {
                return ListTile(
                    onTap: () {
                      ontabrecenthistory(
                          idx,
                          Data.contact[idx]['name'].toString(),
                          Data.contact[idx]['phone'].toString());
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
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                            onPressed: () => makePhoneCall(
                                Data.contact[idx]['phone'].toString()),
                            icon: Icon(color: Colors.green, Icons.call)),
                        IconButton(
                            onPressed: () =>
                                makeSms(Data.contact[idx]['phone'].toString()),
                            icon:
                                Icon(color: Colors.yellow.shade800, Icons.sms)),
                      ],
                    ));
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
