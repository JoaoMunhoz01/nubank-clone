import 'package:flutter/material.dart';

class MyDotsApp extends StatelessWidget {
  final int currentIndex;
  final double top;
  final bool showMenu;

  const MyDotsApp(
      {Key? key,
      required this.currentIndex,
      required this.top,
      required this.showMenu})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color getColor(int index) {
      return index == currentIndex ? Colors.white : Colors.white38;
    }

    return Positioned(
      top: top,
      left: MediaQuery.of(context).size.width / 2.2,
      child: AnimatedOpacity(
        duration: Duration(milliseconds: 300),
        opacity: showMenu ? 0 : 1,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            AnimatedContainer(
              duration: Duration(milliseconds: 300),
              width: 7,
              height: 7,
              decoration: BoxDecoration(
                color: getColor(0),
                shape: BoxShape.circle,
              ),
            ),
            SizedBox(
              width: 8,
            ),
            AnimatedContainer(
              duration: Duration(milliseconds: 300),
              width: 7,
              height: 7,
              decoration: BoxDecoration(
                color: getColor(1),
                shape: BoxShape.circle,
              ),
            ),
            SizedBox(
              width: 8,
            ),
            AnimatedContainer(
              duration: Duration(milliseconds: 300),
              width: 7,
              height: 7,
              decoration: BoxDecoration(
                color: getColor(2),
                shape: BoxShape.circle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
