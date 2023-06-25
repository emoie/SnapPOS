import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Products extends StatefulWidget {

  const Products({Key? key}) : super(key: key);

  @override
  State<Products> createState() => _ProductsState();

}

class _ProductsState extends State<Products> {

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: DefaultTabController(
        length: 3,
        child: Scaffold(

          appBar: AppBar(
            title: (Text("Snap POS", style: TextStyle(color: Colors.white),)),
            backgroundColor: Color.fromRGBO(22, 135, 86, 1.0),
            bottom: const TabBar(
              tabs: [
                Tab(
                icon: Icon(Icons.add), // Replace with your desired icon
                text: 'Add Products',
                ),
                Tab(
                  icon: Icon(Icons.update), // Replace with your desired icon
                  text: 'Update Products',
                ),
                Tab(
                  icon: Icon(Icons.delete), // Replace with your desired icon
                  text: 'Delete Products',
                ),
              ],
            ),
            ),
          body:  TabBarView(
            children: [
              tab01(),
              tab02(),
              tab03(),
            ],
          ),
          ),
      ),
    );

  }

}

    Widget tab01(){
      return Container(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: ListView(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 20.0, bottom: 20.0),
                  child: Row(
                    children: [
                      Text('Product Barcode    ', style: TextStyle(fontWeight: FontWeight.bold,  fontSize: 16)),
                      Expanded(
                        child: TextFormField(
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          decoration: const InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.green), // Set your desired color
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 16.0), // Add a spacing between the TextFormField and ElevatedButton
                      ElevatedButton(

                        onPressed: () {
                          // Handle button press
                        },
                        child: Text('Read Bar Code'),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
                        ),
                      ),
                    ],
                  ),
                ),

                Container(
                  margin: EdgeInsets.only(top: 20.0, bottom: 20.0),
                  child: Row(
                    children: [
                      Text('Product Name     ', style: TextStyle(fontWeight: FontWeight.bold,  fontSize: 16)),
                      Expanded(
                        child: TextFormField(
                          textAlign: TextAlign.center,
                          decoration: const InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.green), // Set your desired color
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                Container(
                  margin: EdgeInsets.only(top: 20.0, bottom: 20.0),
                  child: Row(
                    children: [
                      Text('Quantity                ', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                      Expanded(
                        child: TextFormField(
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          decoration: const InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.green), // Set your desired color
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                Container(
                  margin: EdgeInsets.only(top: 20.0, bottom: 20.0),
                  child: Row(
                    children: [
                      Text('Per Price              ', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                      Expanded(
                        child: TextFormField(
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          decoration: const InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.green), // Set your desired color
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                Container(
                  margin: EdgeInsets.only(top: 20.0, bottom: 20.0),
                  child: ElevatedButton(
                    onPressed: () async {

                    },
                    child: Text('Add Product'),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
                    ),
                  ),
                ),

              ],
            ),
          ),
      );
    }





    Widget tab02(){
      return Container(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: ListView(
            children: [
              Container(
                margin: EdgeInsets.only(top: 20.0, bottom: 20.0),
                child: Row(
                  children: [
                    Text('Product Barcode    ', style: TextStyle(fontWeight: FontWeight.bold,  fontSize: 16)),
                    Expanded(
                      child: TextFormField(
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        decoration: const InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.green), // Set your desired color
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 16.0), // Add a spacing between the TextFormField and ElevatedButton
                    ElevatedButton(

                      onPressed: () {
                        // Handle button press
                      },
                      child: Text('Read Bar Code'),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
                      ),
                    ),
                  ],
                ),
              ),

              Container(
                margin: EdgeInsets.only(top: 20.0, bottom: 20.0),
                child: Row(
                  children: [
                    Text('Product Name     ', style: TextStyle(fontWeight: FontWeight.bold,  fontSize: 16)),
                    Expanded(
                      child: TextFormField(
                        textAlign: TextAlign.center,
                        decoration: const InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.green), // Set your desired color
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              Container(
                margin: EdgeInsets.only(top: 20.0, bottom: 20.0),
                child: Row(
                  children: [
                    Text('Quantity                ', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                    Expanded(
                      child: TextFormField(
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        decoration: const InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.green), // Set your desired color
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              Container(
                margin: EdgeInsets.only(top: 20.0, bottom: 20.0),
                child: Row(
                  children: [
                    Text('Per Price              ', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                    Expanded(
                      child: TextFormField(
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        decoration: const InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.green), // Set your desired color
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              Container(
                margin: EdgeInsets.only(top: 20.0, bottom: 20.0),
                child: ElevatedButton(
                  onPressed: () async {

                  },
                  child: Text('Update Product'),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
                  ),
                ),
              ),

            ],
          ),
        ),
      );
    }




    Widget tab03(){
      return Container(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: ListView(
            children: [
              Container(
                margin: EdgeInsets.only(top: 20.0, bottom: 20.0),
                child: Row(
                  children: [
                    Text('Product Barcode    ', style: TextStyle(fontWeight: FontWeight.bold,  fontSize: 16)),
                    Expanded(
                      child: TextFormField(
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        decoration: const InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.green), // Set your desired color
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 16.0), // Add a spacing between the TextFormField and ElevatedButton
                    ElevatedButton(

                      onPressed: () {
                        // Handle button press
                      },
                      child: Text('Read Bar Code'),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
                      ),
                    ),
                  ],
                ),
              ),

              Container(
                margin: EdgeInsets.only(top: 20.0, bottom: 20.0),
                child: Row(
                  children: [
                    Text('Product Name     ', style: TextStyle(fontWeight: FontWeight.bold,  fontSize: 16)),
                    Expanded(
                      child: TextFormField(
                        textAlign: TextAlign.center,
                        decoration: const InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.green), // Set your desired color
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              Container(
                margin: EdgeInsets.only(top: 20.0, bottom: 20.0),
                child: Row(
                  children: [
                    Text('Quantity                ', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                    Expanded(
                      child: TextFormField(
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        decoration: const InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.green), // Set your desired color
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              Container(
                margin: EdgeInsets.only(top: 20.0, bottom: 20.0),
                child: Row(
                  children: [
                    Text('Per Price              ', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                    Expanded(
                      child: TextFormField(
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        decoration: const InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.green), // Set your desired color
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              Container(
                margin: EdgeInsets.only(top: 20.0, bottom: 20.0),
                child: ElevatedButton(
                  onPressed: () async {

                  },
                  child: Text('Delete Product'),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
                  ),
                ),
              ),

            ],
          ),
        ),
      );
    }
