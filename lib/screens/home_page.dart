
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Index.dart';
import 'signin.dart';

class Homepage extends StatelessWidget{
  @override
  Widget build(BuildContext context) => Scaffold(
    body: StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot){

        if(snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }else if (snapshot.hasData){
            return Index();
        }
        else if (snapshot.hasError){
          return const Center(child: Text('Something Went Wrong!'),);
        }
        else {
          return Signin();
        }
      },

    ),

  );
}