import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:multymccarthys/auth/auth.dart';
import 'package:multymccarthys/model/user_model.dart';

class ViewUser extends StatefulWidget {

  ViewUser({this.uid,this.foto,this.ciudad, this.email, this.nombre, this.password, this.telefono, this.direccion, this.usuario});
  final String uid;
  final String foto;
  final String nombre;
  final String ciudad;
  final String email;
  final String password;
  final String telefono;
  final String direccion;
  final Usuario usuario; 

  @override
  _ViewUser createState() => _ViewUser();
}

class _ViewUser extends State<ViewUser> {
  final formKey = GlobalKey<FormState>();
  
  String _uid;
  String _nombre;
  String _ciudad;
  String _email;
  String _password;
  String _telefono;
  String _direccion;

  Auth auth = Auth();
  bool _isInAsyncCall = false;
  String usuario;

  @override
  void initState() {
    setState(() {
      this._nombre = widget.usuario.nombre;
      this._ciudad = widget.usuario.ciudad;
      this._email = widget.usuario.email;
      this._telefono = widget.usuario.telefono;
      this._direccion = widget.usuario.direccion;
    });

    print('uid receta : ' + widget.uid);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Visualizar Usuarios de Multi McCarthys'),
        ),
        body: ModalProgressHUD(
            inAsyncCall: _isInAsyncCall,
            opacity: 0.5,
            dismissible: false,
            progressIndicator: CircularProgressIndicator(),
            color: Colors.blueGrey,
            child: SingleChildScrollView(
              padding: EdgeInsets.only(left: 10, right: 15),
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    TextFormField(
                      enabled: false,
                      keyboardType: TextInputType.text,
                      initialValue: _nombre,
                      decoration: InputDecoration(
                        labelText: 'Nombre del Usuario',
                      ),
                      validator: (value) =>
                          value.isEmpty ? 'El campo Nombre esta vacio' : null,
                      onSaved: (value) => _nombre = value.trim(),
                    ),
                    TextFormField(
                      enabled: false,
                      keyboardType: TextInputType.text,
                      initialValue: _ciudad,
                      decoration: InputDecoration(
                        labelText: 'Ciudad del usuario',
                      ),
                      validator: (value) =>
                          value.isEmpty ? 'El campo Nombre esta vacio' : null,
                      onSaved: (value) => _ciudad = value.trim(),
                    ),
                    TextFormField(
                      enabled: false,
                      keyboardType: TextInputType.text,
                      initialValue: _email,
                      decoration: InputDecoration(
                        labelText: 'Correo del usuario',
                      ),
                      validator: (value) =>
                          value.isEmpty ? 'El campo Nombre esta vacio' : null,
                      onSaved: (value) => _email = value.trim(),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 50),
                    )
                  ],
                ),
              ),
            )),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,        
        );
  }
}