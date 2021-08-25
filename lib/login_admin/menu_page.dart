import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:multymccarthys/auth/auth.dart';
import 'package:multymccarthys/login_admin/contentPage.dart';
import 'package:multymccarthys/widgets/home_page.dart';
//import 'package:multymccarthys/pages/admin/mostrargrid_page.dart';
//import 'package:multymccarthys/widgets/home/home_page.dart';

const PrimaryColor = const Color(0xFF19212B);

class HomePage extends StatefulWidget {
  HomePage({this.auth, this.onSignedOut});
  final BaseAuth auth;
  final VoidCallback onSignedOut;
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  String usuario = 'Usuario';//user
  String usuarioEmail = 'Email';//userEmail
  String id;

  Content page = ContentPage() ;  

  Widget contentPage = HomePageRecipes();//Pagina principal recetas
   

  void _signOut() async {
    try {
      widget.auth.signOut();
      widget.onSignedOut();
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    widget.auth.infoUser().then((onValue) {
      setState(() {
        usuario = onValue.displayName;
        usuarioEmail = onValue.email;
        id=onValue.uid;
        print('ID $id');
      });
    }
    );
  }

  //from now you can see the code in Github of all this
  @override
  Widget build(BuildContext context) {
    return Scaffold(   
      drawer: Drawer(        
          elevation: 30.0,
          child: Container(
            color: Color(0xFF19212B),      
            child: ListView(
              children: <Widget>[
                UserAccountsDrawerHeader(
                  currentAccountPicture: CircleAvatar(
                    maxRadius: 10.0,
                    backgroundImage: AssetImage('assets/images/logoMC.jpg'),
                    //backgroundImage: NetworkImage('https://abc'),
                  ),
                  accountName: Text(
                    '$usuario',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  accountEmail: Text('$usuarioEmail',
                      style: TextStyle(color: Colors.white)),
                  decoration: BoxDecoration(
                      color: Color(0xFF262F3D),
                      image: DecorationImage(
                        alignment: Alignment(1.0, 0),
                        image: AssetImage(
                          'assets/images/irlanda.png', 
                        ),
                        fit: BoxFit.scaleDown, //BoxFit.fitHeight
                      )),
                ),
                
                 ListTile(
                  onTap: () {
                    Navigator.of(context).pop();
                     page.lista().then((value) {
                      print(value);
                      setState(() {
                        contentPage = value;
                      });
                    });
                  },
                  leading: Icon(Icons.home, color: Color(0xFF4FC3F7),),
                  title: Text('Menu McCarthy´s', style: TextStyle(color: Colors.white),),
                ),
                Divider(height: 2.0, color: Colors.white,),
                 ListTile(
                  onTap: () {
                    Navigator.of(context).pop();
                     page.myrecipe(id).then((value) {
                      print(value);
                      setState(() {
                        contentPage = value;
                      });
                    });
                  },
                  leading: Icon(FontAwesomeIcons.pizzaSlice, color: Color(0xFF4FC3F7),),
                  title: Text('Especialidades McCarthy´s', style: TextStyle(color: Color(0xFF4FC3F7)),),
                ),   
                ListTile(
                  onTap: () {
                    Navigator.of(context).pop();
                     page.admin().then((value) {
                      print(value);
                      setState(() {
                        contentPage = value;
                      });
                    });
                  },
                  leading: Icon(FontAwesomeIcons.hamburger, color: Color(0xFF4FC3F7),),
                  title: Text('Menu Global McCarthy´s', style: TextStyle(color: Color(0xFF4FC3F7)),),
                ),               
                ListTile(
                  onTap: () {
                    Navigator.of(context).pop();
                     page.mapa().then((value) {
                      print(value);
                      setState(() {
                        contentPage = value;
                      });
                    });
                  },
                  leading: Icon(FontAwesomeIcons.map, color: Color(0xFF4FC3F7),),
                  title: Text('Mapa de la sucursal McCarthy´s', style: TextStyle(color: Color(0xFF4FC3F7)),),
                ),
                ListTile(
                  onTap: () {
                    Navigator.of(context).pop();
                     page.mapa().then((value) {
                      print(value);
                      setState(() {
                        contentPage = value;
                      });
                    });
                  },
                  leading: Icon(FontAwesomeIcons.image, color: Color(0xFF4FC3F7),),
                  title: Text('Banners', style: TextStyle(color: Color(0xFF4FC3F7)),),
                ),
                ListTile(
                  onTap: () {
                    Navigator.of(context).pop();
                     page.mapa().then((value) {
                      print(value);
                      setState(() {
                        contentPage = value;
                      });
                    });
                  },
                  leading: Icon(FontAwesomeIcons.users, color: Color(0xFF4FC3F7),),
                  title: Text('Empleados', style: TextStyle(color: Color(0xFF4FC3F7)),),
                ),
                 ListTile(
                  onTap: () {
                    Navigator.of(context).pop();
                     page.calculator().then((value) {
                      print(value);
                      setState(() {
                        contentPage = value;
                      });
                    });
                  },
                  leading: Icon(FontAwesomeIcons.calculator, color: Color(0xFF4FC3F7),),
                  title: Text('Calculadora MultyMcCarthy´s', style: TextStyle(color: Color(0xFF4FC3F7)),),
                ),
                ListTile(
                  onTap: () {
                    Navigator.of(context).pop();
                     page.information().then((value) {
                      print(value);
                      setState(() {
                        contentPage = value;
                      });
                    });
                  },
                  leading: Icon(FontAwesomeIcons.info, color: Color(0xFF4FC3F7),),
                  title: Text('Mas sobre nosotros', style: TextStyle(color: Color(0xFF4FC3F7)),),
                ),             
                ListTile(
                  title: Text('Cerrar Sesión', style: TextStyle(color: Color(0xFF4FC3F7)),),
                  leading: Icon(Icons.exit_to_app, color: Color(0xFF4FC3F7),),        
                  onTap: () {
                    Navigator.of(context).pop();
                    _signOut();
                  },
                ),
              ],
            ),
          )),
     appBar: AppBar(
       backgroundColor: PrimaryColor,
        title: Text('Multy McCarthy´s'),        
         actions: <Widget>[
          IconButton(
            icon: Icon(Icons.grid_on),
            tooltip: 'Grid',
            onPressed: () { 
            //   Route route = MaterialPageRoute(builder: (context) => GridPageInicio());
            //  Navigator.push(context, route);            
            },
          ),
        ],
      ), 
      body: contentPage,
    );
  }
  }