import 'package:flutter/material.dart';
import 'package:flutter_budget_ui/models/category_model.dart';
import 'package:flutter_budget_ui/models/expense_model.dart';
import 'file:///C:/Users/John/Desktop/practic/Flutter/projects/flutter_budget_ui/lib/helperFunction/get_color.dart';
import 'package:flutter_budget_ui/widgets/radial_painter.dart';

class CategoryScreen extends StatefulWidget {
  final Category category;

  const CategoryScreen({Key key, this.category}) : super(key: key);

  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  _buildExpenses() {
    List<Widget> expensesList = [];
    widget.category.expenses.forEach((Expense expense) {
      expensesList.add(Container(
        alignment: Alignment.center,
        margin: EdgeInsets.all(10.0),
        height: 80.0,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black38,
              offset: Offset(0, 2),
              blurRadius: 6.0,
            ),
          ],
        ),
        child: Padding(
          padding:  EdgeInsets.all(30.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                expense.name,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),
              ),
              Text(
                '\$'+expense.cost.toStringAsFixed(2),
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 20.0,
                  color: Colors.red,
                ),
              ),
            ],
          ),
        ),
      ));
    });
    return Column(
      children: expensesList,
    );
  }

  @override
  Widget build(BuildContext context) {
    //create var for Radial progress bar
    double totalAmountSpent = 0;
    widget.category.expenses.forEach((Expense expense) {
      totalAmountSpent += expense.cost;
    });
    final double amountLeft = widget.category.maxAmount - totalAmountSpent;
    final double percent = amountLeft / widget.category.maxAmount;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.category.name),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.add,
              color: Colors.white,
              size: 30.0,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(20.0),
              padding: EdgeInsets.all(20.0),
              height: 250.0,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black38,
                      offset: Offset(0, 5),
                      blurRadius: 8.0),
                ],
              ),
              child: CustomPaint(
                foregroundPainter: RadialPainter(
                  byColor: Colors.grey[200],
                  lineColor: getColor(context: context, percent: percent),
                  width: 15.0,
                  percent: percent,
                ),
                child: Center(
                  child: Text(
                    '\$${amountLeft.toStringAsFixed(2)}/\$${widget.category.maxAmount.toStringAsFixed(2)}',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            _buildExpenses(),
          ],
        ),
      ),
    );
  }
}
