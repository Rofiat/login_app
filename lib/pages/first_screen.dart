import 'package:flutter/material.dart';
import 'package:login_app/pages/recipe_cards.dart';
import 'package:login_app/pages/suya_spice.dart';

class Ingredient extends StatefulWidget {
  @override
  _IngredientState createState() => _IngredientState();
}

class _IngredientState extends State<Ingredient> {
  List  ingredients = [
    '1/2 cup of brown sugar',
    '1/3 cup of flour',
    '1/2 cup of brown sugar',
    '1/3 cup of flour',
    '1/2 cup of brown sugar',
    '1/3 cup of flour'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:ListView.builder(
        itemCount:ingredients.length,
        itemBuilder:(context,index) {
          return Card(
            child:ListTile(
              //onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context) =>  RecipePage()),);},
              title:Text(
                ingredients[index],
                style:TextStyle(
                  fontSize: 20,
                  //fontWeight: FontWeight.bold,
                ),
              ),
              //trailing: Icon(Icons.keyboard_arrow_right),
            ),

          );
        },
      ),

    );
  }
}