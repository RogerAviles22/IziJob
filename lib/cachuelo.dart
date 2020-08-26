import 'package:flutter/material.dart';
import 'package:izijob/publicarEmpleo.dart';

class Cachuelo extends StatefulWidget {
  @override
  _CachueloState createState() => _CachueloState();
}

class _CachueloState extends State<Cachuelo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cachuelo'),
        backgroundColor : Colors.blue[900],
        centerTitle: true,
      ),
      body: Center(

      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor : Colors.blue[900],
        onPressed: (){  
          Navigator.push(context, 
          MaterialPageRoute(builder: (context){
            return PublicarEmpleo();
          })); 
                 
        },
        child: const Icon(Icons.add),
      ),  
      backgroundColor : Colors.green,
    );
  }
}