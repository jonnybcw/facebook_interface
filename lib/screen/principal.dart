import 'package:facebook_interface/componentes/navegacao_abas.dart';
import 'package:facebook_interface/componentes/navegacao_abas_desktop.dart';
import 'package:facebook_interface/dados/dados.dart';
import 'package:facebook_interface/screen/home.dart';
import 'package:facebook_interface/uteis/responsivo.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class Principal extends StatefulWidget {
  const Principal({Key? key}) : super(key: key);

  @override
  _PrincipalState createState() => _PrincipalState();
}

class _PrincipalState extends State<Principal> {
  final List<IconData> _icones = [
    Icons.home,
    Icons.ondemand_video,
    Icons.storefront_outlined,
    Icons.flag_outlined,
    LineIcons.bell,
    Icons.menu,
  ];

  final List<Widget> _telas = [
    const Home(),
    const Scaffold(
      backgroundColor: Colors.green,
    ),
    const Scaffold(
      backgroundColor: Colors.yellow,
    ),
    const Scaffold(
      backgroundColor: Colors.purple,
    ),
    const Scaffold(
      backgroundColor: Colors.orange,
    ),
    const Scaffold(
      backgroundColor: Colors.blue,
    ),
  ];

  int _indiceAbaSelecionada = 0;

  @override
  Widget build(BuildContext context) {
    final bool isDesktop = Responsivo.isDesktop(context);
    Size size = MediaQuery.of(context).size;

    return DefaultTabController(
      length: _icones.length,
      child: Scaffold(
        appBar: isDesktop
            ? PreferredSize(
                child: NavegacaoAbasDesktop(
                  indiceAbaSelecionada: _indiceAbaSelecionada,
                  icones: _icones,
                  onTap: (indice) {
                    setState(() {
                      _indiceAbaSelecionada = indice;
                    });
                  },
                  usuario: usuarioAtual,
                ),
                preferredSize: Size(size.width, 100),
              )
            : null,
        body: TabBarView(
          physics: const NeverScrollableScrollPhysics(),
          children: _telas,
        ),
        bottomNavigationBar: isDesktop
            ? null
            : NavegacaoAbas(
                indiceAbaSelecionada: _indiceAbaSelecionada,
                icones: _icones,
                onTap: (indice) {
                  setState(() {
                    _indiceAbaSelecionada = indice;
                  });
                },
              ),
      ),
    );
  }
}
