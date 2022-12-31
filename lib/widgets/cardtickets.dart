import 'package:electric_invoice/styles/colors.dart';
import 'package:flutter/material.dart';


class CardTicketFrame extends StatelessWidget {
  const CardTicketFrame({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuary=MediaQuery.of(context).size;
    return SizedBox(
      height: 62,
      width: double.infinity,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
         CardTickets(
           cardImage: 'images/Invoice.png',
           cost: '34.00',
           title: 'Invoice',),
          CardTickets(
            cardImage: 'images/Tickets.png',
            cost: '348.00',
            title: 'Tickets',),
          CardTickets(
            cardImage: 'images/note.png',
            cost: '488.00',
            title: 'Sales',),

        ],
      ),
    );
  }
}

class CardTickets extends StatelessWidget {
  const CardTickets({
    Key? key,
    required this.cardImage,
    required this.title,
    required this.cost,
  }) : super(key: key);
  final String title;
  final String cardImage;
  final String cost;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 8),
      padding: EdgeInsets.only(top: 6, left: 16),
      width: 137,
      height: 62,
      decoration: BoxDecoration(
        color: kColorWhite,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SizedBox(width: 20, height: 20,
                child: Image.asset(cardImage, fit: BoxFit.fill),),
              SizedBox(width: 10,),
              Text(title, style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: kColorGrey,
              ),),
            ],
          ),
         SizedBox(height: 5,),
          Text('\$ $cost',style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            color: kColorBlue,
          ),)
        ],
      ),
    );
  }
}
