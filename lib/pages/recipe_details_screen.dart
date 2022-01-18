import 'package:flutter/material.dart';
import 'package:login_app/model/recipe.dart';

class RecipeDetailsScreen extends StatelessWidget {
  final Recipe recipe;
  RecipeDetailsScreen(this.recipe);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title:Text(recipe.name),
      ),
      body:Padding(
        padding:const EdgeInsets.all(8.0),
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              recipe.name,
              style:TextStyle(
                fontSize:50,
                fontWeight: FontWeight.w600,
                fontStyle: FontStyle.italic,
              ),
            ),
            Text(
              recipe.description,
              style:TextStyle(
                fontSize:30,
                fontWeight: FontWeight.w600,
                fontStyle: FontStyle.italic,
                letterSpacing:1.5,
                wordSpacing:5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
