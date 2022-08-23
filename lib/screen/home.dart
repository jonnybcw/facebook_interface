import 'package:facebook_interface/componentes/area_criar_postagem.dart';
import 'package:facebook_interface/componentes/area_story.dart';
import 'package:facebook_interface/componentes/botao_circulo.dart';
import 'package:facebook_interface/componentes/cartao_postagem.dart';
import 'package:facebook_interface/componentes/lista_contatos.dart';
import 'package:facebook_interface/componentes/lista_opcoes.dart';
import 'package:facebook_interface/dados/dados.dart';
import 'package:facebook_interface/modelos/modelos.dart';
import 'package:facebook_interface/uteis/paleta_cores.dart';
import 'package:facebook_interface/uteis/responsivo.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TrackingScrollController _scrollController = TrackingScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Responsivo(
          mobile: HomeMobile(
            scrollController: _scrollController,
          ),
          desktop: HomeDesktop(
            scrollController: _scrollController,
          ),
        ),
      ),
    );
  }
}

class HomeMobile extends StatelessWidget {
  final TrackingScrollController scrollController;

  const HomeMobile({required this.scrollController, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: scrollController,
      slivers: [
        SliverAppBar(
          backgroundColor: Colors.white,
          floating: true,
          centerTitle: false,
          title: const Text(
            'facebook',
            style: TextStyle(
              color: PaletaCores.azulFacebook,
              fontWeight: FontWeight.bold,
              fontSize: 28,
              letterSpacing: -1.2,
            ),
          ),
          actions: [
            BotaoCirculo(
              icon: LineIcons.search,
              size: 30,
              onPressed: () {},
            ),
            BotaoCirculo(
              icon: LineIcons.facebookMessenger,
              size: 30,
              onPressed: () {},
            ),
            const SizedBox(width: 8),
          ],
        ),
        SliverToBoxAdapter(
          child: AreaCriarPostagem(
            usuario: usuarioAtual,
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(0, 10, 0, 5),
          sliver: SliverToBoxAdapter(
            child: AreaStory(
              usuario: usuarioAtual,
              stories: stories,
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              Postagem post = postagens[index];

              return CartaoPostagem(post: post);
            },
            childCount: postagens.length,
          ),
        )
      ],
    );
  }
}

class HomeDesktop extends StatelessWidget {
  final TrackingScrollController scrollController;

  const HomeDesktop({required this.scrollController, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          flex: 2,
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: ListaOpcoes(
              usuario: usuarioAtual,
            ),
          ),
        ),
        const Spacer(),
        Flexible(
          flex: 5,
          child: CustomScrollView(
            controller: scrollController,
            slivers: [
              SliverPadding(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 5),
                sliver: SliverToBoxAdapter(
                  child: AreaStory(
                    usuario: usuarioAtual,
                    stories: stories,
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: AreaCriarPostagem(
                  usuario: usuarioAtual,
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    Postagem post = postagens[index];

                    return CartaoPostagem(post: post);
                  },
                  childCount: postagens.length,
                ),
              )
            ],
          ),
        ),
        const Spacer(),
        Flexible(
          flex: 2,
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: ListaContatos(
              usuarios: usuariosOnline,
            ),
          ),
        ),
      ],
    );
  }
}
