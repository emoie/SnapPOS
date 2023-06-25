import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Customers extends StatefulWidget {

  const Customers({Key? key}) : super(key: key);

  @override
  State<Customers> createState() => _CustomersState();

}

class _CustomersState extends State<Customers> {

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
                  text: 'Add Customers',
                ),
                Tab(
                  icon: Icon(Icons.update), // Replace with your desired icon
                  text: 'Update Customers',
                ),
                Tab(
                  icon: Icon(Icons.delete), // Replace with your desired icon
                  text: 'Delete Customers',
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
                Text('Customer Name  ', style: TextStyle(fontWeight: FontWeight.bold,  fontSize: 16)),
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
                Text('NIC Number         ', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
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
                Text('Date of birth                       ', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
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
                Text('Membership type              ', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
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
            child: ElevatedButton(
              onPressed: () async {

              },
              child: Text('Add Customer'),
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
                Text('Customer QR code    ', style: TextStyle(fontWeight: FontWeight.bold,  fontSize: 16)),
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
                  child: Text('Read QR Code'),
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
                Text('Customer Name  ', style: TextStyle(fontWeight: FontWeight.bold,  fontSize: 16)),
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
                Text('NIC Number         ', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
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
                Text('Date of birth                       ', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
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
                Text('Membership type              ', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
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
            child: ElevatedButton(
              onPressed: () async {

              },
              child: Text('Update Customer'),
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
                Text('Customer QR code    ', style: TextStyle(fontWeight: FontWeight.bold,  fontSize: 16)),
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
                  child: Text('Read QR Code'),
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
                Text('Customer Name  ', style: TextStyle(fontWeight: FontWeight.bold,  fontSize: 16)),
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
                Text('NIC Number         ', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
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
                Text('Date of birth                       ', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
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
                Text('Membership type              ', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
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
            child: ElevatedButton(
              onPressed: () async {

              },
              child: Text('Delete Customer'),
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