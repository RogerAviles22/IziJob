import 'package:flutter/material.dart';
import 'package:izijob/clases/empleo.dart';

class DetailEmpleo extends StatelessWidget {
  final Empleo empleo;

  DetailEmpleo({Key key, @required this.empleo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${empleo.titulo}"),
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
                  color: Colors.blue[800],
                ),
              )
            ],
          ),
          SizedBox(height: 10),
          Text(
            "${empleo.descripcion}",
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 25),
          Row(
            children: [
              Icon(
                Icons.star,
                color: Colors.blue[800],
              ),
              SizedBox(width: 15),
              Text(
                "EXPERIENCIA",
                style: TextStyle(
                  fontFamily: 'Varela',
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue[800],
                ),
              )
            ],
          ),
          SizedBox(height: 10),
          Text(
            "${empleo.experiencia}",
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 25),
          Row(
            children: [
              Icon(Icons.monetization_on, color: Colors.blue[800]),
              SizedBox(width: 15),
              Text(
                "SUELDO ",
                style: TextStyle(
                  fontFamily: 'Varela',
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue[800],
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Text(
            "${empleo.sueldo}",
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 25),
          Row(
            children: [
              Icon(
                Icons.contacts,
                color: Colors.blue[800],
              ),
              SizedBox(width: 15),
              Text(
                "CONTACTOS ",
                style: TextStyle(
                  fontFamily: 'Varela',
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue[800],
                ),
              ),
            ],
          ),
          SizedBox(height: 5),
          Row(            
          mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[              
              Icon(Icons.phone,
                color: Colors.cyan[700]),
              SizedBox(width: 15),
              Text(
                "${empleo.telefono}",
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
              Icon(Icons.mail,
                color: Colors.cyan[700]),
              SizedBox(width: 15),
              Text(
                "${empleo.email}",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Varela',
                ),
              )
            ],
          ),
          SizedBox(height: 25),
          Row(
            children: [
              Icon(
                Icons.category,
                color: Colors.blue[800],
              ),
              SizedBox(width: 15),
              Text(
                "CATEGORÍA",
                style: TextStyle(
                  fontFamily: 'Varela',
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue[800],
                ),
              )
            ],
          ),
          SizedBox(height: 10),
          Text(
            "${empleo.categoria}",
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 25),
          Row(
            children: [
              Icon(
                Icons.supervisor_account,
                color: Colors.blue[800],
              ),
              SizedBox(width: 15),
              Text(
                "VACANTES : ",
                style: TextStyle(
                  fontFamily: 'Varela',
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue[800],
                ),
              ),
              SizedBox(height: 5),
              Text("${empleo.vacantes}"),
            ],
          ),
        ],
      ),
    );
  }
}
