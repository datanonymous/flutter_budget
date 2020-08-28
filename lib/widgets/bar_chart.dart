import 'package:flutter/material.dart';
import 'package:flutter_budget/data/data.dart';

class BarChart extends StatelessWidget {
  final List<double> expenses;
  BarChart(this.expenses);

  @override
  Widget build(BuildContext context) {
    double mostExpensive = 0;
    expenses.forEach((double price) {
      if (price > mostExpensive) {
        mostExpensive = price;
      }
    });

    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        children: [
          Text(
            'Weekly Spending',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.2,
            ),
          ),
          SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: Icon(Icons.arrow_back),
                iconSize: 30,
                onPressed: () {},
              ),
              Text(
                'Nov 10, 2019 - Nov 16, 2019',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1.2,
                ),
              ),
              IconButton(
                icon: Icon(Icons.arrow_forward),
                iconSize: 30,
                onPressed: () {},
              ),
            ],
          ),
          SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Bar(
                label: 'Su',
                amountSpent: weeklySpending[0],
                mostExpensive: mostExpensive,
              ),
              Bar(
                label: 'Mo',
                amountSpent: weeklySpending[1],
                mostExpensive: mostExpensive,
              ),
              Bar(
                label: 'Tu',
                amountSpent: weeklySpending[2],
                mostExpensive: mostExpensive,
              ),
              Bar(
                label: 'We',
                amountSpent: weeklySpending[3],
                mostExpensive: mostExpensive,
              ),
              Bar(
                label: 'Th',
                amountSpent: weeklySpending[4],
                mostExpensive: mostExpensive,
              ),
              Bar(
                label: 'Fr',
                amountSpent: weeklySpending[5],
                mostExpensive: mostExpensive,
              ),
              Bar(
                label: 'Sa',
                amountSpent: weeklySpending[6],
                mostExpensive: mostExpensive,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class Bar extends StatelessWidget {
  final String label;
  final double amountSpent;
  final double mostExpensive;
  Bar({this.label, this.amountSpent, this.mostExpensive});
  final double _maxBarHeight = 150;

  @override
  Widget build(BuildContext context) {
    final barHeight = amountSpent / mostExpensive * _maxBarHeight;
    return Column(
      children: [
        Text(
          '\$${amountSpent.toStringAsFixed(2)}',
          style: TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 6),
        Container(
          height: barHeight,
          width: 18,
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(6),
          ),
        ),
        SizedBox(height: 8),
        Text(
          label,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
