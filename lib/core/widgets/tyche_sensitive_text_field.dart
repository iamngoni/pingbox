//
//  pingbox
//  pingbox_sensitive_text_field.dart
//
//  Created by Ngonidzashe Mangudya on 1/22/25.
//  Copyright (c) 2025 Codecraft Solutions. All rights reserved.
//

import 'package:flutter/material.dart';
import 'package:relative_scale/relative_scale.dart';

import '../configs/colors.dart';

class TycheSensitiveTextField extends StatefulWidget {
  const TycheSensitiveTextField({
    required this.controller,
    required this.hint,
    this.readOnly = false,
    this.label,
    this.validator,
    this.keyboardType = TextInputType.text,
    super.key,
  });

  final TextEditingController controller;
  final String? label;
  final String hint;
  final String? Function(String?)? validator;
  final bool readOnly;
  final TextInputType keyboardType;

  @override
  State<TycheSensitiveTextField> createState() =>
      _TycheSensitiveTextFieldState();
}

class _TycheSensitiveTextFieldState extends State<TycheSensitiveTextField> {
  bool obscureText = true;

  void toggleObscureText() {
    setState(() {
      obscureText = !obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(
      builder: (context, height, width, sy, sx) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (widget.label != null)
              Text(
                widget.label!,
                style: TextStyle(
                  color: TycheColors.white,
                  fontWeight: FontWeight.w400,
                  fontSize: sy(10),
                ),
              ),
            if (widget.label != null)
              SizedBox(
                height: sy(5),
              ),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: sx(20),
                vertical: sy(7),
              ),
              decoration: BoxDecoration(
                color: TycheColors.lightNavyBlue,
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextFormField(
                controller: widget.controller,
                style: TextStyle(
                  color: TycheColors.white,
                  fontWeight: FontWeight.w400,
                  fontSize: sy(9),
                ),
                decoration: InputDecoration(
                  hintText: widget.hint,
                  hintStyle: TextStyle(
                    color: TycheColors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: sy(9),
                  ),
                  border: InputBorder.none,
                  suffixIcon: IconButton(
                    onPressed: toggleObscureText,
                    icon: Icon(
                      obscureText ? Icons.visibility : Icons.visibility_off,
                      color: TycheColors.white,
                    ),
                  ),
                  errorStyle: const TextStyle(
                    color: TycheColors.orange,
                  ),
                ),
                obscureText: widget.readOnly || obscureText,
                keyboardType: widget.keyboardType,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: widget.validator,
                readOnly: widget.readOnly,
              ),
            ),
          ],
        );
      },
    );
  }
}
