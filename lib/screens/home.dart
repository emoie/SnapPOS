import 'package:flutter/material.dart';

import 'onboard.dart';


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {

    Future.delayed(Duration(seconds: 5), () {
      // Navigator.of(context).pushNamed('/onboard');
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Onboard(),
        ), //MaterialPageRoute
      );
    });
    return SafeArea(

      child: Scaffold(
        body: Center(
          child: Image.asset("assets/SnapPOS.png", fit: BoxFit.cover,),

        ),
      ),
    );

  }
}
