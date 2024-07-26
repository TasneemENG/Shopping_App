
import 'package:animal_app/features/Home/presentation/views/Screens/HomeView.dart';
import 'package:animal_app/features/Home/presentation/views/Screens/MainScreen.dart';
import 'package:flutter/material.dart';

import '../../../../Home/data/models/Category.dart';
import '../screens/create_account_view.dart';
class Login_body extends StatefulWidget {
  @override
  State<Login_body> createState() => _LoginState(categories);
}



class _LoginState extends State<Login_body> {
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _emailController = TextEditingController();

  bool _isPasswordValid = false;
  bool _isEmailValid = false;

  @override
  void dispose() {
    _passwordController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  bool _isFormValid() {
    return _isPasswordValid && _isEmailValid;
  }

  void _validatePassword(String value) {
    // Password should contain at least one letter and one number
    setState(() {
      _isPasswordValid = value.isNotEmpty && value.contains(RegExp(r'(?=.*[a-zA-Z])(?=.*\d)'));
    });
  }

  void _validateEmail(String value) {
    // Email should be in correct format with "@"
    setState(() {
      _isEmailValid = value.isNotEmpty&& value.contains('@gmail.com');
    });
  }

  @override
  final List<Category>categories;

  _LoginState(this.categories);

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/login_image.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 50, left: 20),
              child: Text(
                "Welcome Back,",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
            ),
            SizedBox(height: 40,),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                "Discover Limitless Choices",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
            ),
            SizedBox(height: 40),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Container(
                  decoration: BoxDecoration(

                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white70 ,
                  ),
                  child:  ListView(
                    children: [
                      SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: TextFormField(
                          controller: _emailController,
                          onChanged: _validateEmail,
                          decoration: InputDecoration(
                            focusedBorder:OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.orange, // Set border color to black
                              ),
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.black, // Set border color to black
                              ),
                            ),
                            hintText: "Email",
                            suffixIcon: _isEmailValid
                                ? Icon(
                              Icons.check,
                              color: Colors.green,
                            )
                                : null,
                            prefixIcon: Icon(
                              Icons.email,
                              color: Colors.black,
                            ),
                            labelText: "Email",
                            labelStyle: TextStyle(color:  Colors.orange),
                          ),
                          cursorColor: Colors.orangeAccent,
                        ),
                      ),
                      if (!_isEmailValid)
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Text(
                            "Enter a valid Email...",
                            style: TextStyle(color: Colors.red),
                          ),
                        ),
                      SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: TextFormField(
                          controller: _passwordController,
                          onChanged: _validatePassword,
                          obscureText: true,
                          decoration: InputDecoration(
                            focusedBorder:OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.orange, // Set border color to black
                              ),
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.black, // Set border color to black
                              ),
                            ),
                            hintText: "Password",
                            suffixIcon: _isPasswordValid
                                ? Icon(
                              Icons.check,
                              color: Colors.green,
                            )
                                : null,
                            prefixIcon: Icon(
                              Icons.lock,
                              color: Colors.black,
                            ),
                            labelText: "Password",
                            labelStyle: TextStyle(color:  Colors.orange ),
                          ),
                          cursorColor: Colors.orangeAccent,
                        ),
                      ),
                      if (!_isPasswordValid&&_isPasswordValid!=null)
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Text(
                            "Enter a valid Password...",
                            style: TextStyle(color: Colors.red),
                          ),
                        ),
                      Padding(
                        padding: const EdgeInsets.only(left: 25, top: 10, bottom: 40),
                        child: Text(
                          "forgot password?",
                          style: TextStyle(color: Colors.orange),
                        ),
                      ),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: MaterialButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            minWidth: double.infinity,
                            height: 40,
                            onPressed: () {
                              if (_isEmailValid && _isPasswordValid) {
                                Navigator.push(context,MaterialPageRoute(builder: (context)=>MainScreen()));
                              }
                            },
                            color: Colors.orangeAccent,
                            child: Text(
                              "LOGIN",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 40),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don't Have An Account? ",
                            style: TextStyle(color:  Colors.grey ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => Create_account()));
                            },
                            child: Text(
                              "Register Now",
                              style: TextStyle(color: Colors.orange),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),

            SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}