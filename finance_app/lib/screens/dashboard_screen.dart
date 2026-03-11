import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget{
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  List <double> expenseData = [500, 300, 200];

  void updateChart(){
    setState(() {
      expenseData = [600, 250, 150];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),

          Text("Expense Breakdown"),

          Expanded(
            child: Center(
              child: Text('Pie Chart'),
            ),
          ),

          ElevatedButton(
            onPressed: updateChart,
            child: const Text("Refresh Data"),
          )
        ],
      )
    );
  }
}