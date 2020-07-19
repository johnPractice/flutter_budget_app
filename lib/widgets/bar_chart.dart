import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BarChart extends StatelessWidget {
  final List<double> expenses;

  const BarChart({Key key, this.expenses}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double mostExpensive = 0;
    for (double i in this.expenses) {
      if (i > mostExpensive) {
        mostExpensive = i;
      }
    }
    return Container(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            Text(
              'Weakly Spending',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25.0,
                  letterSpacing: 1.2),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    size: 20.0,
                  ),
                  onPressed: () {},
                ),
                Text(
                  'Nov 10, 2019 - Nov 16,2019',
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600),
                ),
                IconButton(
                  icon: Icon(
                    Icons.arrow_forward,
                    size: 20.0,
                  ),
                  onPressed: () {},
                ),
              ],
            ),
            SizedBox(
              height: 30.0,
            ),
            Container(
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Bar(
                    label: "Sun",
                    amountSpent: expenses[0],
                    mostExpensive: mostExpensive,
                  ),
                  Bar(
                    label: "Mon",
                    amountSpent: expenses[1],
                    mostExpensive: mostExpensive,
                  ),
                  Bar(
                    label: "Thu",
                    amountSpent: expenses[2],
                    mostExpensive: mostExpensive,
                  ),
                  Bar(
                    label: "Wen",
                    amountSpent: expenses[3],
                    mostExpensive: mostExpensive,
                  ),
                  Bar(
                    label: "Thr",
                    amountSpent: expenses[4],
                    mostExpensive: mostExpensive,
                  ),
                  Bar(
                    label: "Fri",
                    amountSpent: expenses[5],
                    mostExpensive: mostExpensive,
                  ),
                  Bar(
                    label: "Sat",
                    amountSpent: expenses[6],
                    mostExpensive: mostExpensive,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Bar extends StatelessWidget {
  final String label;
  final double amountSpent;
  final double mostExpensive;

  const Bar({Key key, this.label, this.amountSpent, this.mostExpensive})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    const double _maxBarHeight = 150.0;
    final barHeight = (this.amountSpent / this.mostExpensive) * _maxBarHeight;
    return Expanded(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
        child: Column(
          children: <Widget>[
            Text(
              '\$${this.amountSpent.toStringAsFixed(2)}',
              style: TextStyle(
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              height: 6.0,
            ),
            Container(
              margin: EdgeInsets.symmetric(),
              height: barHeight,
              width: 18.0,
              decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(6.0)),
            ),
            SizedBox(
              height: 6.0,
            ),
            Text(
              this.label,
              style: TextStyle(
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
