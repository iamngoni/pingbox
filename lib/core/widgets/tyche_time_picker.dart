//
//  pingbox
//  pingbox_time_picker.dart
//
//  Created by Ngonidzashe Mangudya on 1/30/25.
//  Copyright (c) 2025 Codecraft Solutions. All rights reserved.
//

import 'package:flutter/material.dart';
import 'package:handy_extensions/handy_extensions.dart';
import 'package:relative_scale/relative_scale.dart';

import '../configs/colors.dart';
import 'time_picker_controller.dart';

class TycheTimePicker extends StatelessWidget {
  const TycheTimePicker({
    required this.hint,
    required this.controller,
    this.validator,
    super.key,
  });

  final String hint;
  final String? Function(TimeOfDay?)? validator;
  final TimePickerController controller;

  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(
      builder: (context, height, width, sy, sx) {
        return FormField<TimeOfDay>(
          initialValue: controller.value,
          validator: validator,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          builder: (FormFieldState<TimeOfDay> state) {
            return SizedBox(
              width: sx(150),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () async {
                      final TimeOfDay? timeOfDay = await showTimePicker(
                        context: context,
                        initialTime: controller.value ?? TimeOfDay.now(),
                        initialEntryMode: TimePickerEntryMode.input,
                      );
                      if (timeOfDay != null) {
                        controller.value = timeOfDay;
                        state.didChange(timeOfDay);
                      }
                    },
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: sx(10),
                              vertical: sy(13.5),
                            ),
                            decoration: BoxDecoration(
                              color: TycheColors.lightNavyBlue,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text(
                              controller.value != null
                                  ? controller.value!.hour
                                      .toString()
                                      .padLeft(2, '0')
                                  : '00',
                              style: TextStyle(
                                color: TycheColors.white,
                                fontWeight: FontWeight.w400,
                                fontSize: sy(9),
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: sx(10),
                        ),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: sx(10),
                              vertical: sy(13.5),
                            ),
                            decoration: BoxDecoration(
                              color: TycheColors.lightNavyBlue,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text(
                              controller.value != null
                                  ? controller.value!.minute
                                      .toString()
                                      .padLeft(2, '0')
                                  : '00',
                              style: TextStyle(
                                color: TycheColors.white,
                                fontWeight: FontWeight.w400,
                                fontSize: sy(9),
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  AnimatedSwitcher(
                    duration: 300.milliseconds,
                    child: state.hasError
                        ? Padding(
                            padding: EdgeInsets.only(
                              top: sy(5),
                            ),
                            child: Text(
                              state.errorText!,
                              style: TextStyle(
                                color: const Color(0xFFB00020),
                                fontWeight: FontWeight.w400,
                                fontSize: sy(7),
                              ),
                            ),
                          )
                        : const SizedBox.shrink(),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
