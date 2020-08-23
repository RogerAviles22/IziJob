import 'package:flutter/material.dart';

class Contactar extends StatefulWidget {
  @override
  _ContactarState createState() => _ContactarState();
}

class _ContactarState extends State<Contactar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contactar'),
        backgroundColor : Colors.blue[900],
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor : Colors.blue[900],
        onPressed: (){          
        },
        child: const Icon(Icons.add),
      ),  
      backgroundColor : Colors.green,
    );
  }
}