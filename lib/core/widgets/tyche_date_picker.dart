//
//  pingbox
//  pingbox_date_picker.dart
//
//  Created by Ngonidzashe Mangudya on 1/22/25.
//  Copyright (c) 2025 Codecraft Solutions. All rights reserved.
//

import 'package:flutter/material.dart';
import 'package:handy_extensions/handy_extensions.dart';
import 'package:relative_scale/relative_scale.dart';

import '../configs/colors.dart';
import 'date_picker_controller.dart';

class TycheDatePicker extends StatelessWidget {
  const TycheDatePicker({
    required this.hint,
    required this.controller,
    required this.firstDate,
    required this.lastDate,
    this.validator,
    super.key,
  });

  final String hint;
  final String? Function(DateTime?)? validator;
  final DatePickerController controller;
  final DateTime firstDate;
  final DateTime lastDate;

  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(
      builder: (context, height, width, sy, sx) {
        return FormField<DateTime>(
          initialValue: controller.value,
          validator: validator,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          builder: (FormFieldState<DateTime> state) {
            return Container(
              padding: EdgeInsets.symmetric(
                horizontal: sx(20),
                vertical: sy(12),
              ),
              decoration: BoxDecoration(
                color: TycheColors.lightNavyBlue,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          controller.value != null
                              ? controller.value!.readableDate
                              : hint,
                          style: TextStyle(
                            color: TycheColors.white,
                            fontWeight: FontWeight.w400,
                            fontSize: sy(9),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: sx(10),
                      ),
                      InkWell(
                        onTap: () async {
                          final DateTime? date = await showDatePicker(
                            context: context,
                            initialEntryMode: DatePickerEntryMode.calendarOnly,
                            initialDate: controller.value ?? DateTime.now(),
                            firstDate: firstDate,
                            lastDate: lastDate,
                          );
                          if (date != null) {
                            controller.value = date;
                            state.didChange(date);
                          }
                        },
                        child: Icon(
                          Icons.calendar_month,
                          color: TycheColors.white,
                          size: sy(15),
                        ),
                      ),
                    ],
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
                                color: TycheColors.orange,
                                fontWeight: FontWeight.w400,
                                fontSize: sy(7.5),
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
