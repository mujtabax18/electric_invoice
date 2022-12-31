import 'package:flutter/material.dart';
import 'package:electric_invoice/styles/colors.dart';


class CustomTotalSalesCard extends StatelessWidget {
  const CustomTotalSalesCard({
    required this.cardImage ,
    required this.totalSales,
    required this.cardDropDown,
    Key? key}) : super(key: key);
  final String cardImage;
  final String totalSales;
  final List<String> cardDropDown;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
         color: kColorBlue,
        
      ),
      child: Row(
        children: [
          CircleAvatar(
             radius: 16,
              child: SizedBox(
                  width: 22.59,
                  child: Image.asset(cardImage))
          ),
        ],
      ),
    );
  }
}
