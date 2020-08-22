import 'package:flutter/material.dart';

class Footer extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _FooterState();
  }
}

class _FooterState extends State<Footer> {
  //int _currentIndex = 0;
  //final List<Widget> _children = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        //currentIndex: _currentIndex,
        //onTap: onTabTapped,
        // new
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.home),
            title: new Text('Empleo'),
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.flare), title: Text('Cachuelo')),
          BottomNavigationBarItem(
            icon: new Icon(Icons.gradient),
            title: new Text('Contactar'),
          ),
        ],
      ),
    );
  }

  /*void onTabTapped(int index) {
    //Cambia los valores y recarga los datos en pantalla
    setState(() {
      _currentIndex = index;
    });
  }*/
}
