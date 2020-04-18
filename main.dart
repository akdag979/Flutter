// Copyright 2020 Levent Akdag. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: "Listing Sample",
    home: Scaffold(
      appBar: AppBar(
        title: Text("Sample List"),
      ),
      body: getListView(),
    ),
  ));
}

/*List<String> getListElements() {
  var items = List<String>.generate(100, (itemno) => "item $itemno");
  return items;
}*/

Widget getListView() {
  // var listItems = getListElements(); // also possible
  var listItems = List<String>.generate(100, (itemno) => "item $itemno");
  var listView = ListView.builder(itemBuilder: (context, index) {
    return ListTile(
      leading: Icon(Icons.arrow_right),
      title: Text(listItems[index]),
      onTap: () {
        debugPrint('${listItems[index]} clicked');
      },
    );
  });
  return listView;
}
