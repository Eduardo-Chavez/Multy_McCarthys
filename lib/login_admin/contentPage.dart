import 'package:multymccarthys/pages/admin/show_recipe.dart';
import 'package:multymccarthys/pages/calculator_page.dart';
import 'package:multymccarthys/pages/information/view_information.dart';
import 'package:multymccarthys/pages/maps.dart';
import 'package:multymccarthys/pages/myrecipes/list_my_recipe.dart';
import 'package:multymccarthys/widgets/home_page.dart';

abstract class Content {


   Future<HomePageRecipes> lista(); 
   Future<ListMyRecipe> myrecipe(String id);
   Future<MapsPage> mapa(); 
   Future<InicioPage> admin();
   Future<Information> information();
   Future<Calculator> calculator();
   //Future<Banner> banner();
   //Future<Empleado> empleado();

 }


 class ContentPage implements Content {

   Future<HomePageRecipes> lista() async {
    return HomePageRecipes();
  }

   Future<MapsPage> mapa() async {
    return MapsPage();
  }

  Future<Information> information() async {
    return Information();
  }

  /*Future<Empleado> empleado() async {
    return Empleado();
  }

  Future<Banner> banner() async {
    return Banner();
  }*/

  Future<Calculator> calculator() async {
    return Calculator();
  }
  
  Future<InicioPage> admin() async {
    return InicioPage();
  }

  Future<ListMyRecipe> myrecipe(String id ) async {
    print('listados mis recetas $id'); 
    return ListMyRecipe(id: id,);
  }

 }