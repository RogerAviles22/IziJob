import 'package:flutter/material.dart';
import 'package:izijob/publicarEmpleo.dart';

class Empleo extends StatefulWidget {
  @override
  _EmpleoState createState() => _EmpleoState();
}

class _EmpleoState extends State<Empleo> {
  bool isBusqueda = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        centerTitle: true,
        title: !isBusqueda
            ? Text('Empleo')
            : TextField(
                onChanged: (value) {
                  print(value);
                },
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                    icon: Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                    hintText: "Filtra por Categoría",
                    hintStyle: TextStyle(color: Colors.white)),
              ),
        actions: <Widget>[
          isBusqueda
              ? IconButton(
                  icon: Icon(Icons.cancel),
                  onPressed: () {
                    setState(() {
                      this.isBusqueda = false;
                    });
                  },
                )
              : IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    setState(() {
                      this.isBusqueda = true;
                    });
                  },
                )
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.all(15.0),
        
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue[900],
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return PublicarEmpleo();
          }));
        },
        child: const Icon(Icons.add),
      ),
      //backgroundColor: Colors.green,
    );
  }
}
