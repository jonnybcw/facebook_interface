import 'package:flutter/material.dart';

class Opcao extends StatelessWidget {
  const Opcao(
      {required this.icone,
      required this.cor,
      required this.texto,
      required this.onTap,
      Key? key})
      : super(key: key);

  final IconData icone;
  final Color cor;
  final String texto;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icone,
              color: cor,
              size: 35,
            ),
            const SizedBox(
              width: 4,
            ),
            Flexible(
              child: Text(
                texto,
                style: const TextStyle(
                  fontSize: 16,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            )
          ],
        ),
      ),
    );
  }
}
