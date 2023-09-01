import 'package:flutter/material.dart';

class SnackBarWidget extends StatelessWidget {
   SnackBarWidget({super.key,required this.message});
  String message;

  @override
  Widget build(BuildContext context) {
    return SnackBar(
      behavior: SnackBarBehavior.floating,
      content: Center(
        child: Text(
          message,
          style: Theme.of(context)
              .textTheme
              .bodyLarge!
              .copyWith(color: Theme.of(context).colorScheme.primaryContainer),
        ),
      ),
    );
  }
}
