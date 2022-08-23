import 'package:cached_network_image/cached_network_image.dart';
import 'package:facebook_interface/uteis/paleta_cores.dart';
import 'package:flutter/material.dart';

class ImagemPerfil extends StatelessWidget {
  const ImagemPerfil(
      {required this.urlImagem, this.foiVisualizado = false, Key? key})
      : super(key: key);

  final String urlImagem;
  final bool foiVisualizado;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 20,
      backgroundColor: PaletaCores.azulFacebook,
      child: CircleAvatar(
        backgroundImage: CachedNetworkImageProvider(
          urlImagem,
        ),
        radius: foiVisualizado ? 20 : 18,
        backgroundColor: Colors.grey[200],
      ),
    );
  }
}
