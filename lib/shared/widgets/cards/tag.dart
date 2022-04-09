import 'package:flutter/material.dart';
import 'package:food_app/shared/themes/colors.dart';

class Tag extends StatelessWidget {
  final String title;
  final void Function()? onPressed;
  const Tag({Key? key, required this.title, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: AppColors.primaryColor,
      ),
      child: TextButton(
        onPressed: onPressed,
        child: Text(title),
      ),
    );
  }
}
