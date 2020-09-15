import 'package:flutter/material.dart';
import 'package:izijob/clases/cachuelo.dart';

class DetailCachuelo extends StatelessWidget {
  final Cachuelo cachuelo;

  DetailCachuelo({Key key, @required this.cachuelo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${cachuelo.titulo}"),
        backgroundColor: Colors.blue[900],
      ),
      body: ListView(
        padding: EdgeInsets.all(30.0),
        children: <Widget>[
          Row(
            children: [
              Icon(Icons.description, color: Colors.blue[800]),
              SizedBox(width: 15),
              Text(
                "DESCRIPCIÓN ",
                style: TextStyle(
                    fontFamily: 'Varela',
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue[800]),
              )
            ],
          ),
          SizedBox(height: 5),
          Text("${cachuelo.descripcion}", textAlign: TextAlign.center),
          SizedBox(height: 25),
          Text(
            "CONTACTOS",
            style: TextStyle(
                fontFamily: 'Varela',
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                color: Colors.blue[800]),
          ),
          SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.phone, color: Colors.cyan[800]),
              SizedBox(width: 15),
              Text(
                "${cachuelo.telefono}",
                style: TextStyle(
                  fontFamily: 'Varela',
                ),
              )
            ],
          ),
          SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.mail, color: Colors.cyan[800]),
              SizedBox(width: 15),
              Text(
                "${cachuelo.email}",
                style: TextStyle(
                  fontFamily: 'Varela',
                ),
              )
            ],
          ),
          SizedBox(height: 25),
          Row(
            children: [
              Icon(Icons.category, color: Colors.blue[800]),
              SizedBox(width: 15),
              Text(
                "CATEGORÍA",
                style: TextStyle(
                    fontFamily: 'Varela',
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue[800]),
              )
            ],
          ),
          SizedBox(height: 5),
          Text(
            "${cachuelo.categoria}",
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 25),
          Row(
            children: [
              Icon(Icons.supervisor_account, color: Colors.blue[800]),
              SizedBox(width: 15),
              Text(
                "ESTADO ",
                style: TextStyle(
                    fontFamily: 'Varela',
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue[800]),
              ),
              SizedBox(height: 5),
              Text("${cachuelo.estado}"),
            ],
          ),
        ],
      ),
    );
  }
}
