//
//  pingbox
//  date_picker_controller.dart
//
//  Created by Ngonidzashe Mangudya on 1/22/25.
//  Copyright (c) 2025 Codecraft Solutions. All rights reserved.
//

import 'package:flutter/material.dart';

class DatePickerController extends ValueNotifier<DateTime?> {
  DatePickerController([super.value]);

  DateTime? get date => value;

  set date(DateTime? date) {
    value = date;
  }

  void clear() {
    value = null;
  }
}
