import 'package:multymccarthys/pages/admin/show_recipe.dart';
import 'package:multymccarthys/pages/maps_page.dart';
import 'package:multymccarthys/pages/myrecipes/lits_my_recipe.dart';
import 'package:multymccarthys/widgets/home_page.dart';

abstract class Content {


   Future<HomePageRecipes> lista(); 
   Future<ListMyRecipe> myrecipe(String id);
   Future<MapsPage> mapa(); 
   Future<InicioPage> admin();

 }


 class ContentPage implements Content {

   Future<HomePageRecipes> lista() async {
    return HomePageRecipes();
  }

   Future<MapsPage> mapa() async {
    return MapsPage();
  }
  

  Future<InicioPage> admin() async {
    return InicioPage();
  }

  Future<ListMyRecipe> myrecipe(String id ) async {
    print('listados mis recetas $id'); 
    return ListMyRecipe(id: id,);
  }

 }