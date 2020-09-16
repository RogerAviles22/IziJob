//https://flutter-es.io/docs/cookbook/navigation/navigation-basics
//import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:izijob/login.dart';
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

  String tfUsuario, tfContrasena, tfNombre, tfCorreo, tfFecha;
  DateTime initial = DateTime.now();
  TextEditingController _passcontroller = new TextEditingController();

  Widget build(BuildContext context) {
    return Scaffold(
      key: globalKey,
      appBar: AppBar(
        title: Text('Registrarse'),
        backgroundColor: Colors.blue[900],
        centerTitle: true,
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
                      leading: const Icon(Icons.lock),
                      title: TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: 'Contraseña',
                        ),
                        controller: _passcontroller,
                        validator: (value) {
                          if (value.isEmpty || value.length < 8) {
                            return "Ingrese mínimo 8 caracteres";
                          }
                          return null;
                        },
                        onSaved: (value) {
                          return tfContrasena = value;
                        },
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    new ListTile(
                      leading: const Icon(Icons.lock),
                      title: TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: 'Validar Contraseña',
                        ),
                        validator: (value) {
                          if (value.isEmpty || value != _passcontroller.text) {
                            return "¡Las contraseñas no coinciden!";
                          }
                          return null;
                        },
                        onSaved: (value) {
                          return "¡Las contraseñas coinciden!";
                        },
                      ),
                    ),
                    SizedBox(height: 20.0),
                    new RaisedButton(
                      disabledColor: Colors.amber,
                      child: Text("Registrarse"),
                      splashColor: Colors.amber,
                      color: Colors.blueAccent,
                      onPressed: uploadStatusRegistro,
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

  void guardarToDatabase() {
    var dateTime = DateTime.now();
    tfFecha = DateFormat('yyyy-MM-dd – kk:mm').format(dateTime);

    DatabaseReference ref = FirebaseDatabase.instance.reference();
    var data = {
      "nombre": tfNombre,
      "usuario": tfUsuario,
      "clave": tfContrasena,
      "correo": tfCorreo,
      "fechaCreacion": tfFecha,
      "idUser": 1,
    };
    print(data);
    ref.child("Usuario").push().set(data);
  }

  bool validarForm() {
    final form = _formKey.currentState;
    if (form.validate()) {
      // Si el formulario es válido, queremos mostrar un Snackbar
      form.save();
      final snackBar = SnackBar(content: Text('Usuario Registrado'));
      globalKey.currentState.showSnackBar(snackBar);
      return true;
    }
    return false;
  }

  void uploadStatusRegistro() async {
    if (validarForm()) {
      guardarToDatabase();
      Navigator.pop(context);
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return Login();
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
  }
}
