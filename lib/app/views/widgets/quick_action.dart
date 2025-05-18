//
//  pingbox
//  quick_action.dart
//
//  Created by Ngonidzashe Mangudya on 2025/05/18.
//  Copyright (c) 2025 Codecraft Solutions. All rights reserved.
//

import 'package:flutter/material.dart';
import 'package:relative_scale/relative_scale.dart';

import '../../../core/configs/colors.dart';

class QuickAction extends StatelessWidget {
  const QuickAction({
    required this.label,
    this.highlighted = false,
    super.key,
  });

  final String label;
  final bool highlighted;

  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(
      builder: (context, height, width, sy, sx) {
        return Container(
          padding: EdgeInsets.symmetric(
            vertical: sx(15),
            horizontal: sx(20),
          ),
          decoration: BoxDecoration(
            color: highlighted
                ? Colors.lightBlueAccent
                : PingboxColors.lightNavyBlue,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            label,
            style: TextStyle(
              color: highlighted ? Colors.black : Colors.white,
              fontWeight: FontWeight.w400,
              fontSize: sy(8),
            ),
          ),
        );
      },
    );
  }
}
