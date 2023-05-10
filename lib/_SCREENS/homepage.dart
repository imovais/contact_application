// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

import '../_UTILS/data.dart';
import 'form.dart';

class HoomePage extends StatefulWidget {
  const HoomePage({super.key});

  @override
  State<HoomePage> createState() => _HoomePageState();
}

class _HoomePageState extends State<HoomePage> {
  var namecontroller = TextEditingController();
  var phonecontroller = TextEditingController();
  var surnamecontroller = TextEditingController();

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
        body: Data.contact.isEmpty
            ? Center(child: Text('EMPTY'))
            : ListView.builder(
                itemCount: Data.contact.length,
                itemBuilder: (context, idx) {
                  return Card(
                    child: ListTile(
                      title: Text(Data.contact[idx]['name']),
                      subtitle: Text(Data.contact[idx]['phone']),
                      trailing: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // U P D A T E
                          IconButton(
                              onPressed: () => showDialog<String>(
                                    context: context,
                                    builder: (BuildContext context) =>
                                        AlertDialog(
                                      title: const Text('U P D A T E'),
                                      content: myform(
                                          mysurnamecontroller: surnamecontroller,
                                          mynamecontroller: namecontroller,
                                          myphonecontroller: phonecontroller),
                                      actions: <Widget>[
                                        TextButton(
                                          onPressed: () =>
                                              Navigator.pop(context, 'Cancel'),
                                          child: const Text('Cancel'),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            setState(() {});
                                            Navigator.pop(context, 'OK');
                                            Data.contact[idx]['name'] =
                                                namecontroller.text;
                                            Data.contact[idx]['phone'] =
                                                phonecontroller.text;
                                          },
                                          child: const Text('OK'),
                                        ),
                                      ],
                                    ),
                                  ),
                              icon: Icon(Icons.edit)),

                          // D E L E T E
                          IconButton(
                              onPressed: () {
                                setState(() {});
                                Data.contact.removeAt(idx);
                              },
                              icon: Icon(Icons.delete)),
                        ],
                      ),
                    ),
                  );
                },
              ),

        //FLOATING ACTION BUTTON
        //floatingActionButton: AddButton(),
        floatingActionButton: FloatingActionButton(
          onPressed: () => showDialog<String>(
            context: context,
            builder: (BuildContext context) => AlertDialog(
              title: const Text('AlertDialog Title'),
              content: myform(
                mysurnamecontroller: namecontroller,
                  mynamecontroller: namecontroller,
                  myphonecontroller: phonecontroller),
              actions: <Widget>[
                TextButton(
                  onPressed: () => Navigator.pop(context, 'Cancel'),
                  child: const Text('Cancel'),
                ),
                TextButton(
                  onPressed: () {
                    addcontact();
                  },
                  child: const Text('OK'),
                ),
              ],
            ),
          ),
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
