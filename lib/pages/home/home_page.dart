import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:untitled/pages/home/widgets/bottom_menu.dart';
import 'package:untitled/pages/home/widgets/item_menu_bottom.dart';
import 'package:untitled/pages/home/widgets/menu_app.dart';
import 'package:untitled/pages/home/widgets/my_app_bar.dart';
import 'package:untitled/pages/home/widgets/my_dots.dart';
import 'package:untitled/pages/home/widgets/page_view_app.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool? _showMenu;
  int _currentIndex = 0;
  double _yPosition = 0.000000000000000000000000000000000078548;

  @override
  void initState() {
    super.initState();
    _showMenu = false;
    _currentIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    double _screenHeight = MediaQuery.of(context).size.height;
    if (_yPosition == 0.000000000000000000000000000000000078548) {
      _yPosition = _screenHeight * .25;
    }
    return Scaffold(
      backgroundColor: Colors.purple[800],
      body: Stack(
        children: <Widget>[
          MyAppBar(
            showMenu: _showMenu!,
            onTap: () {
              setState(() {
                _showMenu = !_showMenu!;
                _yPosition =
                    _showMenu! ? _screenHeight * .85 : _screenHeight * .24;
              });
            },
          ),
          MenuApp(
            top: _screenHeight * .22,
            showMenu: _showMenu!,
          ),
          MenuBottom(
            showMenu: _showMenu!,
          ),
          MyDotsApp(
              showMenu: _showMenu!,
              top: _screenHeight * 0.80,
              currentIndex: _currentIndex),
          PageViewApp(
            yPosition: _yPosition,
            top: _yPosition,
            onChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            onPanUpdate: (details) {
              double positionBottomMax = _screenHeight * .85;
              double positionTopMax = _screenHeight * .24;
              double positionMid = positionBottomMax - positionTopMax;
              positionMid = positionMid / 2;
              setState(() {
                _yPosition =
                    _yPosition < positionTopMax ? positionTopMax : _yPosition;
                _yPosition = _yPosition > positionBottomMax
                    ? positionBottomMax
                    : _yPosition;
                _yPosition = _yPosition += details.delta.dy;
                //print('${_yPosition.toString()} - ${positionTopMax.toString()} - ${positionBottomMax.toString()}');

                if (_yPosition > (positionBottomMax)) {
                  _showMenu = true;
                } else if (_yPosition < (positionTopMax)) {
                  _showMenu = false;
                }

                if (_yPosition != positionBottomMax && details.delta.dy > 0) {
                  _yPosition = _yPosition > positionTopMax + positionMid
                      ? positionBottomMax
                      : _yPosition;
                }
                if (_yPosition != positionTopMax && details.delta.dy < 0) {
                  _yPosition = _yPosition < positionBottomMax - positionMid
                      ? positionTopMax
                      : _yPosition;
                }
              });
            },
          ),
        ],
      ),
    );
  }
}
