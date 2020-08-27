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

  final tf_tipo = "Empleo";
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
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.check,
              color: Colors.white,
            ),
            onPressed: () {
              if (_formKey.currentState.validate()) {
                // Si el formulario es válido, queremos mostrar un Snackbar
                final snackBar = SnackBar(content: Text('Empleo Publicado'));
                globalKey.currentState.showSnackBar(snackBar);
              }
            },
          )
        ],
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
                  new ListTile(
                      leading: const Icon(Icons.title),
                      title: textFormFieldFunction(
                          'Título',
                          'Ej: Necesito empleador...',
                          tf_titulo,
                          'Por favor, ingresa el título')),
                  new ListTile(
                    leading: const Icon(Icons.description),
                    title: TextFormField(
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      decoration: InputDecoration(
                        labelText: 'Descripción',
                        hintText: 'Ej: Señor(a) de tal edad...',
                      ),
                      controller: tf_descripcion,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Por favor, ingresa la descripción';
                        }
                        return null;
                      },
                    ),
                  ),
                  new ListTile(
                    leading: const Icon(Icons.star),
                    title: TextFormField(
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      decoration: InputDecoration(
                        labelText: 'Experiencia',
                        hintText: 'Ej: Experiencia en dicho campo...',
                      ),
                      controller: tf_exp,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Por favor, ingresa la experiencia necesaria';
                        }
                        return null;
                      },
                    ),
                  ),
                  new ListTile(
                    leading: const Icon(Icons.monetization_on),
                    title: textFormFieldFunction(
                        'Sueldo',
                        'Ingresa el posible sueldo',
                        tf_sueldo,
                        'Por favor, ingresa el sueldo.'),
                  ),
                  new ListTile(
                    leading: const Icon(Icons.supervisor_account),
                    title: textFormFieldFunction(
                        'Vacantes',
                        'Números de vacantes para el puesto',
                        tf_vacantes,
                        'Por favor, ingrese números de vacantes.'),
                  ),
                  new ListTile(
                    leading: const Icon(Icons.contact_phone),
                    title: textFormFieldFunction(
                        'Teléfonos',
                        'Teléfonos separado por comas',
                        tf_telefono,
                        'Por favor, ingresa número(s) telefónico(s).'),
                  ),
                  new ListTile(
                    leading: const Icon(Icons.contact_mail),
                    title: textFormFieldFunction(
                        'E-mails',
                        'E-mails separado por comas.',
                        tf_email,
                        'Por favor, ingresa correo(s) electrónico(s).'),
                  ),
                  new ListTile(
                    leading: const Icon(Icons.category),
                    title: textFormFieldFunction(
                      'Categorías',
                      'Ej: cocineros, música, ingenieros...',
                      tf_categoria,
                      'Por favor, ingresa al menos 1 categoría.'),
                  ),                  
                ],
              ),
            ),
          ),
        ),
      ),
      backgroundColor: Colors.green,
    );
  }

  TextFormField textFormFieldFunction(String labelText, String hintText,
      TextEditingController tecontroller, String msgError) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
      ),
      controller: tecontroller,
      validator: (value) {
        if (value.isEmpty) {
          return msgError;
        }
        return null;
      },
    );
  }
}
