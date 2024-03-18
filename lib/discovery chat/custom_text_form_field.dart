import 'package:discovery/categories/desert/white.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.controller,
    this.prefixIcon,
    this.suffixIcon,
    this.labelText,
    this.hintText,
    this.onPressedSuffixIcon,
    this.obscureText,
    this.onChanged,
  });

  final TextEditingController controller;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final String? labelText;
  final String? hintText;
  final bool? obscureText;
  final VoidCallback? onPressedSuffixIcon;
  final ValueChanged<String>? onChanged;

  @override
  Widget build(BuildContext context) => Container(
    height: 50,
    color: Colors.grey.shade200,
    child: TextFormField(
          controller: controller,
          obscureText: obscureText ?? false,
          onChanged: onChanged,
          decoration: InputDecoration(
            labelText: labelText,
            fillColor: Colors.black,
            hintText: hintText,
            hintStyle: TextStyle(
                color: Colors.grey,
              fontSize: 15,
              fontFamily: 'Roboto'

            ),
            prefixIcon:
                prefixIcon != null ? Icon(prefixIcon) : null,
            suffixIcon: suffixIcon != null
                ? IconButton(
                    onPressed: onPressedSuffixIcon,
                    icon: Icon(suffixIcon),
                  )
                : null,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50),
              borderSide:  BorderSide(color:Color(0xff3e97bd)),
            ),
          ),
        ),
  );
}
