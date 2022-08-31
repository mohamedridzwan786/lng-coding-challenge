import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:ui';
import 'package:lng/controllers/onPressController.dart';

class TaskView extends StatefulWidget {
  TaskView({Key? key}) : super(key: key);

  @override
  State<TaskView> createState() => _TaskViewState();
}

class _TaskViewState extends State<TaskView> {
  final pressController = Get.put(PressedState());

  Map<String, bool> numbers = {
    '75 Broadway ave, Queens, NYC, 11207\nNo recipient': false,
    '76 Broadway ave, Queens, NYC, 11207\nNo recipient': false,
    '77 Broadway ave, Queens, NYC, 11207\nNo recipient': false,
    '78 Broadway ave, Queens, NYC, 11207\nNo recipient': false,
    '79 Broadway ave, Queens, NYC, 11207\nNo recipient': false,
    '80 Broadway ave, Queens, NYC, 11207\nNo recipient': false,
    '81 Broadway ave, Queens, NYC, 11207\nNo recipient': false,
  };

  Map<String, bool> drivers = {
    'Driver 1': false,
    'Driver 2': false,
    'Driver 3': false,
    'Driver 4': false,
    'Driver 5': false,
    'Driver 6': false,
    'Driver 7': false,
  };

  var holder_1 = [];

  getItems() {
    numbers.forEach((key, value) {
      if (value == true) {
        holder_1.add(key);
      }
    });

    // Printing all selected items on Terminal screen.
    print(holder_1);
    // Here you will get all your selected Checkbox items.

    // Clear array after use.
    holder_1.clear();
  }

  final _scrollController = ScrollController();

