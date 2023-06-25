import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

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
            title: (const Text(
              "Snap POS",
              style: TextStyle(color: Colors.white),
            )),
            backgroundColor: const Color.fromRGBO(22, 135, 86, 1.0),
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
          body: TabBarView(
            children: [
              const AddProduct(),
              updateProduct(),
              deleteProduct(),
            ],
          ),
        ),
      ),
    );
  }
}

class AddProduct extends StatefulWidget {
  const AddProduct({super.key});

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  TextEditingController barcode = TextEditingController();

  String scanText = '';
  bool readed = false;

  Future<void> scanBarCode() async {
    try {
      scanText = await FlutterBarcodeScanner.scanBarcode(
        "#FF2171",
        "Cancel",
        true,
        ScanMode.BARCODE,
      );
    } on PlatformException {
      scanText = "Failed to read";
    }
    setState(() {
      readed = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 20.0, bottom: 20.0),
              child: Row(
                children: [
                  const Text('Product Barcode    ',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  Visibility(
                    visible: !readed,
                    child: Expanded(
                      child: TextFormField(
                        controller: barcode,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        decoration: const InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.green), // Set your desired color
                          ),
                        ),
                      ),
                    ),
                  ),

                  Visibility(
                    visible: readed,
                    child: Expanded(
                      child: Text(scanText),
                    ),
                  ),
                  const SizedBox(
                      width:
                          16.0), // Add a spacing between the TextFormField and ElevatedButton
                  ElevatedButton(
                    onPressed: () async {
                      scanBarCode();
                    },
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.green),
                    ),
                    child: const Text('Read Bar Code'),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20.0, bottom: 20.0),
              child: Row(
                children: [
                  const Text('Product Name     ',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  Expanded(
                    child: TextFormField(
                      textAlign: TextAlign.center,
                      decoration: const InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.green), // Set your desired color
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20.0, bottom: 20.0),
              child: Row(
                children: [
                  const Text('Quantity                ',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  Expanded(
                    child: TextFormField(
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      decoration: const InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.green), // Set your desired color
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20.0, bottom: 20.0),
              child: Row(
                children: [
                  const Text('Per Price              ',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  Expanded(
                    child: TextFormField(
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      decoration: const InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.green), // Set your desired color
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20.0, bottom: 20.0),
              child: ElevatedButton(
                onPressed: () async {
                  // String scanText;
                  // try {
                  //   scanText = await FlutterBarcodeScanner.scanBarcode(
                  //     "#FF2171",
                  //     "Cancel",
                  //     true,
                  //     ScanMode.BARCODE,
                  //   );
                  //   Logger().i("read success ---> $scanText");
                  // } on PlatformException {
                  //   scanText = "Failed to read";
                  // }

                  // BusinessLayer controller = BusinessLayer();
                  // await controller.scanBarCode();
                  // Logger().i("read success -- ${controller.scanText}");
                },
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.green),
                ),
                child: const Text('Add Product'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Widget addProduct() {
//   TextEditingController barcode = TextEditingController();
//   return Container(
//     child: Padding(
//       padding: const EdgeInsets.all(20.0),
//       child: ListView(
//         children: [
//           Container(
//             margin: const EdgeInsets.only(top: 20.0, bottom: 20.0),
//             child: Row(
//               children: [
//                 const Text('Product Barcode    ',
//                     style:
//                         TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
//                 Expanded(
//                   child: TextFormField(
//                     controller: barcode,
//                     inputFormatters: [
//                       FilteringTextInputFormatter.digitsOnly,
//                     ],
//                     keyboardType: TextInputType.number,
//                     textAlign: TextAlign.center,
//                     decoration: const InputDecoration(
//                       enabledBorder: UnderlineInputBorder(
//                         borderSide: BorderSide(
//                             color: Colors.green), // Set your desired color
//                       ),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(
//                     width:
//                         16.0), // Add a spacing between the TextFormField and ElevatedButton
//                 ElevatedButton(
//                   onPressed: () async {
//                     // Handle button press
//                     BusinessLayer controller = BusinessLayer();

//                     await controller.scanBarCode();

//                     barcode.text = 'reading';
//                   },
//                   style: ButtonStyle(
//                     backgroundColor:
//                         MaterialStateProperty.all<Color>(Colors.green),
//                   ),
//                   child: const Text('Read Bar Code'),
//                 ),
//               ],
//             ),
//           ),
//           Container(
//             margin: const EdgeInsets.only(top: 20.0, bottom: 20.0),
//             child: Row(
//               children: [
//                 const Text('Product Name     ',
//                     style:
//                         TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
//                 Expanded(
//                   child: TextFormField(
//                     textAlign: TextAlign.center,
//                     decoration: const InputDecoration(
//                       enabledBorder: UnderlineInputBorder(
//                         borderSide: BorderSide(
//                             color: Colors.green), // Set your desired color
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           Container(
//             margin: const EdgeInsets.only(top: 20.0, bottom: 20.0),
//             child: Row(
//               children: [
//                 const Text('Quantity                ',
//                     style:
//                         TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
//                 Expanded(
//                   child: TextFormField(
//                     inputFormatters: [
//                       FilteringTextInputFormatter.digitsOnly,
//                     ],
//                     keyboardType: TextInputType.number,
//                     textAlign: TextAlign.center,
//                     decoration: const InputDecoration(
//                       enabledBorder: UnderlineInputBorder(
//                         borderSide: BorderSide(
//                             color: Colors.green), // Set your desired color
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           Container(
//             margin: const EdgeInsets.only(top: 20.0, bottom: 20.0),
//             child: Row(
//               children: [
//                 const Text('Per Price              ',
//                     style:
//                         TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
//                 Expanded(
//                   child: TextFormField(
//                     inputFormatters: [
//                       FilteringTextInputFormatter.digitsOnly,
//                     ],
//                     keyboardType: TextInputType.number,
//                     textAlign: TextAlign.center,
//                     decoration: const InputDecoration(
//                       enabledBorder: UnderlineInputBorder(
//                         borderSide: BorderSide(
//                             color: Colors.green), // Set your desired color
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           Container(
//             margin: const EdgeInsets.only(top: 20.0, bottom: 20.0),
//             child: ElevatedButton(
//               onPressed: () async {
//                 // String scanText;
//                 // try {
//                 //   scanText = await FlutterBarcodeScanner.scanBarcode(
//                 //     "#FF2171",
//                 //     "Cancel",
//                 //     true,
//                 //     ScanMode.BARCODE,
//                 //   );
//                 //   Logger().i("read success ---> $scanText");
//                 // } on PlatformException {
//                 //   scanText = "Failed to read";
//                 // }

//                 // BusinessLayer controller = BusinessLayer();
//                 // await controller.scanBarCode();
//                 // Logger().i("read success -- ${controller.scanText}");
//               },
//               style: ButtonStyle(
//                 backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
//               ),
//               child: const Text('Add Product'),
//             ),
//           ),
//         ],
//       ),
//     ),
//   );
// }

Widget updateProduct() {
  return Container(
    child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: ListView(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 20.0, bottom: 20.0),
            child: Row(
              children: [
                const Text('Product Barcode    ',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                Expanded(
                  child: TextFormField(
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    decoration: const InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.green), // Set your desired color
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                    width:
                        16.0), // Add a spacing between the TextFormField and ElevatedButton
                ElevatedButton(
                  onPressed: () {
                    // Handle button press
                  },
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.green),
                  ),
                  child: const Text('Read Bar Code'),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 20.0, bottom: 20.0),
            child: Row(
              children: [
                const Text('Product Name     ',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                Expanded(
                  child: TextFormField(
                    textAlign: TextAlign.center,
                    decoration: const InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.green), // Set your desired color
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 20.0, bottom: 20.0),
            child: Row(
              children: [
                const Text('Quantity                ',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                Expanded(
                  child: TextFormField(
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    decoration: const InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.green), // Set your desired color
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 20.0, bottom: 20.0),
            child: Row(
              children: [
                const Text('Per Price              ',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                Expanded(
                  child: TextFormField(
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    decoration: const InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.green), // Set your desired color
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 20.0, bottom: 20.0),
            child: ElevatedButton(
              onPressed: () async {},
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
              ),
              child: const Text('Update Product'),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget deleteProduct() {
  return Container(
    child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: ListView(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 20.0, bottom: 20.0),
            child: Row(
              children: [
                const Text('Product Barcode    ',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                Expanded(
                  child: TextFormField(
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    decoration: const InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.green), // Set your desired color
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                    width:
                        16.0), // Add a spacing between the TextFormField and ElevatedButton
                ElevatedButton(
                  onPressed: () {
                    // Handle button press
                  },
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.green),
                  ),
                  child: const Text('Read Bar Code'),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 20.0, bottom: 20.0),
            child: Row(
              children: [
                const Text('Product Name     ',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                Expanded(
                  child: TextFormField(
                    textAlign: TextAlign.center,
                    decoration: const InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.green), // Set your desired color
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 20.0, bottom: 20.0),
            child: Row(
              children: [
                const Text('Quantity                ',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                Expanded(
                  child: TextFormField(
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    decoration: const InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.green), // Set your desired color
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 20.0, bottom: 20.0),
            child: Row(
              children: [
                const Text('Per Price              ',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                Expanded(
                  child: TextFormField(
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    decoration: const InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.green), // Set your desired color
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 20.0, bottom: 20.0),
            child: ElevatedButton(
              onPressed: () async {},
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
              ),
              child: const Text('Delete Product'),
            ),
          ),
        ],
      ),
    ),
  );
}
