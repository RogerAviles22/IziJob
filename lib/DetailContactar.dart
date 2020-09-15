import 'package:flutter/material.dart';
import 'package:izijob/clases/contactar.dart';

class DetailContactar extends StatelessWidget {
  final Contacto contacto;

  DetailContactar({Key key, @required this.contacto}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${this.contacto.nombre}," + "${this.contacto.profesion}"),
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
                "DESCRIPCIÓN",
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
            "${contacto.descripcion}",
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 25),
          Text(
            "CONTACTOS",
            style: TextStyle(
                fontFamily: 'Varela',
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                color: Colors.blue[800]),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.phone, color: Colors.cyan[800]),
              SizedBox(width: 15),
              Text(
                "${contacto.telefono}",
                style: TextStyle(
                  fontFamily: 'Varela',
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.mail, color: Colors.cyan[800]),
              SizedBox(width: 15),
              Text(
                "${contacto.correo}",
                style: TextStyle(
                  fontFamily: 'Varela',
                ),
              )
            ],
          ),
          SizedBox(height: 25),
          Text(
            "PROFESIÓN ",
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
              Icon(Icons.business_center, color: Colors.blue[800]),
              SizedBox(width: 15),
              Text(
                "${contacto.profesion}",
                style: TextStyle(
                  fontFamily: 'Varela',
                ),
              )
            ],
          ),
          SizedBox(height: 25),
          Text(
            "SERVICIOS",
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
              Icon(Icons.assignment, color: Colors.blue[800]),
              SizedBox(width: 15),
              Text(
                "${contacto.servicio}",
                style: TextStyle(
                  fontFamily: 'Varela',
                ),
              )
            ],
          ),
          SizedBox(height: 25),
          Text(
            "CATEGORÍAS ",
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
              Icon(Icons.category, color: Colors.blue[800]),
              SizedBox(width: 15),
              Text(
                "${contacto.categoria}",
                style: TextStyle(
                  fontFamily: 'Varela',
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
