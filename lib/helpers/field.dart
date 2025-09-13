import 'package:flutter/material.dart';
import 'package:menshop/helpers/colors.dart';
import 'package:menshop/helpers/text_style.dart';

class Field extends StatefulWidget {
  const Field({
    super.key,
    this.controller,
    required this.hintText,
    this.isPassword = false,
    this.ShowIcon=false
  });

  final TextEditingController? controller;
  final String hintText;
  final bool isPassword;
  final bool ShowIcon;

  @override
  State<Field> createState() => _FieldState();
}

class _FieldState extends State<Field> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: widget.isPassword ? _obscureText : false,
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: AppTextStyles.kTextStyle16Grey.copyWith(
          fontWeight: FontWeight.w400,
        ),
        prefixIcon: widget.ShowIcon ?Icon(Icons.search):null,
        suffixIcon: widget.isPassword ? IconButton(icon: Icon(
            _obscureText ? Icons.visibility_off : Icons.visibility,
            color: AppColors.borderFieldColor,
          ),
          onPressed: () {
            setState(() {
              _obscureText = !_obscureText;
            });
          },
        )
            : null,
        focusedBorder: const OutlineInputBorder(),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: AppColors.borderFieldColor),
        ),
      ),
    );
  }
}
