
import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({super.key, this.onPressed, required this.icon});
 final void Function()? onPressed;
 final Widget icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(40),color: Colors.white),
      child: IconButton(onPressed: onPressed, icon: icon),
    );
  }
}
