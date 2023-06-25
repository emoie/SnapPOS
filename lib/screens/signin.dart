import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:logger/logger.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:snappos/screens/google_sign_in.dart';
import 'package:snappos/screens/signup.dart';

class Signin extends StatefulWidget {

  const Signin({Key? key}) : super(key: key);

  @override
  State<Signin> createState() => _SigninState();

}

class _SigninState extends State<Signin> {

  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  FirebaseAuth _auth = FirebaseAuth.instance;


  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(

        appBar: AppBar(
          title: (Text("Snap POS", style: TextStyle(color: Colors.white),)),
          backgroundColor: Color.fromRGBO(22, 135, 86, 1.0),
        ),
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/loginbackground.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: ListView(
            scrollDirection: Axis.vertical,
            children: [
              Container(
                margin: EdgeInsets.only(top: 30),
                height: 150,
                child: Column(
                  children: const[
                    Icon(
                      Icons.account_circle_outlined, // Replace with the desired icon
                      size: 100,
                      color: Colors.white,
                    ),
                    Text("Sign In",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  ],


                ),

              ),
              Container(
                height: 375,
                margin: EdgeInsets.all(35.0),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.95),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      TextFormField(
                        controller: _email,
                        decoration: InputDecoration(
                          labelText: 'Email',
                        ),
                      ),
                      SizedBox(height: 24.0),
                      TextFormField(
                        controller: _password,
                        decoration: InputDecoration(
                          labelText: 'Password',
                        ),
                        obscureText: true,
                      ),
                      SizedBox(height: 24.0),
                      ElevatedButton(
                        onPressed: () async {
                          Logger().e(_email.text);
                          Logger().i(_password.text);

                            try {
                              UserCredential user = await _auth.createUserWithEmailAndPassword(email: _email.text, password: _password.text);
                            } on FirebaseAuthException catch (e) {
                              Logger().e(e.code);
                            }
                          },
                        child: Text('Sign In'),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Logger().i('Text Clicked!');
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Signup(),
                            ), //MaterialPageRoute
                          );
                        },
                        child: const Text("Don't have a account? Register",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 15,decoration: TextDecoration.underline, fontWeight: FontWeight.bold, color: Colors.grey),
                        ),
                      ),

                      Spacer(),

                      ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.green,
                          onPrimary: Colors.white,
                          minimumSize: Size(double.infinity, 40),
                        ),
                          icon: const FaIcon(FontAwesomeIcons.google, color: Colors.white,),
                          label: Text('Signin wih Google'),
                          onPressed: (){
                            final provider = Provider.of<GoogleSignInProvider>(context, listen: false);
                            provider.googleLogin();

                          },
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );

  }



  void googlesignin() {



  }
}
