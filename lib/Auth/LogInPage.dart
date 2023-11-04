import 'package:ecommerce/Auth/forgot_password.dart';
import 'package:ecommerce/Auth/signup.dart';
import 'package:ecommerce/BottomBar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();

  var email = "";
  var password = "";
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  userLogin() async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => BottomBar(),
        ),
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print("No User Found for that Email");
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.orangeAccent,
            content: Text(
              "No User Found for that Email",
              style: TextStyle(fontSize: 18.0, color: Colors.black),
            ),
          ),
        );
      } else if (e.code == 'wrong-password') {
        print("Wrong Password Provided by User");
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.orangeAccent,
            content: Text(
              "Wrong Password Provided by User",
              style: TextStyle(fontSize: 18.0, color: Colors.black),
            ),
          ),
        );
      }
    }
  }
  bool isLoading = false;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () async{
        final value= await
        showDialog<bool>(context: context, builder: (builder){
          return AlertDialog(
            title: Text("AJ Bazar"),
            content: Text("Do you want to Exit?"),
            actions: [
              TextButton(onPressed: (){
                Navigator.of(context).pop(false);
              }, child: Text("No")),
              TextButton(onPressed: (){
                Navigator.of(context).pop(true);
              }, child: Text("Yes"))
            ],
          );
        });
        if(value!= null){
          return Future.value(value);
        }else{
          return Future.value(false);
        }
      },
      child: Scaffold(
        body: Container(
          width: double.infinity,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  colors: [
                    Colors.orange.shade900,
                    Colors.orange.shade800,
                    Colors.orange.shade400
                  ]
              )
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 70,),
              Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[

                    Text("Login", style: TextStyle(color: Colors.white, fontSize: 40),),
                    SizedBox(height: 10,),
                    Text("Welcome to AJ Bazar", style: TextStyle(color: Colors.white, fontSize: 18),),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(60), topRight: Radius.circular(60))
                  ),
                  child: Form(
                    key: _formKey,
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                      child: ListView(
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 10.0),
                            child: TextFormField(
                              // autofocus: false,
                              decoration: InputDecoration(
                                labelText: 'Email: ',
                                labelStyle: TextStyle(fontSize: 20.0, color: Colors.deepOrange.shade500),
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.deepOrange.shade500, width: 2)
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.deepOrange.shade500, width: 2)
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.deepOrange.shade500, width: 2)
                                ),
                                errorStyle:
                                TextStyle(color: Colors.red, fontSize: 15),
                              ),
                              controller: emailController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please Enter Email';
                                } else if (!value.contains('@')) {
                                  return 'Please Enter Valid Email';
                                }
                                return null;
                              },
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 10.0),
                            child: TextFormField(
                              autofocus: false,
                              obscureText: true,
                              decoration: InputDecoration(
                                labelText: 'Password: ',
                                labelStyle: TextStyle(fontSize: 20.0, color: Colors.deepOrange.shade500),
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.deepOrange.shade500, width: 2)
                                ),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.deepOrange.shade500, width: 2)
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.deepOrange.shade500, width: 2)
                                ),
                                errorStyle:
                                TextStyle(color: Colors.redAccent, fontSize: 15),
                              ),
                              controller: passwordController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please Enter Password';
                                }
                                return null;
                              },
                            ),
                          ),
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ElevatedButton(
                                  onPressed: () {
                                    // Validate returns true if the form is valid, otherwise false.
                                    if (_formKey.currentState!.validate()) {
                                      setState(() {
                                        email = emailController.text;
                                        password = passwordController.text;
                                      });
                                      userLogin();
                                      isLoading = true;
                                      Future.delayed(Duration(seconds: 3), (){
                                        setState(() {
                                          isLoading = false;
                                        });
                                      });
                                    }

                                  },
                                  style: ButtonStyle(
                                      backgroundColor: MaterialStateProperty.all(Colors.deepOrange.shade500)
                                  ),
                                  child: isLoading? CircularProgressIndicator(color: Colors.white):
                                  Text(
                                    'Login',
                                    style: TextStyle(fontSize: 18.0),
                                  ),
                                ),
                                TextButton(
                                  onPressed: () => {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => ForgotPassword(),
                                      ),
                                    )
                                  },
                                  child: Text(
                                    'Forgot Password?',
                                    style: TextStyle(fontSize: 16.0,color: Colors.deepOrange.shade500),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Don't have an Account?"),
                                TextButton(
                                  onPressed: () => {
                                    Navigator.pushAndRemoveUntil(
                                        context,
                                        PageRouteBuilder(
                                          pageBuilder: (context, a, b) => Signup(),
                                          transitionDuration: Duration(seconds: 0),
                                        ),
                                            (route) => false)
                                  },
                                  child: Text('Signup', style: TextStyle(fontSize: 16.0,color: Colors.deepOrange.shade500),),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 20,),
                          Center(child: Text("Continue with social media", style: TextStyle(color: Colors.grey),)),
                          SizedBox(height: 30,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                width: size.width*.33,
                                height: size.height*.08,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: Colors.blue
                                ),
                                child: Center(
                                  child: Text("Facebook",
                                    style: TextStyle(color: Colors.white,
                                        fontWeight: FontWeight.bold, fontSize: 18.0),),
                                ),
                              ),
                              SizedBox(width: 30,),
                              Container(
                                width: size.width*.33,
                                height: size.height*.08,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: Colors.red.shade400
                                ),
                                child: Center(
                                  child: Text("Gmail",
                                    style: TextStyle(color: Colors.white,
                                        fontWeight: FontWeight.bold, fontSize: 18.0),),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
