import 'package:flutter/material.dart';
import './first_screen.dart';
import './second_screen.dart';


class OnionSoupMix extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        //global image=Image.asset('assets/images/spice_2.jpg'),
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              'Onion Soup Mix',
              style:TextStyle(fontSize: 25),
            ),
            automaticallyImplyLeading: true,
            backgroundColor:Colors.teal,
            //flexibleSpace:FlexibleSpaceBar(),
            bottom:TabBar(
              tabs: [
                Tab(child:
                Text(
                  'Ingredients',
                  style:TextStyle(fontSize:20),
                ),
                ),
                Tab(child:
                Text(
                  'Directions',
                  style:TextStyle(fontSize:20),
                )),
              ],
            ),
          ),
          body:Column(
              children: [
                Expanded(
                  flex:1,
                  child:Container(
                    color:Colors.black,
                  ),
            ),
                Expanded(
                  flex:2,
                  child: TabBarView(
                    children: [
                      Ingredient(),
                      Directions(),
                    ],
                  ),
                ),
              ],
            ),
          ),

        ),

    );
  }
}

class Ingredient extends StatefulWidget {
  @override
  _IngredientState createState() => _IngredientState();
}

class _IngredientState extends State<Ingredient> {
 List ingredients = ['250g of Rosemary','250g of Cummin','250g of Coriander','200g of BlackPepper','3 sticks of Cinnamon'];
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
class Directions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding:EdgeInsets.symmetric(horizontal:30,vertical:30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children:[
          SizedBox(height:10),
          Text('1.  In a large glass bowl, stir together the vinegar oil, soy sauce, lime juice, lemon juice. Mix in the garlic, brown sugar, lemon pepper, rosemary and salt.',
            style: TextStyle(fontSize: 16.0),
          ),
          SizedBox(height:20),
          Text('2.  In a large glass bowl, stir together the vinegar oil, soy sauce, lime juice, lemon juice. Mix in the garlic, brown sugar, lemon pepper, rosemary and salt.',
            style: TextStyle(fontSize: 16.0),
          ),
          SizedBox(height:20),
          Text('3.  In a large glass bowl, stir together the vinegar oil, soy sauce, lime juice, lemon juice. Mix in the garlic, brown sugar, lemon pepper, rosemary and salt.',
            style: TextStyle(fontSize: 16.0),
          ),
          SizedBox(height:20),
          //Text('4.  In a large glass bowl, stir together the vinegar oil, soy sauce, lime juice, lemon juice. Mix in the garlic, brown sugar, lemon pepper, rosemary and salt.',
          // style: TextStyle(fontSize: 16.0),
          //),
        ],
      ),
    );
  }
}