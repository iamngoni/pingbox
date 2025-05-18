//
//  pingbox
//  pingbox_dropdown_button.dart
//
//  Created by Ngonidzashe Mangudya on 1/30/25.
//  Copyright (c) 2025 Codecraft Solutions. All rights reserved.
//

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:handy_extensions/handy_extensions.dart';
import 'package:relative_scale/relative_scale.dart';

import '../configs/colors.dart';

class PingboxDropdownButton<T> extends StatelessWidget {
  const PingboxDropdownButton({
    required this.hint,
    required this.items,
    required this.onChanged,
    this.value,
    this.validator,
    this.backgroundColor = PingboxColors.lightNavyBlue,
    this.borderRadius = 10,
    this.itemBuilder,
    super.key,
  });

  final T? value;
  final List<T> items;
  final String hint;
  final String? Function(T?)? validator;
  final void Function(T?) onChanged;
  final Color backgroundColor;
  final double borderRadius;
  final Widget Function(T)? itemBuilder;

  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(
      builder: (context, height, width, sy, sx) {
        return Container(
          width: context.width,
          padding: EdgeInsets.symmetric(
            horizontal: sx(20),
            vertical: sy(7),
          ),
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          child: DropdownButtonFormField<T>(
            isExpanded: true,
            value: value,
            style: TextStyle(
              color: PingboxColors.white,
              fontWeight: FontWeight.w400,
              fontSize: sy(9),
            ),
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: TextStyle(
                color: PingboxColors.white,
                fontWeight: FontWeight.w400,
                fontSize: sy(9),
              ),
              border: InputBorder.none,
            ),
            items: items.map((T item) {
              return DropdownMenuItem<T>(
                value: item,
                child: itemBuilder?.call(item) ??
                    Text(
                      item.toString(),
                      style: TextStyle(
                        color: PingboxColors.navyBlue,
                        fontWeight: FontWeight.w400,
                        fontSize: sy(9),
                      ),
                    ),
              );
            }).toList(),
            onChanged: onChanged,
            selectedItemBuilder: (BuildContext context) {
              return items.map<Widget>((T item) {
                return Text(
                  item.toString(),
                  style: TextStyle(
                    color: PingboxColors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: sy(9),
                  ),
                );
              }).toList();
            },
            icon: Icon(
              CupertinoIcons.chevron_down,
              color: PingboxColors.white,
              size: sy(12),
            ),
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: validator,
          ),
        );
      },
    );
  }
}
