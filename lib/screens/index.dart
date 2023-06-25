import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'products.dart';

import 'google_sign_in.dart';
import 'home.dart';
import 'onboard.dart';

class Index extends StatefulWidget {


  const Index({Key? key}) : super(key: key);

  @override
  State<Index> createState() => _IndexState();


}

class _IndexState extends State<Index> {
  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(

        appBar: AppBar(
          title: (Text("Snap POS", style: TextStyle(color: Colors.white),)),
          centerTitle: true,
          backgroundColor: Color.fromRGBO(22, 135, 86, 1.0),
          actions: [
            TextButton(
                onPressed: () {
                  final provider = Provider.of<GoogleSignInProvider>(context, listen: false);
                  provider.logout();
                },
                 child: Text('Logout', style: TextStyle(color: Colors.white),)
            ),
          ],
        ),
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/HomePageBackground.png"),
              fit: BoxFit.cover,
            ),
          ),
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            Container(
              height: 380,
            ),
            Container(
              height: 150,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: productimgClick,
                    child: Image.asset("assets/images/PRODUCTS.png"),
                  ),
                  InkWell(
                    onTap: salesimgClick,
                    child: Image.asset("assets/images/SALES.png"),
                  ),
                ],

              ),
            ),
            Container(
              height: 30,
            ),
            Container(
              height: 150,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: checkoutimgClick,
                    child: Image.asset("assets/images/CHECKOUT.png"),
                  ),
                  InkWell(
                    onTap: customersimgClick,
                    child: Image.asset("assets/images/CUSTOMERS.png"),
                  ),
                ],
              ),
            ),


          ],
        ),
      ),
      ),
    );

  }

  void productimgClick() {
    Navigator.of(context).pushNamed('/products');
  }

  void salesimgClick() {
    Navigator.of(context).pushNamed('/reports');
  }

  void checkoutimgClick() {
    Navigator.of(context).pushNamed('/checkout');
  }

  void customersimgClick() {
    Navigator.of(context).pushNamed('/customers');
  }
}
