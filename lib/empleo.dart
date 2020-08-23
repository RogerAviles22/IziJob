import 'package:flutter/material.dart';

class Empleo extends StatefulWidget {
  @override
  _EmpleoState createState() => _EmpleoState();
}

class _EmpleoState extends State<Empleo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Empleo'),
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