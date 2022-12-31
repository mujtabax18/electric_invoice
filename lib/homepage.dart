import 'package:electric_invoice/widgets/customappbar.dart';
import 'package:electric_invoice/widgets/customtotalsalescard.dart';
import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return  Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: ListView(
              children: [
                CustomAppBar(
                  mediaQuery:mediaQuery,
                  name: 'Adam Smith',
                    no: '20604209987',
                  NotificationImage: 'images/Notification1.png',
                  acountImage: 'images/Ellipse 797.png',
                  acountImagePress: (){},
                ),
                CustomTotalSalesCard(cardImage: 'images/upword.png',
                    totalSales: ' 3487.00', cardDropDown: ['test1','test2'])

              ],
            ),
          ),
        )
    );
  }
}


