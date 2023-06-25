import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:snappos/screens/google_sign_in.dart';
import 'package:snappos/screens/index.dart';

import 'screens/checkout.dart';
import 'screens/customers.dart';
import 'screens/onboard.dart';
import 'screens/products.dart';
import 'screens/reports.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(
    const MyApp(), // Wrap your app
  );
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
            home: const Index(), //Homepage(),
            routes: <String, WidgetBuilder>{
              // '/login' : (context) => Login(),
              '/onboard': (context) => Onboard(),
              '/products': (context) => const Products(),
              '/customers': (context) => const Customers(),
              '/reports': (context) => const Reports(),
              '/checkout': (context) => const Checkout(),
            }),
      );
}