  TextEditingController txtQuery = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Container(
        child: Column(
          children: [
            Container(
                alignment: Alignment.centerRight,
                height: 40,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade200),
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8.0),
                      bottomLeft: Radius.circular(8.0),
                      bottomRight: Radius.circular(8.0),
                      topRight: Radius.circular(8.0)),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.4),
                        offset: Offset(1.1, 1.1),
                        blurRadius: 9.0),
                  ],
                ),
                child: Column(
                  children: [
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(20, 10, 4, 0),
                              child: Icon(Icons.filter_alt_outlined,
                                  color: Colors.black, size: 20.0),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                              child: Text('Filter',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal)),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(64, 10, 0, 0),
                              child: Text(
                                '15/12/2021, Unassigned',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                ),
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                )),
            SizedBox(height: 10),
            Container(
              alignment: Alignment.centerRight,
              // height: 200,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black.withOpacity(0.2)),
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8.0),
                    bottomLeft: Radius.circular(8.0),
                    bottomRight: Radius.circular(8.0),
                    topRight: Radius.circular(8.0)),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      offset: Offset(1.1, 1.1),
                      blurRadius: 9.0),
                ],
              ),
              child: Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: ExpansionTile(
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Pick and Delivery",
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          "120 Tasks",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                    children: <Widget>[
                      // Divider(thickness: 1,),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                        child: ExpansionTile(
                          title: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Icon(Icons.adjust_outlined,
                                        size: 12, color: Colors.blue),
                                    SizedBox(width: 2),
                                    Text(
                                      "Water Bottle Settler",
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 11),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    SizedBox(width: 14),
                                    Text(
                                      "25 Tasks",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 10,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          children: <Widget>[
                            Container(
                              height: 400,
                              child: ListView(
                                children: numbers.keys.map((String key) {
                                  return new CheckboxListTile(
                                    controlAffinity:
                                        ListTileControlAffinity.leading,
                                    shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20.0))),
                                    title: new Text(key,
                                        style: TextStyle(fontSize: 11)),
                                    value: numbers[key],
                                    activeColor: Colors.greenAccent,
                                    checkColor: Colors.white,
                                    onChanged: (bool? value) {
                                      setState(() {
                                        numbers[key] = value!;
                                      });

                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return Expanded(
                                            child: AlertDialog(
                                              title: Text('Assign tasks',
                                                  style: TextStyle(
                                                      fontSize: 22,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                              content: Container(
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text('1. Overview',
                                                        style: TextStyle(
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold)),
                                                    Text(' 1. selected',
                                                        style: TextStyle(
                                                          fontSize: 12,
                                                        )),
                                                    Text('2. Assign driver',
                                                        style: TextStyle(
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold)),
                                                    SizedBox(height: 3),
                                                    Container(
                                                      padding: const EdgeInsets
                                                              .fromLTRB(
                                                          10, 10, 10, 0),
                                                      height: 400,
                                                      width: 250,
                                                      decoration: BoxDecoration(
                                                        border: Border.all(
                                                            color: Colors.black
                                                                .withOpacity(
                                                                    0.2)),
                                                        color: Colors.white,
                                                        borderRadius:
                                                            BorderRadius.only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        8.0),
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        8.0),
                                                                bottomRight: Radius
                                                                    .circular(
                                                                        8.0),
                                                                topRight: Radius
                                                                    .circular(
                                                                        8.0)),
                                                        boxShadow: <BoxShadow>[
                                                          BoxShadow(
                                                              color: Colors.grey
                                                                  .withOpacity(
                                                                      0.3),
                                                              offset: Offset(
                                                                  1.1, 1.1),
                                                              blurRadius: 9.0),
                                                        ],
                                                      ),
                                                      child: Column(
                                                        children: [
                                                          Container(
                                                            height: 60,
                                                            child:
                                                                TextFormField(
                                                              controller:
                                                                  txtQuery,
                                                              // onChanged: search,
                                                              decoration:
                                                                  InputDecoration(
                                                                hintText:
                                                                    "Search",
                                                                border: OutlineInputBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            4.0)),
                                                                focusedBorder: OutlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                            color:
                                                                                Colors.black)),
                                                                prefixIcon:
                                                                    Icon(Icons
                                                                        .search),
                                                                suffixIcon:
                                                                    IconButton(
                                                                  icon: Icon(Icons
                                                                      .clear),
                                                                  onPressed:
                                                                      () {
                                                                    // txtQuery.text = '';
                                                                    // search(txtQuery.text);
                                                                  },
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Container(
                                                            height: 300,
                                                            child: ListView(
                                                              children: drivers
                                                                  .keys
                                                                  .map((String
                                                                      key) {
                                                                return new CheckboxListTile(
                                                                  controlAffinity:
                                                                      ListTileControlAffinity
                                                                          .leading,
                                                                  title:
                                                                      new Text(
                                                                          key),
                                                                  value:
                                                                      drivers[
                                                                          key],
                                                                  activeColor:
                                                                      Colors
                                                                          .pink,
                                                                  checkColor:
                                                                      Colors
                                                                          .white,
                                                                  onChanged:
                                                                      (bool?
                                                                          value) {
                                                                    setState(
                                                                        () {
                                                                      drivers[key] =
                                                                          value!;
                                                                    });
                                                                  },
                                                                );
                                                              }).toList(),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                              actions: [
                                                SizedBox(
                                                  height: 50,
                                                  width: 150,
                                                  child: ElevatedButton(
                                                    child: Text('Assign task'),
                                                    onPressed: () {
                                                      pressController
                                                          .changeStatus();
                                                      Navigator.pop(context);
                                                    },
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                            primary: Colors
                                                                .cyanAccent,
                                                            onPrimary:
                                                                Colors.white,
                                                            // padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                                                            textStyle: TextStyle(
                                                                fontSize: 20,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold)),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      );
                                    },
                                  );
                                }).toList(),
                              ),
                            )
                            // Expanded(
                            //   child: Container(
                            //     child: ListView(
                            //       children: numbers.keys.map((String key) {
                            //         return new CheckboxListTile(
                            //           title: new Text(key),
                            //           value: numbers[key],
                            //           activeColor: Colors.pink,
                            //           checkColor: Colors.white,
                            //           onChanged: (bool? value) {
                            //             setState(() {
                            //               numbers[key] = value!;
                            //             });
                            //           },
                            //         );
                            //       }).toList(),
                            //     ),
                            //   ),
                            // ),
                          ],
                          backgroundColor: Colors.white,
                        ),
                      ),

                      //=============second=========

                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                        child: ExpansionTile(
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.adjust_outlined,
                                      size: 12, color: Colors.red),
                                  SizedBox(width: 2),
                                  Text(
                                    "Water Bottle Settler",
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 11),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  SizedBox(width: 14),
                                  Text(
                                    "25 Tasks",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 10,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          children: <Widget>[
                            Container(
                              height: 400,
                              child: ListView(
                                children: numbers.keys.map((String key) {
                                  return new CheckboxListTile(
                                    controlAffinity:
                                        ListTileControlAffinity.leading,
                                    shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20.0))),
                                    title: new Text(key,
                                        style: TextStyle(fontSize: 11)),
                                    value: numbers[key],
                                    activeColor: Colors.greenAccent,
                                    checkColor: Colors.white,
                                    onChanged: (bool? value) {
                                      setState(() {
                                        numbers[key] = value!;
                                      });
                                    },
                                  );
                                }).toList(),
                              ),
                            )
                            // Expanded(
                            //   child: Container(
                            //     child: ListView(
                            //       children: numbers.keys.map((String key) {
                            //         return new CheckboxListTile(
                            //           title: new Text(key),
                            //           value: numbers[key],
                            //           activeColor: Colors.pink,
                            //           checkColor: Colors.white,
                            //           onChanged: (bool? value) {
                            //             setState(() {
                            //               numbers[key] = value!;
                            //             });
                            //           },
                            //         );
                            //       }).toList(),
                            //     ),
                            //   ),
                            // ),
                          ],
                          backgroundColor: Colors.white,
                        ),
                      ),

                      //=================third==========

                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                        child: ExpansionTile(
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.adjust_outlined,
                                      size: 12, color: Colors.green),
                                  SizedBox(width: 2),
                                  Text(
                                    "Water Bottle Settler",
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 11),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  SizedBox(width: 14),
                                  Text(
                                    "25 Tasks",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 10,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          children: <Widget>[
                            Container(
                              height: 400,
                              child: ListView(
                                children: numbers.keys.map((String key) {
                                  return new CheckboxListTile(
                                    controlAffinity:
                                        ListTileControlAffinity.leading,
                                    shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20.0))),
                                    title: new Text(key,
                                        style: TextStyle(fontSize: 11)),
                                    value: numbers[key],
                                    activeColor: Colors.greenAccent,
                                    checkColor: Colors.white,
                                    onChanged: (bool? value) {
                                      setState(() {
                                        numbers[key] = value!;
                                      });
                                    },
                                  );
                                }).toList(),
                              ),
                            )
                            // Expanded(
                            //   child: Container(
                            //     child: ListView(
                            //       children: numbers.keys.map((String key) {
                            //         return new CheckboxListTile(
                            //           title: new Text(key),
                            //           value: numbers[key],
                            //           activeColor: Colors.pink,
                            //           checkColor: Colors.white,
                            //           onChanged: (bool? value) {
                            //             setState(() {
                            //               numbers[key] = value!;
                            //             });
                            //           },
                            //         );
                            //       }).toList(),
                            //     ),
                            //   ),
                            // ),
                          ],
                          backgroundColor: Colors.white,
                        ),
                      ),
                    ],
                    backgroundColor: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              alignment: Alignment.centerRight,
              // height: 200,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black.withOpacity(0.2)),
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8.0),
                    bottomLeft: Radius.circular(8.0),
                    bottomRight: Radius.circular(8.0),
                    topRight: Radius.circular(8.0)),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      offset: Offset(1.1, 1.1),
                      blurRadius: 9.0),
                ],
              ),
              child: Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: ExpansionTile(
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Pick and Delivery",
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          "120 Tasks",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                    children: <Widget>[
                      // Divider(thickness: 1,),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                        child: ExpansionTile(
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Water Bottle Settler",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 11),
                              ),
                              Text(
                                "25 Tasks",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 10,
                                ),
                              ),
                            ],
                          ),
                          children: <Widget>[
                            Container(
                              height: 400,
                              child: ListView(
                                children: numbers.keys.map((String key) {
                                  return new CheckboxListTile(
                                    controlAffinity:
                                        ListTileControlAffinity.leading,
                                    shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20.0))),
                                    title: new Text(key,
                                        style: TextStyle(fontSize: 11)),
                                    value: numbers[key],
                                    activeColor: Colors.greenAccent,
                                    checkColor: Colors.white,
                                    onChanged: (bool? value) {
                                      setState(() {
                                        numbers[key] = value!;
                                      });
                                    },
                                  );
                                }).toList(),
                              ),
                            )
                            // Expanded(
                            //   child: Container(
                            //     child: ListView(
                            //       children: numbers.keys.map((String key) {
                            //         return new CheckboxListTile(
                            //           title: new Text(key),
                            //           value: numbers[key],
                            //           activeColor: Colors.pink,
                            //           checkColor: Colors.white,
                            //           onChanged: (bool? value) {
                            //             setState(() {
                            //               numbers[key] = value!;
                            //             });
                            //           },
                            //         );
                            //       }).toList(),
                            //     ),
                            //   ),
                            // ),
                          ],
                          backgroundColor: Colors.white,
                        ),
                      ),

                      //=============second=========

                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                        child: ExpansionTile(
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Water Bottle Settler",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 11),
                              ),
                              Text(
                                "25 Tasks",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 10,
                                ),
                              ),
                            ],
                          ),
                          children: <Widget>[
                            Container(
                              height: 400,
                              child: ListView(
                                children: numbers.keys.map((String key) {
                                  return new CheckboxListTile(
                                    controlAffinity:
                                        ListTileControlAffinity.leading,
                                    shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20.0))),
                                    title: new Text(key,
                                        style: TextStyle(fontSize: 11)),
                                    value: numbers[key],
                                    activeColor: Colors.greenAccent,
                                    checkColor: Colors.white,
                                    onChanged: (bool? value) {
                                      setState(() {
                                        numbers[key] = value!;
                                      });
                                    },
                                  );
                                }).toList(),
                              ),
                            )
                            // Expanded(
                            //   child: Container(
                            //     child: ListView(
                            //       children: numbers.keys.map((String key) {
                            //         return new CheckboxListTile(
                            //           title: new Text(key),
                            //           value: numbers[key],
                            //           activeColor: Colors.pink,
                            //           checkColor: Colors.white,
                            //           onChanged: (bool? value) {
                            //             setState(() {
                            //               numbers[key] = value!;
                            //             });
                            //           },
                            //         );
                            //       }).toList(),
                            //     ),
                            //   ),
                            // ),
                          ],
                          backgroundColor: Colors.white,
                        ),
                      ),

                      //=================third==========

                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                        child: ExpansionTile(
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Water Bottle Settler",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 11),
                              ),
                              Text(
                                "25 Tasks",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 10,
                                ),
                              ),
                            ],
                          ),
                          children: <Widget>[
                            Container(
                              height: 400,
                              child: ListView(
                                children: numbers.keys.map((String key) {
                                  return new CheckboxListTile(
                                    controlAffinity:
                                        ListTileControlAffinity.leading,
                                    shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20.0))),
                                    title: new Text(key,
                                        style: TextStyle(fontSize: 11)),
                                    value: numbers[key],
                                    activeColor: Colors.greenAccent,
                                    checkColor: Colors.white,
                                    onChanged: (bool? value) {
                                      setState(() {
                                        numbers[key] = value!;
                                      });
                                    },
                                  );
                                }).toList(),
                              ),
                            )
                            // Expanded(
                            //   child: Container(
                            //     child: ListView(
                            //       children: numbers.keys.map((String key) {
                            //         return new CheckboxListTile(
                            //           title: new Text(key),
                            //           value: numbers[key],
                            //           activeColor: Colors.pink,
                            //           checkColor: Colors.white,
                            //           onChanged: (bool? value) {
                            //             setState(() {
                            //               numbers[key] = value!;
                            //             });
                            //           },
                            //         );
                            //       }).toList(),
                            //     ),
                            //   ),
                            // ),
                          ],
                          backgroundColor: Colors.white,
                        ),
                      ),
                    ],
                    backgroundColor: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            //==========================================================================================
            Container(
              alignment: Alignment.centerRight,
              // height: 200,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black.withOpacity(0.2)),
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8.0),
                    bottomLeft: Radius.circular(8.0),
                    bottomRight: Radius.circular(8.0),
                    topRight: Radius.circular(8.0)),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      offset: Offset(1.1, 1.1),
                      blurRadius: 9.0),
                ],
              ),
              child: Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: ExpansionTile(
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Pick and Delivery",
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          "120 Tasks",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                    children: <Widget>[
                      // Divider(thickness: 1,),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                        child: ExpansionTile(
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Water Bottle Settler",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 11),
                              ),
                              Text(
                                "25 Tasks",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 10,
                                ),
                              ),
                            ],
                          ),
                          children: <Widget>[
                            Container(
                              height: 400,
                              child: ListView(
                                children: numbers.keys.map((String key) {
                                  return new CheckboxListTile(
                                    controlAffinity:
                                        ListTileControlAffinity.leading,
                                    shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20.0))),
                                    title: new Text(key,
                                        style: TextStyle(fontSize: 11)),
                                    value: numbers[key],
                                    activeColor: Colors.greenAccent,
                                    checkColor: Colors.white,
                                    onChanged: (bool? value) {
                                      setState(() {
                                        numbers[key] = value!;
                                      });
                                    },
                                  );
                                }).toList(),
                              ),
                            )
                            // Expanded(
                            //   child: Container(
                            //     child: ListView(
                            //       children: numbers.keys.map((String key) {
                            //         return new CheckboxListTile(
                            //           title: new Text(key),
                            //           value: numbers[key],
                            //           activeColor: Colors.pink,
                            //           checkColor: Colors.white,
                            //           onChanged: (bool? value) {
                            //             setState(() {
                            //               numbers[key] = value!;
                            //             });
                            //           },
                            //         );
                            //       }).toList(),
                            //     ),
                            //   ),
                            // ),
                          ],
                          backgroundColor: Colors.white,
                        ),
                      ),

                      //=============second=========

                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                        child: ExpansionTile(
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Water Bottle Settler",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 11),
                              ),
                              Text(
                                "25 Tasks",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 10,
                                ),
                              ),
                            ],
                          ),
                          children: <Widget>[
                            Container(
                              height: 400,
                              child: ListView(
                                children: numbers.keys.map((String key) {
                                  return new CheckboxListTile(
                                    controlAffinity:
                                        ListTileControlAffinity.leading,
                                    shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20.0))),
                                    title: new Text(key,
                                        style: TextStyle(fontSize: 11)),
                                    value: numbers[key],
                                    activeColor: Colors.greenAccent,
                                    checkColor: Colors.white,
                                    onChanged: (bool? value) {
                                      setState(() {
                                        numbers[key] = value!;
                                      });
                                    },
                                  );
                                }).toList(),
                              ),
                            )
                            // Expanded(
                            //   child: Container(
                            //     child: ListView(
                            //       children: numbers.keys.map((String key) {
                            //         return new CheckboxListTile(
                            //           title: new Text(key),
                            //           value: numbers[key],
                            //           activeColor: Colors.pink,
                            //           checkColor: Colors.white,
                            //           onChanged: (bool? value) {
                            //             setState(() {
                            //               numbers[key] = value!;
                            //             });
                            //           },
                            //         );
                            //       }).toList(),
                            //     ),
                            //   ),
                            // ),
                          ],
                          backgroundColor: Colors.white,
                        ),
                      ),

                      //=================third==========

                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                        child: ExpansionTile(
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Water Bottle Settler",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 11),
                              ),
                              Text(
                                "25 Tasks",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 10,
                                ),
                              ),
                            ],
                          ),
                          children: <Widget>[
                            Container(
                              height: 400,
                              child: ListView(
                                children: numbers.keys.map((String key) {
                                  return new CheckboxListTile(
                                    controlAffinity:
                                        ListTileControlAffinity.leading,
                                    shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20.0))),
                                    title: new Text(key,
                                        style: TextStyle(fontSize: 11)),
                                    value: numbers[key],
                                    activeColor: Colors.greenAccent,
                                    checkColor: Colors.white,
                                    onChanged: (bool? value) {
                                      setState(() {
                                        numbers[key] = value!;
                                      });
                                    },
                                  );
                                }).toList(),
                              ),
                            )
                            // Expanded(
                            //   child: Container(
                            //     child: ListView(
                            //       children: numbers.keys.map((String key) {
                            //         return new CheckboxListTile(
                            //           title: new Text(key),
                            //           value: numbers[key],
                            //           activeColor: Colors.pink,
                            //           checkColor: Colors.white,
                            //           onChanged: (bool? value) {
                            //             setState(() {
                            //               numbers[key] = value!;
                            //             });
                            //           },
                            //         );
                            //       }).toList(),
                            //     ),
                            //   ),
                            // ),
                          ],
                          backgroundColor: Colors.white,
                        ),
                      ),
                    ],
                    backgroundColor: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            //=================================================================================================
            Container(
              alignment: Alignment.centerRight,
              // height: 200,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black.withOpacity(0.2)),
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8.0),
                    bottomLeft: Radius.circular(8.0),
                    bottomRight: Radius.circular(8.0),
                    topRight: Radius.circular(8.0)),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      offset: Offset(1.1, 1.1),
                      blurRadius: 9.0),
                ],
              ),
              child: Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: ExpansionTile(
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Pick and Delivery",
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          "120 Tasks",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                    children: <Widget>[
                      // Divider(thickness: 1,),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                        child: ExpansionTile(
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Water Bottle Settler",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 11),
                              ),
                              Text(
                                "25 Tasks",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 10,
                                ),
                              ),
                            ],
                          ),
                          children: <Widget>[
                            Container(
                              height: 400,
                              child: ListView(
                                children: numbers.keys.map((String key) {
                                  return new CheckboxListTile(
                                    controlAffinity:
                                        ListTileControlAffinity.leading,
                                    shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20.0))),
                                    title: new Text(key,
                                        style: TextStyle(fontSize: 11)),
                                    value: numbers[key],
                                    activeColor: Colors.greenAccent,
                                    checkColor: Colors.white,
                                    onChanged: (bool? value) {
                                      setState(() {
                                        numbers[key] = value!;
                                      });
                                    },
                                  );
                                }).toList(),
                              ),
                            )
                            // Expanded(
                            //   child: Container(
                            //     child: ListView(
                            //       children: numbers.keys.map((String key) {
                            //         return new CheckboxListTile(
                            //           title: new Text(key),
                            //           value: numbers[key],
                            //           activeColor: Colors.pink,
                            //           checkColor: Colors.white,
                            //           onChanged: (bool? value) {
                            //             setState(() {
                            //               numbers[key] = value!;
                            //             });
                            //           },
                            //         );
                            //       }).toList(),
                            //     ),
                            //   ),
                            // ),
                          ],
                          backgroundColor: Colors.white,
                        ),
                      ),

                      //=============second=========

                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                        child: ExpansionTile(
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Water Bottle Settler",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 11),
                              ),
                              Text(
                                "25 Tasks",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 10,
                                ),
                              ),
                            ],
                          ),
                          children: <Widget>[
                            Container(
                              height: 400,
                              child: ListView(
                                children: numbers.keys.map((String key) {
                                  return new CheckboxListTile(
                                    controlAffinity:
                                        ListTileControlAffinity.leading,
                                    shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20.0))),
                                    title: new Text(key,
                                        style: TextStyle(fontSize: 11)),
                                    value: numbers[key],
                                    activeColor: Colors.greenAccent,
                                    checkColor: Colors.white,
                                    onChanged: (bool? value) {
                                      setState(() {
                                        numbers[key] = value!;
                                      });
                                    },
                                  );
                                }).toList(),
                              ),
                            )
                            // Expanded(
                            //   child: Container(
                            //     child: ListView(
                            //       children: numbers.keys.map((String key) {
                            //         return new CheckboxListTile(
                            //           title: new Text(key),
                            //           value: numbers[key],
                            //           activeColor: Colors.pink,
                            //           checkColor: Colors.white,
                            //           onChanged: (bool? value) {
                            //             setState(() {
                            //               numbers[key] = value!;
                            //             });
                            //           },
                            //         );
                            //       }).toList(),
                            //     ),
                            //   ),
                            // ),
                          ],
                          backgroundColor: Colors.white,
                        ),
                      ),

                      //=================third==========

                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                        child: ExpansionTile(
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Water Bottle Settler",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 11),
                              ),
                              Text(
                                "25 Tasks",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 10,
                                ),
                              ),
                            ],
                          ),
                          children: <Widget>[
                            Container(
                              height: 400,
                              child: ListView(
                                children: numbers.keys.map((String key) {
                                  return new CheckboxListTile(
                                    controlAffinity:
                                        ListTileControlAffinity.leading,
                                    shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20.0))),
                                    title: new Text(key,
                                        style: TextStyle(fontSize: 11)),
                                    value: numbers[key],
                                    activeColor: Colors.greenAccent,
                                    checkColor: Colors.white,
                                    onChanged: (bool? value) {
                                      setState(() {
                                        numbers[key] = value!;
                                      });
                                    },
                                  );
                                }).toList(),
                              ),
                            )
                            // Expanded(
                            //   child: Container(
                            //     child: ListView(
                            //       children: numbers.keys.map((String key) {
                            //         return new CheckboxListTile(
                            //           title: new Text(key),
                            //           value: numbers[key],
                            //           activeColor: Colors.pink,
                            //           checkColor: Colors.white,
                            //           onChanged: (bool? value) {
                            //             setState(() {
                            //               numbers[key] = value!;
                            //             });
                            //           },
                            //         );
                            //       }).toList(),
                            //     ),
                            //   ),
                            // ),
                          ],
                          backgroundColor: Colors.white,
                        ),
                      ),
                    ],
                    backgroundColor: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
