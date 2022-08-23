import 'package:facebook_interface/componentes/botao_imagem_perfil.dart';
import 'package:facebook_interface/modelos/usuario.dart';
import 'package:flutter/material.dart';

class ListaContatos extends StatelessWidget {
  const ListaContatos({required this.usuarios, Key? key}) : super(key: key);

  final List<Usuario> usuarios;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  'Contatos',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[700],
                  ),
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.video_call),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.search),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.more_horiz),
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 10),
              itemCount: usuarios.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6.0),
                  child: BotaoImagemPerfil(
                    usuario: usuarios[index],
                    onTap: () {},
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
