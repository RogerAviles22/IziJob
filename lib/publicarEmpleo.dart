//https://flutter-es.io/docs/cookbook/navigation/navigation-basics
import 'package:flutter/material.dart';

class PublicarEmpleo extends StatefulWidget {
  @override
  _PublicarEmpleoState createState() => _PublicarEmpleoState();
}

//enum SingingCharacter { empleo, cachuelo }

class _PublicarEmpleoState extends State<PublicarEmpleo> {
  final _formKey = GlobalKey<FormState>();
  //SingingCharacter _character = SingingCharacter.empleo;
  final globalKey = GlobalKey<ScaffoldState>();

  final tf_tipo = "Empleo" ;
  final tf_titulo = TextEditingController();
  final tf_descripcion = TextEditingController();
  final tf_exp = TextEditingController();
  final tf_vacantes = TextEditingController();
  final tf_sueldo = TextEditingController();
  final tf_telefono = TextEditingController();
  final tf_email = TextEditingController();
  final tf_categoria = TextEditingController();

  @override
  /*void dispose() {
    // Limpia el controlador cuando el Widget se descarte
    tf_titulo.dispose();
    tf_descripcion.dispose();
    tf_exp.dispose();
    tf_vacantes.dispose();
    tf_sueldo.dispose();
    tf_telefono.dispose();
    tf_email.dispose();
    tf_categoria.dispose();
    super.dispose();
  }*/

  Widget build(BuildContext context) {
    return Scaffold(
      key: globalKey,
      appBar: AppBar(
        title: Text('Publicar Empleo'),
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
              child: ListView(
                children: <Widget>[  
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: 'Título',
                        hintText: 'Ejemplo: Necesito empleador...'),
                    controller: tf_titulo,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Por favor, ingresa el título';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    decoration: InputDecoration(
                      labelText: 'Descripción',
                      hintText:
                          'Ej: Señor(a) de tal edad...',
                    ),
                    controller: tf_descripcion,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Por favor, ingresa la descripción';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    decoration: InputDecoration(
                      labelText: 'Experiencia',
                      hintText:
                          'Ej: Experiencia en dicho campo...',
                    ),
                    controller: tf_exp,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Por favor, ingresa la experiencia necesaria';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Sueldo',
                      hintText: 'Ingresa el posible sueldo',
                    ),
                    controller: tf_sueldo,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Por favor, ingresa el sueldo.';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Vacantes',
                      hintText: 'Ingrese números de vacantes para el puesto',
                    ),
                    controller: tf_vacantes,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Por favor, ingrese números de vacantes.';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Teléfonos',
                      hintText: 'Ingresa los números separado por comas',
                    ),
                    controller: tf_telefono,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Por favor, ingresa número(s) telefónico(s).';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'E-mail',
                      hintText: 'Ingresa e-mails separado por comas.',
                    ),
                    controller: tf_email,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Por favor, ingresa correo(s) electrónico(s).';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Categorías',
                      hintText: 'Ej: cocineros, música, ingenieros...',
                    ),
                    controller: tf_categoria,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Por favor, ingresa al menos 1 categoría.';
                      }
                      return null;
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: Center(
                        child: RaisedButton(
                      color: Colors.blue[900],
                      textColor: Colors.white,
                      onPressed: () {
                        // devolverá true si el formulario es válido, o falso si
                        // el formulario no es válido.
                        if (_formKey.currentState.validate()) {
                          // Si el formulario es válido, queremos mostrar un Snackbar
                          final snackBar = SnackBar(content: Text('Empleo Publicado'));
                          globalKey.currentState.showSnackBar(snackBar);
                          //Navigator.pop(context);
                          /*Scaffold.of(context).showSnackBar(
                              SnackBar(content: Text('Processing Data')));*/
                        }
                        print(tf_descripcion);
                      },
                      child: Text('Enviar'),
                    )),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      backgroundColor : Colors.green,
    );
  }
}
