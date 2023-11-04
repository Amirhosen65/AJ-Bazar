import 'package:ecommerce/Auth/LogInPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class Signup extends StatefulWidget {
  Signup({Key? key}) : super(key: key);

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final _formKey = GlobalKey<FormState>();

  var name = "";
  var phone = "";
  var email = "";
  var password = "";
  var confirmPassword = "";

  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  registration() async {
    if (password == confirmPassword) {
      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.green.shade600,
            content: Text(
              "Registered Successfully. Please Login..",
              style: TextStyle(fontSize: 20.0, color: Colors.white,
            ),
          ),
        ));
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => Login(),
          ),
        );
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          print("Password Provided is too Weak");
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.yellow,
              content: Text(
                "Password Provided is too Weak",
                style: TextStyle(fontSize: 18.0, color: Colors.black),
              ),
            ),
          );
        } else if (e.code == 'email-already-in-use') {
          print("Account Already exists");
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.orangeAccent,
              content: Text(
                "Account Already exists",
                style: TextStyle(fontSize: 18.0, color: Colors.black),
              ),
            ),
          );
        }
      }
    } else {
      print("Password and Confirm Password doesn't match");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          content: Text(
            "Password and Confirm Password doesn't match",
            style: TextStyle(fontSize: 16.0, color: Colors.white),
          ),
        ),
      );
    }
  }
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
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
            SizedBox(height: 35,),
            IconButton(
                onPressed: (){
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back, size: 40,color: Colors.white,)),
            SizedBox(height: 25,),
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("Sign Up", style: TextStyle(color: Colors.white, fontSize: 40),),
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
                            autofocus: false,
                            decoration: InputDecoration(
                              labelText: 'Full Name: ',labelStyle: TextStyle(fontSize: 20.0, color: Colors.deepOrange.shade500),
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
                            controller: nameController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please Enter Your Full Name';
                              }
                              return null;
                            },
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 10.0),
                          child: TextFormField(
                            autofocus: false,
                            decoration: InputDecoration(
                              labelText: 'Phone Number: ',labelStyle: TextStyle(fontSize: 20.0, color: Colors.deepOrange.shade500),
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
                            controller: phoneController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please Enter Valid Phone Number';
                              } else if (!value.contains('01')) {
                                return 'Please Enter Valid Phone Number';
                              }
                              return null;
                            },
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 10.0),
                          child: TextFormField(
                            autofocus: false,
                            decoration: InputDecoration(
                              labelText: 'Email: ',labelStyle: TextStyle(fontSize: 20.0, color: Colors.deepOrange.shade500),
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
                          margin: EdgeInsets.symmetric(vertical: 10.0),
                          child: TextFormField(
                            autofocus: false,
                            obscureText: true,
                            decoration: InputDecoration(
                              labelText: 'Confirm Password: ',
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
                            controller: confirmPasswordController,
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
                                      confirmPassword = confirmPasswordController.text;
                                    });
                                    registration();
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
                                  'Sign Up',
                                  style: TextStyle(fontSize: 18.0),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Already have an Account? "),
                              TextButton(
                                  onPressed: () => {
                                        Navigator.pushReplacement(
                                          context,
                                          PageRouteBuilder(
                                            pageBuilder:
                                                (context, animation1, animation2) =>
                                                    Login(),
                                            transitionDuration: Duration(seconds: 0),
                                          ),
                                        )
                                      },
                                  child: Text('Login',
                                    style: TextStyle(fontSize: 16.0,color: Colors.deepOrange.shade500),))
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
    );
  }
}
