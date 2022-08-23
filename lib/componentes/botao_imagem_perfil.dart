import 'package:facebook_interface/componentes/imagem_perfil.dart';
import 'package:facebook_interface/modelos/usuario.dart';
import 'package:flutter/material.dart';

class BotaoImagemPerfil extends StatelessWidget {
  const BotaoImagemPerfil(
      {required this.usuario, required this.onTap, Key? key})
      : super(key: key);

  final Usuario usuario;
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
            ImagemPerfil(
              urlImagem: usuario.urlImagem,
              foiVisualizado: true,
            ),
            const SizedBox(
              width: 4,
            ),
            Flexible(
              child: Text(
                usuario.nome,
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
