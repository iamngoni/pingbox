//
//  pingbox
//  dismiss_keyboard.dart
//
//  Created by Ngonidzashe Mangudya on 1/22/25.
//  Copyright (c) 2025 Codecraft Solutions. All rights reserved.
//

import 'package:flutter/material.dart';

void dismissKeyboard(BuildContext context) {
  if (MediaQuery.of(context).viewInsets.bottom > 0) {
    FocusScope.of(context).requestFocus(FocusNode());
  }
}
