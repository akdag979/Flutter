// Copyright 2020 Levent Akdag. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';

void main() {
  runApp(
    //First widget is called Text widget, and it is a string text with single style.
      Text(
        "Hello Flutter",
        textDirection: TextDirection.ltr,
        textAlign: TextAlign.center,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
               fontWeight: FontWeight.w300,
               fontStyle: FontStyle.italic,
        ),

      )
  );
}
