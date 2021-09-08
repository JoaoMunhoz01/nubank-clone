
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'item_menu.dart';

class MenuApp extends StatelessWidget {
  final double top;
  final bool showMenu;
  const MenuApp({Key? key, required this.top, required this.showMenu}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      left: 0,
      right: 0,
      child:AnimatedOpacity(
        duration: Duration(milliseconds: 300),
        opacity: showMenu?1:0,
        child: Container(
          color: Colors.purple[800],
          height: MediaQuery.of(context).size.height *0.55,
          child: Column(
            children: <Widget>[
              Image.network('https://webmobtuts.com/wp-content/uploads/2019/02/QR_code_for_mobile_English_Wikipedia.svg_.png',
                  height: 80, 
                  color: Colors.white
              ),
              Text.rich(
                TextSpan(
                  text: 'Banco ',
                  children: [
                    TextSpan(
                      text: '260 - Nu Pagamentos S.A.',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                style: TextStyle(fontSize: 12),
              ),
              SizedBox(height: 5,
              ),
              Text.rich(
                TextSpan(
                  text: 'Agência ',
                  children: [
                    TextSpan(
                      text: '0001',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                style: TextStyle(fontSize: 12),
              ),
              SizedBox(height: 5,
              ),
              Text.rich(
                TextSpan(
                  text: 'Conta ',
                  children: [
                    TextSpan(
                      text: '223533-9 ',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                style: TextStyle(fontSize: 12),
              ),
              SizedBox(height: 25,
              ),
              SingleChildScrollView(
                child:Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    children: <Widget>[
                      ItemMenu(

                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
