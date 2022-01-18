import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_app/pages/login_page.dart';
import 'package:login_app/pages/onionsoupmix.dart';
import 'package:login_app/pages/recipe_list.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:login_app/pages/suya_spice.dart';
//import 'package:login_app/pages/testing.dart';
//import 'file:///C:/Users/User/AndroidStudioProjects/login_app/lib/testing.dart';

void main() {
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title:'Login Screen',
      debugShowCheckedModeBanner: false,
      theme:ThemeData(
        fontFamily:'Poppins',
        primaryColor:Colors.white,
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          elevation: 0,
          //foregroundColor: Colors.white,
        ),
        accentColor: Colors.teal,
        textTheme: TextTheme(
          headline1:TextStyle(fontSize:22, color:Colors.greenAccent),
          headline2: TextStyle(fontSize:24,fontWeight:FontWeight.w700,color:Colors.green),
          headline3: TextStyle(fontSize:23,fontWeight:FontWeight.w700,color:Colors.green),
          headline4: TextStyle(fontSize:20,fontWeight:FontWeight.w700,color:Colors.green),
          bodyText1: TextStyle(
            fontSize:14, fontWeight: FontWeight.w400, color:Colors.green,
          ),
        ),
      ),
      home:HomePage(),

        routes: {
          '/login': (context) => LoginPage(),
          '/suyaspice': (context) => SuyaSpice(),
          '/onionsoupmix': (context) => OnionSoupMix(),
          '/spiceList':(context) => SpiceList(),
        });

  }
}

class HomePage extends StatelessWidget {
  List <PageViewModel> getPages(){
    return[
      PageViewModel(
        image:Image.asset('assets/images/spice_1.jpg'),
        title:'Welcome to the world of Spices and Herbs',
        body:'This is an avenue to learn about the importance of herbs and spices and most importantly how to mix them for your meals!',
        footer:Text("@wumy spices"),
      ),
      PageViewModel(
        image:Image.asset('assets/images/spice_2.jpg'),
        title:'Welcome to the world of Spices and Herbs',
        body:'So much to learn to give your meal super-delicious and yummy taste!!',
        footer:Text("@wumy spices"),
      ),
      PageViewModel(
        image:Image.asset('assets/images/spice_3.jpg'),
        title:'Welcome to the world of Spices and Herbs',
        body:'Come and register with us to get the best of all the natural spices and herbs!!!',
        footer:Text("@wumy spices"),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    //final size = MediaQuery.of(context).size;
    return Container(
      decoration:BoxDecoration(
        image:DecorationImage(
          image:AssetImage('assets/images/bg.jpg'),
          fit:BoxFit.cover,
          colorFilter:ColorFilter.mode(
            Colors.black.withOpacity(0.4),
            BlendMode.darken,
          ),
        ),
      ),
      child:Scaffold(
        body:IntroductionScreen(
        done:Text(
          'Done',
          style:TextStyle(
            color:Colors.black,
            //color:kPrimaryColor,
          ),
        ),
        onDone:() {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) =>  LoginPage()));
        },
        pages:getPages(),
        //globalBackgroundColor:Colors.transparent,
      ),
      ),
    );

  }
}

