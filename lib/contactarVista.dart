import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:izijob/clases/contactar.dart';
import 'DetailContactar.dart';
import 'publicarContacto.dart';

class ContactarVista extends StatefulWidget {
  @override
  _ContactarState createState() => _ContactarState();
}

class _ContactarState extends State<ContactarVista> {
  List<Contactar> contactarlist = [];
  List<Contactar> contactosFiltrados =[];
  bool busqueda = false;

  @override
  void initState(){
    super.initState();
        DatabaseReference contactoRef =
        FirebaseDatabase.instance.reference().child("Contacto");
      contactoRef.once().then((DataSnapshot snap){
        var keys = snap.value.keys;
        var data = snap.value;
        contactarlist.clear();

        for(var key in keys){
          Contactar contactar = Contactar(
          data[key]['idContactar'],
          data[key]['nombre'],
          data[key]['edad'],
          data[key]['profesion'],
          data[key]['servicio'],
          data[key]['telefono'],
          data[key]['correo'],
          data[key]['categoria'],
          data[key]['idUser']
          );
          setState(() {
          contactarlist.add(contactar);
          contactosFiltrados.add(contactar);
          //contactarlist.sort((a, b) => b.fechaPublicado.compareTo(a.fechaPublicado));
          //filteredEmpleoList.sort((a, b) => b.fechaPublicado.compareTo(a.fechaPublicado));
        });
        }
      }
      );  
  }
  void _filterContactos(value) {
    setState(() {
      contactosFiltrados = contactarlist
          .where((contactos) =>
              contactos.categoria.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
        backgroundColor : Colors.blue[900],
        centerTitle: true,
        title: !busqueda
              ? Text('Contactar')
                          : TextField(
                onChanged: (value) {
                  _filterContactos(value);
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
          busqueda
              ? IconButton(
                  icon: Icon(Icons.cancel),
                  onPressed: () {
                    setState(() {
                      this.busqueda = false;
                      contactosFiltrados = contactarlist;
                    });
                  },
                )
              : IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    setState(() {
                      this.busqueda = true;
                    });
                  },
                )
        ],
      ),
            body: Container(
          //padding: const EdgeInsets.all(5.0),
          child: contactosFiltrados.length == 0
              ? Center(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("No hay información que ver",
                            style: TextStyle(
                              fontFamily: 'Varela',
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            )),
                        SizedBox(
                          height: 20.0,
                        ),
                        CircularProgressIndicator()
                      ]),
                )
              : ListView.builder(
                  itemCount: contactosFiltrados.length,
                  itemBuilder: (_, index) {
                    return postsEmpleo(contactosFiltrados[index]
                        /*empleoList[index].titulo,
                        empleoList[index].fechaPublicado,
                        empleoList[index].descripcion,
                        empleoList[index].categoria,
                        empleoList[index].vacantes*/
                        );
                  })),
      floatingActionButton: FloatingActionButton(
        backgroundColor : Colors.blue[900],
        onPressed: (){     
            Navigator.push(context, MaterialPageRoute(builder: (context) {
            return PublicarContacto();
          }));     
        },
        child: const Icon(Icons.add),
      ),  
      //backgroundColor : Colors.green,
    
      //bottomNavigationBar: Footer()
      );
  }

    Widget postsEmpleo(Contactar contacto) {
    return Card(
        elevation: 10.0,
        margin: EdgeInsets.all(14.0),
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailContactar(contacto: contacto),
              ),
            );
          },
          child: Container(
            padding: EdgeInsets.all(14.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      contacto.nombre,
                      style: TextStyle(
                        fontFamily: 'Varela',
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                      ),
                      //style: Theme.of(context).textTheme.subtitle1,
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      contacto.profesion,
                      style: Theme.of(context).textTheme.subtitle2,
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
                SizedBox(
                  height: 15.0,
                ),
                Text(
                  contacto.servicio,
                  style: Theme.of(context).textTheme.bodyText2,
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  "Categoría: " + contacto.categoria,
                  style: Theme.of(context).textTheme.caption,
                  textAlign: TextAlign.left,
                ),
                SizedBox(
                  height: 10.0,
                ),
                // Align(
                //   alignment: Alignment.centerRight,
                //   child: Text(
                //     "Vacantes: " + empleo.vacantes,
                //     style: Theme.of(context).textTheme.caption,
                //     /*style: TextStyle(
                //         fontFamily: 'Varela',
                //         fontSize: 21.0,
                //       )*/
                //   ),
                // )
              ],
            ),
          ),
        ));
  }
}