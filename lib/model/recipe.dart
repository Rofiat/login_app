import 'package:flutter/material.dart';
import 'package:login_app/main.dart';
import 'package:login_app/pages/suya_spice.dart';

class Recipe {
  String name;
  //String imageUrl;
  String description;
  List<String> ingredients = <String>[];
  String routes;

  Recipe(
  {
    @required this.name,@required this.description,@required this.routes,
});
}

List<Recipe> recipeList = [
  Recipe(
    name:'Onion Soup Mix',
    description:'lorem ipsum smth smth smth lorem ipsum smth smth smth lorem ipsum smth smth smth',
    //ingredients :'[250g of Rosemary,250g of Cummin,250g of Coriander,200g of BlackPepper,3 sticks of Cinnamon]',
    routes:'/onionsoupmix',
  ),Recipe(
    name:'Suya Spice',
    description: 'lorem ipsum smth smth smth lorem ipsum smth smth smth lorem ipsum smth smth smth',
    routes:'/suyaspice',
  ),Recipe(
    name:'Cajun Spice',
    description: 'lorem ipsum smth smth smth lorem ipsum smth smth smth lorem ipsum smth smth smth',
  ),Recipe(
    name:'Curry Seasoning',
    description: 'lorem ipsum smth smth smth lorem ipsum smth smth smth lorem ipsum smth smth smth',
  ),Recipe(
    name:'Taco Mix',
    description: 'lorem ipsum smth smth smth lorem ipsum smth smth smth lorem ipsum smth smth smth',
  ),Recipe(
    name:'Italian Seasoning',
    description: 'lorem ipsum smth smth smth lorem ipsum smth smth smth lorem ipsum smth smth smth',
  ),Recipe(
    name:'Barbecue Spice Rub',
    description: 'lorem ipsum smth smth smth lorem ipsum smth smth smth lorem ipsum smth smth smth',
  ),Recipe(
    name:'Seasoning',
    description: 'lorem ipsum smth smth smth lorem ipsum smth smth smth lorem ipsum smth smth smth',
  ), Recipe(
    name:'Chilli Pepper Mix',
    description: 'lorem ipsum smth smth smth lorem ipsum smth smth smth lorem ipsum smth smth smth',
  ),


];