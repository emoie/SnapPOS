import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:snappos/screens/google_sign_in.dart';

import 'screens/Index.dart';
import 'screens/checkout.dart';
import 'screens/home_page.dart';
import 'screens/onboard.dart';
import 'screens/products.dart';
import 'screens/reports.dart';
import 'screens/signin.dart';
import 'screens/signup.dart';
import 'screens/customers.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(

  );

  runApp( DevicePreview(
    builder: (context) => MyApp(), // Wrap your app
  ),);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
    create: (context) => GoogleSignInProvider(),
      child: MaterialApp(
      debugShowCheckedModeBanner: false,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      title: "SnapPOS",
      home: Homepage(),
      routes: <String,WidgetBuilder>{
        // '/login' : (context) => Login(),
        '/onboard' : (context) => Onboard(),
        '/products' : (context) => Products(),
        '/customers' : (context) => Customers(),
        '/reports' : (context) => Reports(),
        '/checkout' : (context) => Checkout(),

      }
      ),
  );
}


