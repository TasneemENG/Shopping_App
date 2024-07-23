import 'package:flutter/material.dart';
class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body:  Padding(
      padding: const EdgeInsets.only(left: 10,top:25),
      child: Row(
        children: [


          Text("Welcome!",style: TextStyle(color: Colors.orangeAccent,fontWeight: FontWeight.bold,fontSize: 20,letterSpacing: 2),)
        ],
      ),
    ),

    );
  }
}
