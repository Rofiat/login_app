import 'package:flutter/material.dart';
import 'package:login_app/model/recipe.dart';
import 'package:login_app/pages/suya_spice.dart';

class SpiceCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        backgroundColor: Colors.grey[200],
        title:Text(
          'Card of Spices',
          style:TextStyle(
            fontSize:30,
            color:Colors.black,
            //fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        elevation:0,
      ),
      body:ListView.builder(
        itemCount:recipeList.length,
        itemBuilder:(context,index) {
          Recipe recipe = recipeList[index];
          return  Card(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white, width: 1),
                  boxShadow:[
                    BoxShadow(
                      //offset:Offset(0,8),
                      blurRadius: 20,
                      color:Colors.white,
                    ),
                  ],
                ),
                child: Container(
                  padding:EdgeInsets.fromLTRB(15, 20, 10, 15),
                  width: 300,
                  height: 200,
                  decoration: const BoxDecoration(
                    //color: Colors.grey,
                    border: Border(
                      left: BorderSide(width:150, color:Colors.blueGrey),
                    ),
                  ),

                  child:Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            recipe.name,
                            style:TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height:10.0),
                      Row(
                        children: [
                          Icon(Icons.star), Icon(Icons.star), Icon(Icons.star), Icon(Icons.star),
                          Icon(Icons.star_border_sharp),
                        ],
                      ),
                      SizedBox(height:10.0),
                      Row(
                        children: [
                          Text("-------------------------",
                            style: TextStyle(fontSize: 20, color: Colors.grey),
                            overflow: TextOverflow.fade,
                            maxLines: 1,
                          ),
                        ],
                      ),
                      SizedBox(height:10.0),
                      Row(
                        children: [
                          Icon(Icons.circle),
                          SizedBox(width:5),
                          Text(
                            'By Wumy Spices',
                            style:TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      FlatButton(
                        onPressed: (){
                          Navigator.pushNamed(context,recipe.routes);
                        },
                        child:Text(
                          'Login',
                          style:TextStyle(color:Colors.white),
                        ),
                        color:Theme.of(context).accentColor,
                        shape:StadiumBorder(),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );

        },
      ),

    );
  }
}

