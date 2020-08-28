import 'package:flutter/material.dart';
import 'package:flutter_budget/data/data.dart';
import 'package:flutter_budget/widgets/bar_chart.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        //https://api.flutter.dev/flutter/material/FlexibleSpaceBar-class.html
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            stretch: true,
            forceElevated: true,
            floating: true,
            // pinned: true,
            expandedHeight: 100,
            leading: IconButton(
              icon: Icon(Icons.settings),
              iconSize: 30,
              onPressed: () {},
            ),
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: Text('Simple Budget'),
            ),
            actions: [
              IconButton(
                icon: Icon(Icons.add),
                iconSize: 30,
                onPressed: () {},
              ),
            ],
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Container(
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        offset: Offset(0,6),
                        blurRadius: 6,
                      )
                    ],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: BarChart(weeklySpending),
                );
              },
              childCount: 1,
            ),
          ),
        ],
      ),
    );
  }
}
