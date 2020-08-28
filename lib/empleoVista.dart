import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:izijob/clases/empleo.dart';
import 'package:izijob/publicarEmpleo.dart';

class EmpleoVista extends StatefulWidget {
  @override
  _EmpleoVistaState createState() => _EmpleoVistaState();
}

class _EmpleoVistaState extends State<EmpleoVista> {
  List<Empleo> empleoList = [];
  bool isBusqueda = false;

  @override
  void initState() {
    super.initState();
    DatabaseReference empleoRef =
        FirebaseDatabase.instance.reference().child("Empleo");
    empleoRef.once().then((DataSnapshot snap) {
      var keys = snap.value.keys;
      var data = snap.value;
      empleoList.clear();

      for (var individualKey in keys) {
        Empleo empleo = Empleo(
            data[individualKey]['titulo'],
            data[individualKey]['descripcion'],
            data[individualKey]['telefono'],
            data[individualKey]['email'],
            data[individualKey]['categoria'],
            data[individualKey]['fechaP'],
            data[individualKey]['tiempoP'],
            data[individualKey]['idUser'],
            data[individualKey]['experiencia'],
            data[individualKey]['sueldo'],
            data[individualKey]['vacantes']);

        empleoList.add(empleo);
      }

      setState(() {
        print("Longitud: $empleoList.length");
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        centerTitle: true,
        title: !isBusqueda
            ? Text('Empleo')
            : TextField(
                onChanged: (value) {
                  print(value);
                },
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                    icon: Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                    hintText: "Filtra por Categoría",
                    hintStyle: TextStyle(color: Colors.white)),
              ),
        actions: <Widget>[
          isBusqueda
              ? IconButton(
                  icon: Icon(Icons.cancel),
                  onPressed: () {
                    setState(() {
                      this.isBusqueda = false;
                    });
                  },
                )
              : IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    setState(() {
                      this.isBusqueda = true;
                    });
                  },
                )
        ],
      ),

      body: Container(
          //padding: const EdgeInsets.all(5.0),
          child: empleoList.length == 0
              ? Text("No hay Empleos :(")
              : ListView.builder(
                  itemCount: empleoList.length,
                  itemBuilder: (_, index) {
                    return postsEmpleo(
                        empleoList[index].titulo,
                        empleoList[index].fechaPublicado,
                        empleoList[index].descripcion,
                        empleoList[index].categoria,
                        empleoList[index].vacantes);
                  })),

      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue[900],
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return PublicarEmpleo();
          }));
        },
        child: const Icon(Icons.add),
      ),
      //backgroundColor: Colors.green,
      //bottomNavigationBar: Footer()
    );
  }

  Widget postsEmpleo(String titulo, String fecha, String descripcion,
      String categoria, String vacantes) {
    return Card(
      elevation: 10.0,
      margin: EdgeInsets.all(14.0),
      child: Container(
        padding: EdgeInsets.all(14.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  titulo,
                  style: Theme.of(context).textTheme.subtitle1,
                  textAlign: TextAlign.center,
                  
                ),
                Text(
                  fecha,
                  style: Theme.of(context).textTheme.subtitle2,
                  textAlign: TextAlign.center,
                )
              ],
            ),
            SizedBox(height: 15.0,),
            Text(
              descripcion,
              style: Theme.of(context).textTheme.bodyText2,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10.0,),
            Text(
              "Categoría: "+categoria,
              style: Theme.of(context).textTheme.caption,
              textAlign: TextAlign.left,
            ),
            SizedBox(height: 10.0,),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
              "Vacantes: "+vacantes,
              style: Theme.of(context).textTheme.caption,
              
            ),

            )
            
          ],
        ),
      ),
    );
  }
}
