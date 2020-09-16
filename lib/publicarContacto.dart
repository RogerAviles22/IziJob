import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
//import 'package:intl/intl.dart';
import 'package:izijob/footer.dart';
//import 'package:izijob/VistaContactar.dart';
import 'package:izijob/sendmail.dart';

//import 'VistaContactar.dart';

class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}

class PublicarContacto extends StatefulWidget {
  @override
  _PublicarContactoState createState() => _PublicarContactoState();
}

class _PublicarContactoState extends State<PublicarContacto>{
  final _formkey = GlobalKey<FormState>();
  TextEditingController _textEditingController = TextEditingController();
  final globalKey = GlobalKey<ScaffoldState>();
  
  String tfnombre,
  tfedad,
  tfprofesion,
  tfservicio,
  tftelefono,
  tfcorreo,
  tfcategoria,
  tfDescripcion;


  Widget build(BuildContext context){
    return Scaffold(key: globalKey,
      appBar: AppBar(
        title: Text("Publicar Contacto"),
                backgroundColor: Colors.blue[900],
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.check,
              color: Colors.white,
            ),
            onPressed: metodos,
          )
        ],
      
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Form(
              key: _formkey,
              child: Scrollbar(
                child: ListView(
                  children: <Widget>[
                    new ListTile(
                        leading: const Icon(Icons.edit),
                        title: TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Nombre',
                            hintText: 'Ej: Víctor Moyano ...',
                          ),
                          validator: (value) {
                            return value.isEmpty
                                ? 'Por favor, ingresa dos nombres y dos apellidos'
                                : null;
                          },
                          onSaved: (value) {
                            return tfnombre = value;
                          },
                        )),
                    new ListTile(
                      leading: const Icon(Icons.cake),
                      
                      title: TextFormField(
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                        controller: _textEditingController,
                        focusNode: AlwaysDisabledFocusNode(),
                        decoration: InputDecoration(
                          labelText: 'Edad',
                          hintText: 'Ej: Señor(a) de tal edad...',
                        ),
                        onTap:(){ showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1819, 1),
                          lastDate: DateTime(2121, 12),
                        ).then((pickedDate) {
                          String fecha = DateFormat('yyyy-MM-dd – kk:mm').format(pickedDate);
                          _textEditingController.text = fecha.substring(0,10);
                          //do whatever you want
                        });},
                        validator: (value) {
                          print(esAdult(value));
                          if (value.isEmpty) {
                            return 'Por favor, ingresa la edad';
                          }
                          if(!esAdult(value)){
                            return 'Debe ser mayor de edad';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          return tfedad = value;
                        },
                      ),
                    ),
                    
                    new ListTile(
                        leading: const Icon(Icons.contact_phone),
                        title: TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Teléfonos',
                            hintText: 'Ej: 098542261,(04)254789...',
                          ),
                          validator: (value) {
                            return value.isEmpty
                                ? 'Por favor, ingresa número(s) telefónico(s).'
                                : null;
                          },
                          onSaved: (value) {
                            return tftelefono = value;
                          },
                        )),
                    new ListTile(
                        leading: const Icon(Icons.contact_mail),
                        title: TextFormField(
                          decoration: InputDecoration(
                            labelText: 'E-mails',
                            hintText: 'E-mails separado por comas.',
                          ),
                          validator: (value) {
                            return value.isEmpty
                                ? 'Por favor, ingresa correo(s) electrónico(s).'
                                : null;
                          },
                          onSaved: (value) {
                            return tfcorreo = value;
                          },
                        )),

                    new ListTile(
                        leading: const Icon(Icons.business_center),
                        title: TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Profesión ',
                            hintText: 'Ej: cocineros, música, ingenieros...',
                          ),
                          validator: (value) {
                            return value.isEmpty
                                ? 'Por favor, ingresa al menos 1 profesión.'
                                : null;
                          },
                          onSaved: (value) {
                            return tfprofesion = value;
                          },
                        )), 
                    new ListTile(
                        leading: const Icon(Icons.assignment),
                        title: TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Servicios',
                            hintText: 'Ej: cocineros, música, ingenieros...',
                          ),
                          validator: (value) {
                            return value.isEmpty
                                ? 'Por favor, ingresa al menos 1 servicio.'
                                : null;
                          },
                          onSaved: (value) {
                            return tfservicio = value;
                          },
                        )),
                    new ListTile(
                      leading: const Icon(Icons.description),
                      title: TextFormField(
                        maxLines: null,
                        decoration: InputDecoration(
                          labelText: "Descripción",
                          hintText: 'Describe de la mejor manera tus aptitudes',

                        ),
                        validator: (value) {
                            return value.isEmpty
                                ? 'Por favor, ingresa al menos 1 servicio.'
                                : null;
                          },
                          onSaved: (value) {
                            return tfDescripcion = value;
                          },
                      )
                    ), 
                         new ListTile(
                        leading: const Icon(Icons.category),
                        title: TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Categorías',
                            hintText: 'Ej: salud, música, cocina...',
                          ),
                          validator: (value) {
                            return value.isEmpty
                                ? 'Por favor, ingresa al menos 1 categoría.'
                                : null;
                          },
                          onSaved: (value) {
                            return tfcategoria = value;
                          },
                        )),                                                  
                  ],
                ),
              ),
            ),
          ),
        ),
      ),);
  }

  void metodos(){
    uploadStatusContacto();
    enviarMail(tfcorreo);
  }

  void uploadStatusContacto() async {
    if (validarForm()) {
      guardarToDatabase();
      Navigator.pop(context);
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return Footer();
      }));
    }
  }

    void guardarToDatabase() {

    DatabaseReference ref = FirebaseDatabase.instance.reference();
    var data = {
      "nombre": tfnombre,
      "edad": tfedad,
      "telefono": tftelefono,
      "correo": tfcorreo,
      "categoria": tfcategoria,
      "profesion": tfprofesion,
      "servicio": tfservicio,
      "idUser": 1,
      "descripcion": tfDescripcion
    };
    print(data);
    ref.child("Contacto").push().set(data);
  }

    bool validarForm() {
    final form = _formkey.currentState;
    if (form.validate()) {
      // Si el formulario es válido, queremos mostrar un Snackbar
      form.save();
      final snackBar = SnackBar(content: Text('Contacto Publicado'));
      globalKey.currentState.showSnackBar(snackBar);
      return true;
    }
    return false;
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

  // _seleccionarFecha(BuildContext context)async{
    
  //       DateTime fechaSeleccionada = await showDatePicker(context: context,
  //        initialDate: _selectedDate != null ? _selectedDate : DateTime.now(),
  //    firstDate: DateTime(2000), lastDate: DateTime(2100),
  //    builder: (BuildContext context, Widget child) {
  //         return Theme(
  //           data: ThemeData.dark().copyWith(
  //             colorScheme: ColorScheme.dark(
  //               primary: Colors.deepPurple,
  //               onPrimary: Colors.white,
  //               surface: Colors.blueGrey,
  //               onSurface: Colors.yellow,
  //             ),
  //             dialogBackgroundColor: Colors.blue[500],
  //           ),
  //           child: child,
  //         );
  //       });
  //       if (fechaSeleccionada!= null) {
  //     _selectedDate = fechaSeleccionada;
  //     _textEditingController
  //       ..text = DateFormat.yMMMd().format(_selectedDate)
  //       ..selection = TextSelection.fromPosition(TextPosition(
  //           offset: _textEditingController.text.length,
  //           affinity: TextAffinity.upstream));
  //   }
  // }

bool esAdult(String fecha){
  print(fecha);
  String datePattern = "yyyy-MM-dd";

  DateTime birthDate = DateFormat(datePattern).parse(fecha);
  DateTime today = DateTime.now();

  int yearDiff = today.year - birthDate.year;
  int monthDiff = today.month - birthDate.month;
  int dayDiff = today.day - birthDate.day;

  return yearDiff > 18 || yearDiff == 18 && monthDiff >= 0 && dayDiff >= 0;
}
  

}