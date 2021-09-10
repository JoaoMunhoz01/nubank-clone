import 'package:flutter/material.dart';
import 'package:untitled/pages/home/widgets/first_card.dart';
import 'package:untitled/pages/home/widgets/second_card.dart';
import 'package:untitled/pages/home/widgets/third_card.dart';
import 'card_app.dart';

class PageViewApp extends StatelessWidget {
  final double top;
  final ValueChanged<int> onChanged;
  final GestureDragUpdateCallback onPanUpdate;
  final double yPosition;

  const PageViewApp(
      {Key? key,
      required this.top,
      required this.onChanged,
      required this.onPanUpdate,
      required this.yPosition})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      duration: Duration(milliseconds: 300),
      curve: Curves.easeOut,
      top: top,
      height: MediaQuery.of(context).size.height * .55,
      left: 0,
      right: 0,
      child: GestureDetector(
        onPanUpdate: onPanUpdate,
        child: PageView(
          onPageChanged: onChanged,
          physics: yPosition != MediaQuery.of(context).size.height * .24
              ? NeverScrollableScrollPhysics()
              : BouncingScrollPhysics(),
          children: <Widget>[
            CardApp(
              child: FirstCard(),
            ),
            CardApp(
              child: SecondCard(),
            ),
            CardApp(
              child: ThirdCard(),
            ),
          ],
        ),
      ),
    );
  }
}
