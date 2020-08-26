//https://flutter-es.io/docs/cookbook/navigation/navigation-basics
import 'package:flutter/material.dart';

class PublicarEmpleo extends StatefulWidget {
  @override
  _PublicarEmpleoState createState() => _PublicarEmpleoState();
}

enum SingingCharacter { empleo, cachuelo }

class _PublicarEmpleoState extends State<PublicarEmpleo> {
  final _formKey = GlobalKey<FormState>();
  SingingCharacter _character = SingingCharacter.empleo;
  final tf_titulo = TextEditingController();

  @override
  void dispose() {
    // Limpia el controlador cuando el Widget se descarte
    tf_titulo.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Publicar Trabajo'),
        backgroundColor: Colors.blue[900],
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Form(
              key: _formKey,
              child: ListView(
                children: <Widget>[
                  Text(
                    "Tipo",
                    textAlign: TextAlign.left,
                  ),
                  ListTile(
                    title: const Text('Empleo'),
                    leading: Radio(
                      value: SingingCharacter.empleo,
                      groupValue: _character,
                      onChanged: (SingingCharacter value) {
                        setState(() {
                          _character = value;
                        });
                      },
                    ),
                  ),
                  ListTile(
                    title: const Text('Cachuelo'),
                    leading: Radio(
                      value: SingingCharacter.cachuelo,
                      groupValue: _character,
                      onChanged: (SingingCharacter value) {
                        setState(() {
                          _character = value;
                        });
                      },
                    ),
                  ),
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
                          'Ej: Experiencia, sueldo, dirección, servicio...',
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Por favor, ingresa la descripción';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Teléfonos',
                      hintText: 'Ingresa los números separado por comas',
                    ),
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
                          Scaffold.of(context).showSnackBar(
                              SnackBar(content: Text('Processing Data')));
                        }
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
    );
  }
}
