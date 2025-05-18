//
//  pingbox
//  pingbox_text_field.dart
//
//  Created by Ngonidzashe Mangudya on 1/21/25.
//  Copyright (c) 2025 Codecraft Solutions. All rights reserved.
//

import 'package:flutter/material.dart';
import 'package:relative_scale/relative_scale.dart';

import '../configs/colors.dart';

class PingboxTextField extends StatefulWidget {
  const PingboxTextField({
    required this.controller,
    required this.hint,
    this.label,
    this.validator,
    this.keyboardType = TextInputType.text,
    this.readOnly = false,
    this.maxLines = 1,
    this.backgroundColor = PingboxColors.lightNavyBlue,
    this.borderColor,
    this.borderRadius = 10,
    this.scrollController,
    this.obscureText = false,
    super.key,
  });

  final TextEditingController controller;
  final String? label;
  final String hint;
  final String? Function(String?)? validator;
  final TextInputType keyboardType;
  final bool readOnly;
  final int maxLines;
  final Color backgroundColor;
  final Color? borderColor;
  final double borderRadius;
  final ScrollController? scrollController;
  final bool obscureText;

  @override
  State<PingboxTextField> createState() => _PingboxTextFieldState();
}

class _PingboxTextFieldState extends State<PingboxTextField> {
  late bool _obscureText;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscureText;
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
                  color: PingboxColors.white,
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
                color: widget.backgroundColor,
                borderRadius: BorderRadius.circular(widget.borderRadius),
              ),
              child: widget.scrollController == null
                  ? TextFormField(
                      style: TextStyle(
                        color: PingboxColors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: sy(9),
                      ),
                      controller: widget.controller,
                      obscureText: _obscureText,
                      decoration: InputDecoration(
                        hintText: widget.hint,
                        hintStyle: TextStyle(
                          color: PingboxColors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: sy(9),
                        ),
                        border: InputBorder.none,
                        errorStyle: const TextStyle(
                          color: PingboxColors.orange,
                        ),
                        suffixIcon: widget.obscureText
                            ? IconButton(
                                icon: Icon(
                                  _obscureText
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  color: PingboxColors.white,
                                  size: sy(12),
                                ),
                                onPressed: () {
                                  setState(() {
                                    _obscureText = !_obscureText;
                                  });
                                },
                              )
                            : null,
                      ),
                      keyboardType: widget.keyboardType,
                      readOnly: widget.readOnly,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: widget.validator,
                      maxLines: widget.maxLines,
                    )
                  : Scrollbar(
                      controller: widget.scrollController,
                      child: TextFormField(
                        style: TextStyle(
                          color: PingboxColors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: sy(9),
                        ),
                        controller: widget.controller,
                        obscureText: _obscureText,
                        decoration: InputDecoration(
                          hintText: widget.hint,
                          hintStyle: TextStyle(
                            color: PingboxColors.white,
                            fontWeight: FontWeight.w400,
                            fontSize: sy(9),
                          ),
                          border: InputBorder.none,
                          suffixIcon: widget.obscureText
                              ? IconButton(
                                  icon: Icon(
                                    _obscureText
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                    color: PingboxColors.white,
                                    size: sy(12),
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _obscureText = !_obscureText;
                                    });
                                  },
                                )
                              : null,
                        ),
                        keyboardType: widget.keyboardType,
                        readOnly: widget.readOnly,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: widget.validator,
                        maxLines: widget.maxLines,
                      ),
                    ),
            ),
          ],
        );
      },
    );
  }
}
