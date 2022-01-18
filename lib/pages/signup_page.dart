import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_app/model/login_model.dart';
import 'package:login_app/api/api_service.dart';
import 'package:login_app/model/signup_model.dart';
import 'package:login_app/pages/recipe_list.dart';
import '../ProgressHUD.dart';
import 'login_page.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  GlobalKey<FormState> globalFormKey = new GlobalKey<FormState>();
  bool hidePassword = true;
  SignupRequestModel signupRequestModel;
  bool isApiCallProcess = false;
  @override
  void initState(){
    super.initState();
    signupRequestModel = new SignupRequestModel();
  }

  @override
  Widget build(BuildContext context) {
    return ProgressHUD(
      child:_uiSetup(context),
      inAsyncCall:isApiCallProcess,
      opacity:0.3,
    );
  }


  Widget _uiSetup(BuildContext context) {
    return Scaffold(
      key:scaffoldKey,
      backgroundColor:Theme.of(context).accentColor,
      body:SingleChildScrollView(
        child:Column(
          //crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Stack(
              children: [
                Container(
                  width:double.infinity,
                  padding:EdgeInsets.symmetric(horizontal:50,vertical:20),
                  margin:EdgeInsets.symmetric(horizontal:20,vertical:70),

                  decoration:BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color:Theme.of(context).primaryColor,
                    boxShadow:[
                      BoxShadow(
                          color:Theme.of(context).hintColor.withOpacity(0.2),
                          offset:Offset(0,10),
                          blurRadius:20),
                    ],
                  ),

                  child:Form(
                      key:globalFormKey,
                      child:Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          SizedBox(height:25),
                          Text(
                            'signup',
                            style:Theme.of(context).textTheme.headline2,
                          ),
                          SizedBox(height:20),
                          new TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            onSaved:(input)=>signupRequestModel.email=input,
                            validator:(input)=> !input.contains('@')?"Email Id should be valid":null,
                            decoration:new InputDecoration(
                              hintText:"Email Address",
                              enabledBorder: UnderlineInputBorder(
                                borderSide:BorderSide(
                                  color:Theme.of(context).accentColor.withOpacity(0.2),
                                ),
                              ),
                              focusedBorder:UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color:Theme.of(context).accentColor,
                                  )
                              ),
                              prefixIcon:Icon(
                                Icons.email,
                                color:Theme.of(context).accentColor,
                              ),
                            ),
                          ),
                          SizedBox(height:10),

                          //password1
                        new TextFormField(
                            keyboardType: TextInputType.text,
                            onSaved:(input)=>signupRequestModel.password=input,
                            //validator:(input)=> input.length<3 ?"Password should be more than 3 characters":null,
                            obscureText:hidePassword,
                            decoration:new InputDecoration(
                              hintText:"Password",
                              enabledBorder: UnderlineInputBorder(
                                borderSide:BorderSide(
                                  color:Theme.of(context).accentColor.withOpacity(0.2),
                                ),
                              ),
                              focusedBorder:UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color:Theme.of(context).accentColor,
                                  )
                              ),
                              prefixIcon:Icon(
                                Icons.lock,
                                color:Theme.of(context).accentColor,
                              ),
                              suffixIcon: IconButton(
                                onPressed:(){
                                  setState(() {
                                    hidePassword=!hidePassword;
                                  });
                                },
                                color:Theme.of(context).accentColor.withOpacity(0.4),
                                icon:Icon(hidePassword?Icons.visibility_off:Icons.visibility),
                              ),

                            ),
                          ),
                          SizedBox(height:10),
                          //password2
                          new TextFormField(
                            keyboardType: TextInputType.text,
                            onSaved:(input)=>signupRequestModel.confirm_password=input,
                            //validator:(input)=> input.length<3 ?"Password should be more than 3 characters":null,
                            obscureText:hidePassword,
                            decoration:new InputDecoration(
                              hintText:"Password",
                              enabledBorder: UnderlineInputBorder(
                                borderSide:BorderSide(
                                  color:Theme.of(context).accentColor.withOpacity(0.2),
                                ),
                              ),
                              focusedBorder:UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color:Theme.of(context).accentColor,
                                  )
                              ),
                              prefixIcon:Icon(
                                Icons.lock,
                                color:Theme.of(context).accentColor,
                              ),
                              suffixIcon: IconButton(
                                onPressed:(){
                                  setState(() {
                                    hidePassword=!hidePassword;
                                  });
                                },
                                color:Theme.of(context).accentColor.withOpacity(0.4),
                                icon:Icon(hidePassword?Icons.visibility_off:Icons.visibility),
                              ),

                            ),
                          ),
                          SizedBox(height:30),
                          FlatButton(
                            padding:EdgeInsets.symmetric(horizontal:80,vertical:12),
                            onPressed:(){
                              if(validateAndSave()){
                                Map response= signupRequestModel.toJson();
                                String pass1=response['password'];
                                String pass2=response['confirm_password'];
                                setState(() {
                                  isApiCallProcess = true;
                                });
                                SignupApiService apiService = new SignupApiService();
                                apiService.register(signupRequestModel).then((value){
                                  if(value!=null&&pass1==pass2){
                                    setState(() {
                                      isApiCallProcess = false;
                                    });
                                    if(value.token.isNotEmpty){
                                      print ("yes, you did it!");
                                      final snackBar = SnackBar(content:Text("signup Successful!"));
                                      scaffoldKey.currentState.showSnackBar(snackBar);
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => LoginPage()),
                                      );
                                      //print ("yes, you did it!");
                                    }else {
                                      print("oops!something went wrong");
                                      final snackBar = SnackBar(content: Text(value.error));
                                      scaffoldKey.currentState.showSnackBar(snackBar);
                                      //print("oops!something went wrong");
                                    }
                                  }
                                  String errorValue="Mismatch password or Empty fields!";
                                  final snackBar = SnackBar(content: Text(errorValue));
                                  scaffoldKey.currentState.showSnackBar(snackBar);
                                });
                              }
                            },
                            child:Text(
                              'signup',
                              style:TextStyle(color:Colors.white),
                            ),
                            color:Theme.of(context).accentColor,
                            shape:StadiumBorder(),
                          ),

                        ],
                      )
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
  bool validateAndSave() {
    final form = globalFormKey.currentState;
      if (form.validate()) {
        form.save();
        return true;
      }
      return false;
    }
  }

