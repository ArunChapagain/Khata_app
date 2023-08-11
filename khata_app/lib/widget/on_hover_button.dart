import 'package:flutter/material.dart';

class OnHoverButton extends StatefulWidget {
  final Widget child;

  const OnHoverButton({required this.child, super.key});
  @override
  State<OnHoverButton> createState() => _OnHoverButtonState();
}

class _OnHoverButtonState extends State<OnHoverButton> {
  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
