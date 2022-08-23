import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:facebook_interface/dados/dados.dart';
import 'package:facebook_interface/modelos/modelos.dart';
import 'package:facebook_interface/uteis/paleta_cores.dart';
import 'package:facebook_interface/uteis/responsivo.dart';
import 'package:flutter/material.dart';

import 'imagem_perfil.dart';

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
        // etc.
      };
}

class AreaStory extends StatelessWidget {
  const AreaStory({required this.usuario, required this.stories, Key? key})
      : super(key: key);

  final Usuario usuario;
  final List<Story> stories;

  @override
  Widget build(BuildContext context) {
    bool isDesktop = Responsivo.isDesktop(context);
    return Container(
      height: 200,
      color: isDesktop ? Colors.transparent : Colors.white,
      child: ScrollConfiguration(
        behavior: MyCustomScrollBehavior(),
        child: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
            scrollDirection: Axis.horizontal,
            physics: const AlwaysScrollableScrollPhysics(),
            itemCount: 1 + stories.length,
            itemBuilder: (context, index) {
              if (index == 0) {
                Story storyUsuario = Story(
                    usuario: usuarioAtual, urlImagem: usuarioAtual.urlImagem);

                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: CartaoStory(
                    story: storyUsuario,
                    adicionarStory: true,
                  ),
                );
              }

              Story story = stories[index - 1];
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: CartaoStory(story: story),
              );
            }),
      ),
    );
  }
}

class CartaoStory extends StatelessWidget {
  final Story story;
  final adicionarStory;
  const CartaoStory(
      {required this.story, this.adicionarStory = false, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: CachedNetworkImage(
            imageUrl: story.urlImagem,
            height: double.infinity,
            width: 110,
            fit: BoxFit.cover,
          ),
        ),
        Container(
          height: double.infinity,
          width: 110,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            gradient: PaletaCores.degradeStory,
          ),
        ),
        Positioned(
          top: 8,
          left: 8,
          child: adicionarStory
              ? Container(
                  height: 40,
                  width: 40,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    icon: const Icon(Icons.add),
                    iconSize: 30,
                    color: PaletaCores.azulFacebook,
                    onPressed: () {},
                  ),
                )
              : ImagemPerfil(
                  urlImagem: story.usuario.urlImagem,
                  foiVisualizado: story.foiVisualizado,
                ),
        ),
        Positioned(
          left: 8,
          bottom: 8,
          right: 8,
          child: Text(
            adicionarStory ? 'Criar story' : story.usuario.nome,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        )
      ],
    );
  }
}
