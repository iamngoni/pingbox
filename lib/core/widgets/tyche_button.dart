//
//  pingbox
//  pingbox_button.dart
//
//  Created by Ngonidzashe Mangudya on 1/22/25.
//  Copyright (c) 2025 Codecraft Solutions. All rights reserved.
//

import 'package:flutter/material.dart';
import 'package:relative_scale/relative_scale.dart';

import '../configs/colors.dart';

class TycheButton extends StatelessWidget {
  const TycheButton({
    required this.text,
    this.onTap,
    this.color = TycheColors.navyBlue,
    this.backgroundColor = TycheColors.lightBlue,
    this.borderRadius = 30,
    this.verticalPadding = 10,
    this.loading = false,
    super.key,
  });

  final String text;
  final VoidCallback? onTap;
  final Color color;
  final Color? backgroundColor;
  final double borderRadius;
  final double verticalPadding;
  final bool loading;

  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(
      builder: (context, height, width, sy, sx) {
        return GestureDetector(
          onTap: loading ? null : onTap,
          child: Container(
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(
              horizontal: sx(20),
              vertical: sy(verticalPadding),
            ),
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(borderRadius),
            ),
            child: loading
                ? SizedBox(
                    height: sy(10),
                    width: sy(10),
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      valueColor: AlwaysStoppedAnimation<Color>(color),
                    ),
                  )
                : Text(
                    text,
                    style: TextStyle(
                      color: color,
                      fontWeight: FontWeight.w600,
                      fontSize: sy(10),
                    ),
                  ),
          ),
        );
      },
    );
  }
}
