import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class Signup extends StatefulWidget {

  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();

}

class _SignupState extends State<Signup> {

  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _firstName = TextEditingController();
  TextEditingController _nic = TextEditingController();
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore _store = FirebaseFirestore.instance;

  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1980),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

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
                    Text("Sign up",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  ],


                ),

              ),
              Container(
                height: 700,
                margin: EdgeInsets.all(35.0),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.95),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Padding(
                  padding: EdgeInsets.all(35.0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        TextFormField(
                          controller: _firstName,
                          decoration: InputDecoration(
                            labelText: 'Full Name',
                          ),
                        ),
                        SizedBox(height: 16.0),
                        GestureDetector(
                          onTap: () {
                            _selectDate(context);
                          },
                          child: AbsorbPointer(
                            child: TextFormField(
                              decoration: InputDecoration(
                                labelText: 'Date of Birth',
                              ),
                              controller: TextEditingController(
                                text: selectedDate != null
                                    ? selectedDate.toString().split(' ')[0]
                                    : '',
                              ),
                            ),
                          ),
                        ),

                        SizedBox(height: 16.0),
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Address',
                          ),
                        ),
                        SizedBox(height: 16.0),
                        TextFormField(
                          controller: _email,
                          decoration: InputDecoration(
                            labelText: 'Email',
                          ),
                        ),
                        SizedBox(height: 16.0),
                        TextFormField(
                          controller: _password,
                          decoration: InputDecoration(
                            labelText: 'New Password',
                          ),
                          obscureText: true,
                        ),
                        SizedBox(height: 24.0),
                        ElevatedButton(
                          onPressed: () async {
                            Logger().i(_email.text);
                            Logger().i(_password.text);
                            Logger().i(_firstName.text);
                            String userid = "";
                            // try {
                            //   UserCredential user = await _auth.createUserWithEmailAndPassword(email: _email.text, password: _password.text);
                            //   userid = user.user!.uid;
                            // } on FirebaseAuthException catch (e) {
                            //   Logger().e(e.code);
                            // }

                            try {
                              CollectionReference collectionref =  _store.collection("tbl_user");
                            await collectionref.add({
                              'full_name': 'fullName', // John Doe
                              'company': 'company', // Stokes and Sons
                              'age': 'age' // 42
                            })
                                .then((value) => Logger().i("User Added"))
                                .catchError((error) => Logger().e("Failed to add user: $error"));
                              // await collectionref.doc('00').set({
                              //   'name':"_firstName.text",
                              //   'NIC' : "_nic.text",
                              //   'email' : "_email",
                              // });

                              Logger().i("Succusss");

                            } on FirebaseException catch (e) {
                              Logger().e(e.code);
                            }


                          },
                          child: Text('Sign Up'),
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );

  }


}
