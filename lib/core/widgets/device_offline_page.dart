//
//  pingbox
//  device_offline_page.dart
//
//  Created by Ngonidzashe Mangudya on 1/22/25.
//  Copyright (c) 2025 Codecraft Solutions. All rights reserved.
//

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:relative_scale/relative_scale.dart';

import '../../l10n/l10n.dart';
import '../configs/colors.dart';
import '../state/connectivity_status/connectivity_status_bloc.dart';
import 'pingbox_button.dart';

class DeviceOfflinePage extends StatelessWidget {
  const DeviceOfflinePage({super.key});

  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(
      builder: (context, height, width, sy, sx) {
        return Scaffold(
          backgroundColor: PingboxColors.navyBlue,
          body: SafeArea(
            child: Container(
              height: height,
              width: width,
              padding: EdgeInsets.symmetric(
                horizontal: sx(20),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Platform.isAndroid
                        ? Icons.wifi_off_rounded
                        : CupertinoIcons.wifi_slash,
                    color: PingboxColors.white,
                    size: sy(30),
                  ),
                  SizedBox(
                    height: sy(20),
                  ),
                  Text(
                    context.l10n.offlineTitle,
                    style: TextStyle(
                      color: PingboxColors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: sy(12),
                    ),
                  ),
                  SizedBox(
                    height: sy(3),
                  ),
                  Text(
                    context.l10n.offlineDescription,
                    style: TextStyle(
                      color: PingboxColors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: sy(9),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: sy(20),
                  ),
                  PingboxButton(
                    text: context.l10n.offlineButtonText,
                    onTap: () {
                      context
                          .read<ConnectivityStatusBloc>()
                          .add(CheckConnection());
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
