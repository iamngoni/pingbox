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

import '../configs/colors.dart';
import '../state/connectivity_status/connectivity_status_bloc.dart';
import 'tyche_button.dart';

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
                    color: Colors.white,
                    size: sy(30),
                  ),
                  SizedBox(
                    height: sy(20),
                  ),
                  Text(
                    'Device Offline',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: sy(12),
                    ),
                  ),
                  SizedBox(
                    height: sy(3),
                  ),
                  Text(
                    'Your device is currently offline and not connected to the '
                    'internet. Please check your connection.',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: sy(9),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: sy(20),
                  ),
                  TycheButton(
                    text: 'All Better Now?',
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
