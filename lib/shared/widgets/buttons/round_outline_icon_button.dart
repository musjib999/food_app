import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RoundOutlinedIconButton extends StatelessWidget {
  final IconData icon;
  final Color color;
  final void Function()? onPressed;
  const RoundOutlinedIconButton({
    required this.icon,
    required this.color,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: Colors.transparent,
        border: Border.all(color: Colors.grey),
      ),
      child: IconButton(
        onPressed: onPressed,
        icon: FaIcon(
          icon,
          color: color,
        ),
      ),
    );
  }
}
