// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

import 'package:hive_flutter/hive_flutter.dart';

class MyHomepage extends StatefulWidget {
  const MyHomepage({Key? key}) : super(key: key);

  @override
  _MyHomepageState createState() => _MyHomepageState();
}

class _MyHomepageState extends State<MyHomepage> {
  late Box<String> friendsBox;
  final TextEditingController _idcontroller = TextEditingController();
  final TextEditingController _namecontroller = TextEditingController();
  @override
  void initState() {
    super.initState();
    friendsBox = Hive.box<String>('friends');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Homepage'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Center(
          //   child: TextButton(
          //       style: TextButton.styleFrom(
          //           primary: Colors.white, backgroundColor: Colors.red),
          //       onPressed: () {
          //         print(friendsBox.get("11"));
          //         print(friendsBox.getAt(2));
          //         print(friendsBox.getAt(3));
          //       },
          //       child: const Text("Show")),
          // ),
          Expanded(
            child: ValueListenableBuilder(
              valueListenable: friendsBox.listenable(),
              builder:
                  (BuildContext context, Box<String> friends, Widget? child) {
                return ListView.separated(
                  itemBuilder: (context, index) {
                    final key = friends.keys.toList()[index];
                    final value = friends.get(key);
                    return ListTile(
                      title: Text(
                        value.toString(),
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        key,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onTap: () {
                        // friendsBox.deleteAt(index);
                      },
                    );
                  },
                  separatorBuilder: (context, index) => const Divider(),
                  itemCount: friends.keys.toList().length,
                );
              },
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextButton(
                  style: TextButton.styleFrom(
                      primary: Colors.white, backgroundColor: Colors.green),
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return Dialog(
                            child: Container(
                              padding: const EdgeInsets.all(20),
                              height: 300,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  TextField(
                                    controller: _idcontroller,
                                    decoration: const InputDecoration(
                                      labelText: "ID",
                                    ),
                                  ),
                                  TextField(
                                    controller: _namecontroller,
                                    decoration: const InputDecoration(
                                      labelText: "Name",
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  TextButton(
                                    style: TextButton.styleFrom(
                                        primary: Colors.white,
                                        backgroundColor: Colors.blue),
                                    onPressed: () {
                                      final key = _idcontroller.text;
                                      final value = _namecontroller.text;
                                      friendsBox.put(key, value);
                                      Navigator.of(context).pop();
                                      _idcontroller.clear();
                                      _namecontroller.clear();
                                    },
                                    child: const Text("Submit"),
                                  ),
                                ],
                              ),
                            ),
                          );
                        });
                  },
                  child: const Text("Add New")),
              TextButton(
                  style: TextButton.styleFrom(
                      primary: Colors.white, backgroundColor: Colors.green),
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return Dialog(
                            child: Container(
                              padding: const EdgeInsets.all(20),
                              height: 300,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  TextField(
                                    controller: _idcontroller,
                                    decoration: const InputDecoration(
                                      labelText: "ID",
                                    ),
                                  ),
                                  TextField(
                                    controller: _namecontroller,
                                    decoration: const InputDecoration(
                                      labelText: "Name",
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  TextButton(
                                    style: TextButton.styleFrom(
                                        primary: Colors.white,
                                        backgroundColor: Colors.blue),
                                    onPressed: () {
                                      final key = _idcontroller.text;
                                      final value = _namecontroller.text;
                                      friendsBox.put(key, value);
                                      Navigator.of(context).pop();
                                      _idcontroller.clear();
                                      _namecontroller.clear();
                                    },
                                    child: const Text("Submit"),
                                  ),
                                ],
                              ),
                            ),
                          );
                        });
                  },
                  child: const Text("Update")),
              TextButton(
                  style: TextButton.styleFrom(
                      primary: Colors.white, backgroundColor: Colors.green),
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return Dialog(
                            child: Container(
                              padding: const EdgeInsets.all(20),
                              height: 300,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  TextField(
                                    controller: _idcontroller,
                                    decoration: const InputDecoration(
                                      labelText: "ID",
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  TextButton(
                                    style: TextButton.styleFrom(
                                        primary: Colors.white,
                                        backgroundColor: Colors.blue),
                                    onPressed: () {
                                      final key = _idcontroller.text;
                                      friendsBox.delete(key);
                                      Navigator.of(context).pop();
                                      _idcontroller.clear();
                                      _namecontroller.clear();
                                    },
                                    child: const Text("Submit"),
                                  ),
                                ],
                              ),
                            ),
                          );
                        });
                  },
                  child: const Text("Delete")),
            ],
          ),
          const SizedBox(
            height: 30,
          )
        ],
      ),
    );
  }
}
