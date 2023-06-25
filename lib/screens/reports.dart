import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:snappos/bar%20graph/bar_graph.dart';

class Reports extends StatefulWidget {


  const Reports({Key? key}) : super(key: key);

  @override
  State<Reports> createState() => _ReportsState();

}

class _ReportsState extends State<Reports> {

  List<double> weeklySummary = [
    20.40,
    5.50,
    42.25,
    10.50,
    88.99,
    65.47,
    54.55,
  ];

  Map<String, double> dataMap = {
    "Sales": 5,
    "Purchased": 3,
  };
  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(

        appBar: AppBar(
          title: (Text("Snap POS", style: TextStyle(color: Colors.white),)),
          backgroundColor: Color.fromRGBO(22, 135, 86, 1.0),
        ),
        body: Container(
          margin: EdgeInsets.all(20),
          child: ListView(
            children: [
              Divider(),
              Container(
                  margin: EdgeInsets.only(top: 20, bottom: 20),
                  child: Text("Weekly Sales", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)
              ),
              Divider(),
              Container(
                margin: EdgeInsets.only(top: 20, bottom: 20),
                child: SizedBox(
                    height: 350,
                    child: MyBarGraph(
                      weeklySummary: weeklySummary,
                    )
                ),
              ),
              Divider(),
              Container(
                  margin: EdgeInsets.only(top: 20, bottom: 20),
                  child: Text("Weekly Expences", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)
              ),
              Divider(),
              PieChart(
                dataMap: dataMap,
                chartRadius: MediaQuery.of(context).size.width/1.7,
                legendOptions: const LegendOptions(
                  legendPosition: LegendPosition.bottom,
                ),
                chartValuesOptions: const ChartValuesOptions(
                  showChartValuesInPercentage: true,
                ),
              ),
            ],
          ),
        ),

        ),
    );

  }


}
