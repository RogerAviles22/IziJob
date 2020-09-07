//https://flutter-es.io/docs/cookbook/navigation/navigation-basics
//import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
//import 'package:intl/intl.dart';
//import 'package:izijob/footer.dart';

class Registro extends StatefulWidget {
  @override
  _RegistroState createState() => _RegistroState();
}

//enum SingingCharacter { empleo, cachuelo }

class _RegistroState extends State<Registro> {
  final _formKey = GlobalKey<FormState>();
  //SingingCharacter _character = SingingCharacter.empleo;
  final globalKey = GlobalKey<ScaffoldState>();

  String tfUsuario, tfContrasena, tfNombre, tfCorreo, tfFechaNac, tfCedula;

  Widget build(BuildContext context) {
    return Scaffold(
      key: globalKey,
      appBar: AppBar(
        title: Text('Registrarse'),
        backgroundColor: Colors.blue[900],
        centerTitle: true,
        /*actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.check,
              color: Colors.white,
            ),
            onPressed: uploadStatusCachuelo,
          )
        ],*/
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Form(
              key: _formKey,
              child: Scrollbar(
                child: ListView(
                  children: <Widget>[
                    Image.asset(
                      'assets/Izi.PNG',
                      width: 50,
                      height: 120,
                    ),
                    new ListTile(
                        leading: const Icon(Icons.account_circle),
                        title: TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Nombre',
                            //hintText: 'Ej: Necesito empleador...',
                          ),
                          validator: (value) {
                            return value.isEmpty
                                ? 'Por favor, ingrese su nombre'
                                : null;
                          },
                          onSaved: (value) {
                            return tfNombre = value;
                          },
                        )),
                    new ListTile(
                      leading: const Icon(Icons.person),
                      title: TextFormField(
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                        decoration: InputDecoration(
                          labelText: 'Usuario',
                          //hintText: 'Ej: Señor(a) de tal edad...',
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Por favor, ingresa su usuario';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          return tfUsuario = value;
                        },
                      ),
                    ),
                    new ListTile(
                      leading: const Icon(Icons.calendar_today),
                      title: TextFormField(
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                        decoration: InputDecoration(
                          labelText: 'Fecha de Nacimiento',
                          //hintText: 'Ej: Experiencia en dicho campo...',
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Por favor, ingrese su fecha de nacimiento';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          return tfFechaNac = value;
                        },
                      ),
                    ),
                    new ListTile(
                        leading: const Icon(Icons.email),
                        title: TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Correo',
                            //hintText: 'Ingresa el posible sueldo',
                          ),
                          validator: (value) {
                            return value.isEmpty
                                ? 'Por favor, ingrese su correo.'
                                : null;
                          },
                          onSaved: (value) {
                            return tfCorreo = value;
                          },
                        )),
                    new ListTile(
                        leading: const Icon(Icons.credit_card),
                        title: TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Cédula',
                            //hintText: 'Ej: 1, 2-4, Por ver...',
                          ),
                          validator: (value) {
                            return value.isEmpty
                                ? 'Por favor, ingrese su cédula.'
                                : null;
                          },
                          onSaved: (value) {
                            return tfCedula = value;
                          },
                        )),
                    new ListTile(
                        leading: const Icon(Icons.lock),
                        title: TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Contraseña',
                            //hintText: 'Ej: 098542261,(04)254789...',
                          ),
                          validator: (value) {
                            return value.isEmpty
                                ? 'Por favor, ingrese su contraseña.'
                                : null;
                          },
                          onSaved: (value) {
                            return tfContrasena = value;
                          },
                        )),
                    SizedBox(height: 20.0),
                    new RaisedButton(
                      disabledColor: Colors.amber,
                      child: Text("Registrarse"),
                      splashColor: Colors.amber,
                      color: Colors.blueAccent,
                      onPressed: () {
                        print("Hola Raised Button");
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      //backgroundColor: Colors.green,
    );
  }
}
