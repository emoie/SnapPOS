import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class Checkout extends StatefulWidget {


  const Checkout({Key? key}) : super(key: key);

  @override
  State<Checkout> createState() => _CheckoutState();


}

class _CheckoutState extends State<Checkout> {
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
                },
                child: Text('Print Bill', style: TextStyle(color: Colors.white),)
            ),
          ],
        ),
        body: Container(
          child: ListView(
            scrollDirection: Axis.vertical,
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 30.0, top: 30.0),
                child: Center(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: DataTable(
                      border: TableBorder.all(),
                      columns: const [
                        DataColumn(label: Text('Bar Code')),
                        DataColumn(label: Text('Product Name')),
                        DataColumn(label: Text('Quantity')),
                        DataColumn(label: Text('Price')),
                      ],
                      rows: const [
                        DataRow(cells: [
                          DataCell(Text('4792210100194')),
                          DataCell(Text('Product 01')),
                          DataCell(Text('5')),
                          DataCell(Text('Rs 500.00')),
                        ]),
                        DataRow(cells: [
                          DataCell(Text('4792210100194')),
                          DataCell(Text('Product 01')),
                          DataCell(Text('5')),
                          DataCell(Text('Rs 500.00')),
                        ]),
                        DataRow(cells: [
                          DataCell(Text('4792210100194')),
                          DataCell(Text('Product 01')),
                          DataCell(Text('5')),
                          DataCell(Text('Rs 500.00')),
                        ]),
                        DataRow(cells: [
                          DataCell(Text('4792210100194')),
                          DataCell(Text('Product 01')),
                          DataCell(Text('5')),
                          DataCell(Text('Rs 500.00')),
                        ]),
                        DataRow(cells: [
                          DataCell(Text('4792210100194')),
                          DataCell(Text('Product 01')),
                          DataCell(Text('5')),
                          DataCell(Text('Rs 500.00')),
                        ]),
                        DataRow(cells: [
                          DataCell(Text('4792210100194')),
                          DataCell(Text('Product 01')),
                          DataCell(Text('5')),
                          DataCell(Text('Rs 500.00')),
                        ]),
                        DataRow(cells: [
                          DataCell(Text('4792210100194')),
                          DataCell(Text('Product 01')),
                          DataCell(Text('5')),
                          DataCell(Text('Rs 500.00')),
                        ]),
                        DataRow(cells: [
                          DataCell(Text('4792210100194')),
                          DataCell(Text('Product 01')),
                          DataCell(Text('5')),
                          DataCell(Text('Rs 500.00')),
                        ]),
                        DataRow(cells: [
                          DataCell(Text('4792210100194')),
                          DataCell(Text('Product 01')),
                          DataCell(Text('5')),
                          DataCell(Text('Rs 500.00')),
                        ]),
                        DataRow(cells: [
                          DataCell(Text('4792210100194')),
                          DataCell(Text('Product 01')),
                          DataCell(Text('5')),
                          DataCell(Text('Rs 500.00')),
                        ]),
                        DataRow(cells: [
                          DataCell(Text('4792210100194')),
                          DataCell(Text('Product 01')),
                          DataCell(Text('5')),
                          DataCell(Text('Rs 500.00')),
                        ]),
                        DataRow(cells: [
                          DataCell(Text('4792210100194')),
                          DataCell(Text('Product 01')),
                          DataCell(Text('5')),
                          DataCell(Text('Rs 500.00')),
                        ]),

                      ],
                    ),
                  ),
                ),
              ),

              Container(
                color: Colors.green,
                height: 70,
                margin: EdgeInsets.only(bottom: 30),
                child: Center(child: Text('Total is   :   5000.00',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0, color: Colors.white),)),
              ),

              Container(
                margin: EdgeInsets.only(bottom: 30),
                height: 150,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: productimgClick,
                      child: Image.asset("assets/images/BarCode.png"),
                    ),
                    InkWell(
                      onTap: salesimgClick,
                      child: Image.asset("assets/images/QRCode.png"),
                    ),
                  ],

                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 30),
                height: 150,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: checkoutimgClick,
                      child: Image.asset("assets/images/Manual.png"),
                    ),
                    InkWell(
                      onTap: customersimgClick,
                      child: Image.asset("assets/images/NFCPAY.png"),
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
