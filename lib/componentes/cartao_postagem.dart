import 'package:cached_network_image/cached_network_image.dart';
import 'package:facebook_interface/componentes/imagem_perfil.dart';
import 'package:facebook_interface/modelos/modelos.dart';
import 'package:facebook_interface/uteis/paleta_cores.dart';
import 'package:facebook_interface/uteis/responsivo.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class CartaoPostagem extends StatelessWidget {
  const CartaoPostagem({required this.post, Key? key}) : super(key: key);

  final Postagem post;

  @override
  Widget build(BuildContext context) {
    bool isDesktop = Responsivo.isDesktop(context);
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: isDesktop ? 5 : 0),
      elevation: isDesktop ? 1 : 0,
      shape: isDesktop
          ? RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            )
          : null,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Column(
          children: [
            // Cabeçalho
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CabecalhoPost(post: post),
                  Text(post.descricao),
                ],
              ),
            ),
            // Imagem da postagem
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: CachedNetworkImage(
                imageUrl: post.urlImagem,
              ),
            ),

            // Área de estatísticas
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: EstatisticasPostagem(
                post: post,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class EstatisticasPostagem extends StatelessWidget {
  const EstatisticasPostagem({required this.post, Key? key}) : super(key: key);

  final Postagem post;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              padding: const EdgeInsets.all(4),
              decoration: const BoxDecoration(
                color: PaletaCores.azulFacebook,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.thumb_up,
                size: 10,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              width: 4,
            ),
            Expanded(
              child: Text(
                '${post.curtidas}',
                style: TextStyle(
                  color: Colors.grey[700],
                ),
              ),
            ),
            const SizedBox(
              width: 4,
            ),
            Text(
              '${post.comentarios} comentários',
              style: TextStyle(
                color: Colors.grey[700],
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            Text(
              '${post.compartilhamentos} compartilhamentos',
              style: TextStyle(
                color: Colors.grey[700],
              ),
            ),
          ],
        ),
        const Divider(
          thickness: 1.2,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            BotaoPost(
              icone: Icon(
                LineIcons.thumbsUpAlt,
                color: Colors.grey[700],
              ),
              texto: 'Curtir',
              onTap: () {},
            ),
            BotaoPost(
              icone: Icon(
                LineIcons.alternateCommentAlt,
                color: Colors.grey[700],
              ),
              texto: 'Comentar',
              onTap: () {},
            ),
            BotaoPost(
              icone: Icon(
                LineIcons.share,
                color: Colors.grey[700],
              ),
              texto: 'Compartilhar',
              onTap: () {},
            )
          ],
        ),
      ],
    );
  }
}

class BotaoPost extends StatelessWidget {
  const BotaoPost(
      {required this.icone, required this.texto, required this.onTap, Key? key})
      : super(key: key);

  final Icon icone;
  final String texto;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              icone,
              const SizedBox(
                width: 4,
              ),
              Text(
                texto,
                style: TextStyle(
                    color: Colors.grey[700], fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CabecalhoPost extends StatelessWidget {
  const CabecalhoPost({required this.post, Key? key}) : super(key: key);

  final Postagem post;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ImagemPerfil(
          urlImagem: post.usuario.urlImagem,
          foiVisualizado: true,
        ),
        const SizedBox(
          width: 8,
        ),
        // Informações do usuário
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                post.usuario.nome,
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                children: [
                  Text(
                    '${post.tempoAtras} - ',
                  ),
                  Icon(
                    Icons.public,
                    size: 12,
                    color: Colors.grey[600],
                  ),
                ],
              ),
            ],
          ),
        ),

        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.more_horiz),
        )
      ],
    );
  }
}
