import 'package:flutter/material.dart';
import 'package:login_app/model/recipe.dart';
import 'package:login_app/pages/recipe_cards.dart';
import 'package:login_app/pages/recipe_details_screen.dart';
import 'package:login_app/pages/suya_spice.dart';

class SpiceList extends StatelessWidget {

@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        backgroundColor: Colors.grey[200],
        title:Text(
          'Available Recipes',
          style:TextStyle(
          fontSize:20,
            color:Colors.black,
            //fontWeight: FontWeight.bold,
          ),
        ),
        //centerTitle: true,
        elevation:0,
        automaticallyImplyLeading:true,
      ),
      body:ListView.builder(
        itemCount:recipeList.length,
        itemBuilder:(context,index) {
          Recipe recipe = recipeList[index];
          return Card(
            child:ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>  SpiceCard()),
                );
              },
              title:Text(
                recipe.name,
                style:TextStyle(
                  fontSize: 20,
                  //fontWeight: FontWeight.bold,
                ),
              ),
              trailing: Icon(Icons.keyboard_arrow_right),
            ),

          );
        },
      ),

    );
  }
}
