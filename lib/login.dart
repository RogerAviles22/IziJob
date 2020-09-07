//https://flutter-es.io/docs/cookbook/navigation/navigation-basics
//import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
//import 'package:intl/intl.dart';
import 'package:izijob/footer.dart';

import 'globals.dart' as globals;

import 'registro.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

//enum SingingCharacter { empleo, cachuelo }

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  //SingingCharacter _character = SingingCharacter.empleo;
  final globalKey = GlobalKey<ScaffoldState>();

  String tfUsuario, tfContrasena;
  //tfExp,
  //tfEstado,
  //tfSueldo,
  //tfTelefono,
  //tfEmail,
  //tfCategoria;

  Widget build(BuildContext context) {
    return Scaffold(
      key: globalKey,
      appBar: AppBar(
        title: Text('Iniciar Sesión'),
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
                      height: 150,
                    ),
                    new ListTile(
                        leading: const Icon(Icons.person),
                        title: TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Usuario',
                            //hintText: 'Ej: Necesito empleador...',
                          ),
                          validator: (value) {
                            return value.isEmpty
                                ? 'Por favor, ingrese su usuario'
                                : null;
                          },
                          onSaved: (value) {
                            return tfUsuario = value;
                          },
                        )),
                    new ListTile(
                      leading: const Icon(Icons.lock),
                      title: TextFormField(
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                        decoration: InputDecoration(
                          labelText: 'Contraseña',
                          //hintText: 'Ej: Señor(a) de tal edad...',
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Por favor, ingresa la contraseña';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          return tfContrasena = value;
                        },
                      ),
                    ),
                    SizedBox(height: 20.0),
                    new RaisedButton(
                      disabledColor: Colors.amber,
                      child: Text("Ingresar"),
                      splashColor: Colors.amber,
                      color: Colors.blueAccent,
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          //return PublicarCachuelo();
                          globals.isLoggedIn = true;
                          return Footer();
                        }));
                      },
                    ),
                    SizedBox(height: 20.0),
                    new RaisedButton(
                      disabledColor: Colors.amber,
                      child: Text("Registrarse"),
                      splashColor: Colors.amber,
                      color: Colors.blueAccent,
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          //return PublicarCachuelo();
                          return Registro();
                        }));
                      },
                    ),
                    SizedBox(height: 20.0),
                    new RaisedButton(
                      disabledColor: Colors.amber,
                      child: Text("Ingresar como invitado"),
                      splashColor: Colors.amber,
                      color: Colors.blueAccent,
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          //return PublicarCachuelo();
                          globals.isLoggedIn = false;
                          return Footer();
                        }));
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
/*
  //Guardamos texto
  void guardarToDatabase() {
    var dbTimeKey = DateTime.now();
    var formatDate = DateFormat('d/M/y');
    var formatTime = new DateFormat.jm();

    String date = formatDate.format(dbTimeKey);
    String time = formatTime.format(dbTimeKey);

    DatabaseReference ref = FirebaseDatabase.instance.reference();
    var data = {
      "titulo": tfTitulo,
      "descripcion": tfDescripcion,
      //"experiencia": tfExp,
      "estado": "Activo",
      //"sueldo": tfSueldo,
      "telefono": tfTelefono,
      "email": tfEmail,
      "categoria": tfCategoria,
      "fechaP": date,
      "tiempoP": time,
      "idUser": 1
    };
    print(data);
    ref.child("Cachuelo").push().set(data);
  }

  //Valida que esté todos los campos llenos
  bool validarForm() {
    final form = _formKey.currentState;
    if (form.validate()) {
      // Si el formulario es válido, queremos mostrar un Snackbar
      form.save();
      final snackBar = SnackBar(content: Text('Cachuelo Publicado'));
      globalKey.currentState.showSnackBar(snackBar);
      return true;
    }
    return false;
  }

  void uploadStatusCachuelo() async {
    if (validarForm()) {
      guardarToDatabase();
      Navigator.pop(context);
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return Footer();
      }));
    }
  }

  TextFormField textFormFieldFunction(
      String labelText, String hintText, String tfTexto, String msgError) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
      ),
      validator: (value) {
        return value.isEmpty ? msgError : null;
      },
      onSaved: (value) {
        return tfTexto = value;
      },
    );
  }*/
}
