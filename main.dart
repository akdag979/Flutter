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
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          debugPrint("FloaActionButton Cicked");
        },
        child: Icon(Icons.add),
        tooltip: 'Add more item',
      ),
    ),
  ));
}

void showSnackBar(BuildContext context, String item){
  var snackBar = SnackBar(
    content: Text("You just clicked $item."),
    action: SnackBarAction(
      label: "UNDO",
      onPressed: (){
        debugPrint('permorming dummy ANY Operation');
      },
    ),
  );
  Scaffold.of(context).showSnackBar(snackBar);
}
/*List<String> getListElements() {
  var items = List<String>.generate(100, (contactid) => "Contact $contactid");
  return items;
}*/

Widget getListView() {
  // var listItems = getListElements(); // also possible
  var listItems = List<String>.generate(100, (contactid) => "Contact $contactid");
  var listView = ListView.builder(itemBuilder: (context, index) {
    return ListTile(
      leading: Icon(Icons.arrow_right),
      title: Text(listItems[index]),
      onTap: () {
        debugPrint('You just clicked ${listItems[index]}.');
        showSnackBar(context, listItems[index]);
      },
    );
  });
  return listView;
}
