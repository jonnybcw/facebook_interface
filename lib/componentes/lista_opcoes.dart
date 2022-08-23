import 'package:facebook_interface/componentes/botao_imagem_perfil.dart';
import 'package:facebook_interface/componentes/opcao.dart';
import 'package:facebook_interface/modelos/usuario.dart';
import 'package:facebook_interface/uteis/paleta_cores.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class ListaOpcoes extends StatelessWidget {
  final Usuario usuario;

  const ListaOpcoes({required this.usuario, Key? key}) : super(key: key);

  final List<List> _opcoes = const [
    [LineIcons.userFriends, PaletaCores.azulFacebook, "Amigos"],
    [LineIcons.facebookMessenger, PaletaCores.azulFacebook, 'Mensagens'],
    [LineIcons.flag, Colors.orange, 'Páginas'],
    [LineIcons.users, PaletaCores.azulFacebook, 'Grupos'],
    [Icons.storefront_outlined, PaletaCores.azulFacebook, 'Marketplace'],
    [Icons.ondemand_video, Colors.red, 'Assistir'],
    [LineIcons.calendar, Colors.deepPurple, 'Eventos'],
    [LineIcons.chevronCircleDown, Colors.black45, 'Ver mais'],
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 6.0),
          child: BotaoImagemPerfil(
            usuario: usuario,
            onTap: () {},
          ),
        ),
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(vertical: 10),
            itemCount: _opcoes.length,
            itemBuilder: (context, index) {
              List item = _opcoes[index];
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 6.0),
                child: Opcao(
                  icone: item[0],
                  cor: item[1],
                  texto: item[2],
                  onTap: () {},
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
