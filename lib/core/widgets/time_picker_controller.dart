//
//  pingbox
//  time_picker_controller.dart
//
//  Created by Ngonidzashe Mangudya on 1/30/25.
//  Copyright (c) 2025 Codecraft Solutions. All rights reserved.
//

import 'package:flutter/material.dart';

class TimePickerController extends ValueNotifier<TimeOfDay?> {
  TimePickerController() : super(TimeOfDay.now());

  TimeOfDay get timeOfDay => value!;

  set date(TimeOfDay timeOfDay) {
    value = timeOfDay;
  }

  void clear() {
    value = null;
  }
}
