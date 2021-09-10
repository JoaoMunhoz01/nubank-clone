import 'package:flutter/material.dart';
import 'item_menu_bottom.dart';

class MenuBottom extends StatelessWidget {

  final bool? showMenu;

  const MenuBottom({Key? key, required this.showMenu}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      bottom: 0 + MediaQuery.of(context).padding.bottom,
      right: 0,
      left: 0,
      duration: Duration(milliseconds: 200),
      child: IgnorePointer(
        ignoring: showMenu!,
        child: AnimatedOpacity(
          duration: Duration(milliseconds: 300),
          opacity: showMenu! ? 0 : 1,
          child: Container(
            height: MediaQuery.of(context).size.height * 0.16,
            color: Colors.purple[800],
            child: ListView(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                ItemMenuBottom(
                  icon: Icons.person_add_alt,
                  text: 'Indicar Amigos',
                ),
                ItemMenuBottom(
                  icon: Icons.phone_android_sharp,
                  text: 'Recarga de Celular',
                ),
                ItemMenuBottom(
                  icon: Icons.chat_outlined,
                  text: 'Cobrar',
                ),
                ItemMenuBottom(
                  icon: Icons.monetization_on_outlined,
                  text: 'Empréstimos',
                ),
                ItemMenuBottom(
                  icon: Icons.move_to_inbox,
                  text: 'Depositar',
                ),
                ItemMenuBottom(
                  icon: Icons.mobile_screen_share,
                  text: 'Transferir',
                ),
                ItemMenuBottom(
                  icon: Icons.format_align_center,
                  text: 'Ajustar Limite',
                ),
                ItemMenuBottom(
                  icon: Icons.chrome_reader_mode,
                  text: 'Pagar',
                ),
                ItemMenuBottom(
                  icon: Icons.lock_open,
                  text: 'Bloquear Cartão',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
