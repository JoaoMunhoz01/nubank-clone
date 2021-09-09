import 'package:flutter/material.dart';

class ItemMenuBottom extends StatelessWidget {
  final String text;
  final IconData icon;

  const ItemMenuBottom({Key? key, required this.text, required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 11),
      child: Container(
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Icon(icon),
              Text(
                text,
                style: TextStyle(fontSize: 10),
              ),
            ],
          ),
        ),
        height: 50,
        width: MediaQuery.of(context).size.width * 0.20,
        decoration: BoxDecoration(
          color: Colors.white12,
          borderRadius: BorderRadius.circular(5),
        ),
      ),
    );
  }
}
