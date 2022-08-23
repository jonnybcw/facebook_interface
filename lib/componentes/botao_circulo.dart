import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class BotaoCirculo extends StatelessWidget {
  const BotaoCirculo({
    Key? key,
    required this.icon,
    required this.size,
    required this.onPressed,
  }) : super(key: key);

  final IconData icon;
  final double size;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[200],
        shape: BoxShape.circle,
      ),
      margin: const EdgeInsets.all(4),
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(icon),
        color: Colors.black,
        iconSize: size,
      ),
    );
  }
}
