//
//  pingbox
//  loader_widget.dart
//
//  Created by Ngonidzashe Mangudya on 1/22/25.
//  Copyright (c) 2025 Codecraft Solutions. All rights reserved.
//

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:relative_scale/relative_scale.dart';

import '../configs/colors.dart';

class LoaderWidget extends StatelessWidget {
  const LoaderWidget({
    this.color = PingboxColors.white,
    super.key,
  });

  final Color color;

  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(
      builder: (context, height, width, sy, sx) {
        return Platform.isAndroid
            ? SizedBox(
                height: sy(15),
                width: sy(15),
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(
                    color,
                  ),
                ),
              )
            : CupertinoActivityIndicator(
                radius: sy(8),
                color: color,
              );
      },
    );
  }
}
