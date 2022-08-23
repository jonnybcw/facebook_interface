import 'package:facebook_interface/uteis/paleta_cores.dart';
import 'package:flutter/material.dart';

class NavegacaoAbas extends StatelessWidget {
  const NavegacaoAbas(
      {required this.icones,
      required this.indiceAbaSelecionada,
      required this.onTap,
      this.indicadorEmbaixo = false,
      Key? key})
      : super(key: key);

  final List<IconData> icones;
  final int indiceAbaSelecionada;
  final Function(int) onTap;
  final bool indicadorEmbaixo;

  @override
  Widget build(BuildContext context) {
    return TabBar(
      onTap: onTap,
      indicator: BoxDecoration(
        border: indicadorEmbaixo
            ? const Border(
                bottom: BorderSide(
                  color: PaletaCores.azulFacebook,
                  width: 3,
                ),
              )
            : const Border(
                top: BorderSide(
                  color: PaletaCores.azulFacebook,
                  width: 3,
                ),
              ),
      ),
      tabs: icones
          .asMap()
          .map(
            (indice, item) => MapEntry(
              indice,
              Tab(
                icon: Icon(
                  item,
                  color: indiceAbaSelecionada == indice
                      ? PaletaCores.azulFacebook
                      : Colors.black54,
                  size: 30,
                ),
              ),
            ),
          )
          .values
          .toList(),
    );
  }
}
