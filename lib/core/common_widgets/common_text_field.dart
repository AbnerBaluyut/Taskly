import 'package:flutter/material.dart';
import 'package:taskly/core/common_widgets/common_shake_widget.dart';
import 'package:taskly/core/extensions/context_extension.dart';
import 'package:taskly/core/extensions/int_extension.dart';

import '../styles/custom_colors.dart';

class CommonTextField extends StatefulWidget {

  final TextEditingController? controller;
  final String? helperText;
  final String? hintText;
  final TextInputType keyboardType;
  final bool obscureText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final int maxLines;
  final Color? fillColor;
  final bool filled;
  final TextStyle? style;
  final TextStyle? hintStyle;
  final InputBorder? border;
  final TextInputAction? textInputAction;

  const CommonTextField({
    super.key,
    this.helperText,
    this.hintText,
    this.controller,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.prefixIcon,
    this.suffixIcon,
    this.validator,
    this.onChanged,
    this.maxLines = 1,
    this.fillColor,
    this.filled = true,
    this.style,
    this.hintStyle,
    this.border,
    this.textInputAction
  });

  @override
  State<StatefulWidget> createState() => CommonTextFieldState();
}

class CommonTextFieldState extends State<CommonTextField> {

  bool _isPasswordVisible = false;
  AnimationController? _animationController;

  @override
  void initState() {
    _isPasswordVisible = widget.obscureText;
    super.initState();
  }

  void shake() {
    _animationController?..value = 0..forward();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.helperText != null) Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.helperText ?? "",
              style: TextStyle(
                fontSize: 16, 
                fontWeight: FontWeight.w500,
                color: context.isDarkMode() ? Colors.white54 : CustomColors.gray
              ),
            ),
            8.height()
          ],
        ),
        CommonShakeWidget(
          controller: (animation) {
            _animationController = animation;
          },
          child: TextFormField(
            controller: widget.controller,
            keyboardType: widget.keyboardType,
            textInputAction: widget.textInputAction ?? TextInputAction.done,
            obscureText: _isPasswordVisible,
            maxLines: widget.maxLines,
            style: widget.style ?? TextStyle(
              fontSize: 14.0,
              color: Colors.black,
              fontWeight: FontWeight.w400
            ),
            decoration: InputDecoration(
              fillColor: widget.fillColor ?? Color(0xFFF1F1F1),
              filled: widget.filled,
              hintText: widget.hintText,
              hintStyle: widget.hintStyle ?? TextStyle(
                color: Colors.grey.shade500,
                fontWeight: FontWeight.w400,
                fontSize: 14.0
              ),
              enabledBorder: widget.border ?? OutlineInputBorder(
                borderRadius: BorderRadius.circular(3),
                borderSide: BorderSide(
                  color:Color(0xFFE8E8E8),
                  width: 0.5
                ),
              ),
              border: widget.border ??  OutlineInputBorder(
                borderRadius: BorderRadius.circular(3),
                borderSide: BorderSide(
                  color: Color(0xFFE8E8E8),
                  width: 0.5
                ),
              ),
              focusedBorder: widget.border ??  OutlineInputBorder(
                borderRadius: BorderRadius.circular(3),
                borderSide: BorderSide(
                  color: Color(0xFFE8E8E8),
                  width: 0.5
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(3),
                borderSide: BorderSide(
                  color: Colors.red.shade400,
                  width: 2.0
                ),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(3),
                borderSide: BorderSide(
                  color: Colors.red.shade400,
                  width: 2.0
                ),
              ),
              errorStyle: TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.w500,
                color: Colors.red.shade400,
              ),
              prefix: Padding(
                padding: EdgeInsets.only(left: 20.0),
              ),
              prefixIcon: widget.prefixIcon,
              suffixIcon: (widget.obscureText == true) ? _togglePasswordVisibility() : widget.suffixIcon,
              contentPadding: const EdgeInsets.only(bottom: 0.0, top: 15.0),
            ),
            validator: widget.validator,
            onChanged: widget.onChanged,
          ),
        ),
      ],
    );
  }

  Widget _togglePasswordVisibility() {

    return IconButton(
      onPressed: () {
        setState(() {
          _isPasswordVisible = !_isPasswordVisible;
        });
      }, 
      style: IconButton.styleFrom(
        overlayColor: Colors.black45,
      ),
      icon: AnimatedSwitcher(
        duration: 300.milliseconds(),
        child: Icon(
          key: UniqueKey(),
          !_isPasswordVisible ? Icons.visibility_outlined : Icons.visibility_off_outlined
        ),
      )
    );
  }
}