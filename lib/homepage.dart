import 'package:electric_invoice/widgets/cardtickets.dart';
import 'package:electric_invoice/widgets/customappbar.dart';
import 'package:electric_invoice/widgets/custominvoicedropdown.dart';
import 'package:electric_invoice/widgets/customtotalsalescard.dart';
import 'package:electric_invoice/styles/colors.dart';
import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  String? saleCardDropDownSelectedValue;
  String? invoiceDropDownSelectedValue;
  bool ishidden=true;
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return  Scaffold(
      backgroundColor: kColorBackground,
        body: SafeArea(

          child: Padding(
            padding: const EdgeInsets.only(top: 20, right: 20, left: 20,),
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
                SizedBox(height: 16,),
                CustomTotalSalesCard(cardImage: 'images/upword.png',
                    totalSales: ' 3487.00',
                    cardDropDown: ['Last Week','This Month', 'Last Month','+ Custom'],
                    selectedValue: saleCardDropDownSelectedValue,
                  cardDropDownImage: 'images/dropdown.png',
                  dropdownChanged: (value){
                  setState(() {
                    saleCardDropDownSelectedValue = value as String;
                  });
                  },
                ),
                SizedBox(height: 16,),
                CardTicketFrame(),
                SizedBox(height: 24,),
                Container( width: 318, height: 343,
                  child: Container(color: Colors.lightGreenAccent),),
                SizedBox(height: 24,),
                CustomInvoiceDropDown(cardDropDownImage: 'images/dropdown.png',
                    cardDropDown: ['Invoide ','Test 1'],
                    selectedValue: invoiceDropDownSelectedValue,
                    dropdownChanged: (value){
                        setState(() {
                          invoiceDropDownSelectedValue=value;
                        });
                    }),
                SizedBox(height: 16,),
                CustomSearchBar(
                  onChange: (value){},
                ),
                SizedBox(height: 12,),
                CardWithHiddenPart(
                  id: 'F001-48',
                  no: '20604008977',
                  clientName: 'Canbe A Long...',
                  date: '12-12-2022',
                  time: '12.03 AM',
                  total: '32987.22',
                  operationType: 'Operation Type',
                  documentType: 'Document Type',
                  tags: 'Tags',
                  hidden: ishidden,
                  showMore: (){
                  setState(() {
                    ishidden=!ishidden;
                  });
                  },
                ),
                SizedBox(height: 50,),
              ],
            ),
          ),
        )
    );
  }
}

class CardWithHiddenPart extends StatelessWidget {
  const CardWithHiddenPart({
    required this.id,
    required this.no,
    required this.clientName,
    required this.date,
    required this.time,
    required this.total,
    required this.operationType,
    required this.documentType,
    required this.tags,
    required this.hidden,
    required this.showMore,
    Key? key,
  }) : super(key: key);
  final String id;
  final String no;
  final String clientName;
  final String date;
  final String time;
  final String total;
  final bool hidden;
  final String operationType;
  final String documentType;
  final String tags;
  final VoidCallback showMore;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 12),
      width: double.infinity,
      decoration: BoxDecoration(
        color: kColorWhite,
      ),
      child:Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(id,
                  style: TextStyle(
                    color: kColorBlue,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),),
                  SizedBox(height: 8,),
                  Row(
                    children: [
                      Text('RUC: ', style: TextStyle(
                        color: kColorGrey,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),),
                      Text(no,  style: TextStyle(
                        color: kColorBlue,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),),
                    ],
                  ),
                  SizedBox(height: 20,),
                  Text('Client FullName', style: TextStyle(
                    color: kColorGrey,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),),
                  SizedBox(height: 6,),
                  Text(clientName, style: TextStyle(
                    color: kColorBlue,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),),
                ],
              ),
              Column(
                children: [
                  Row(
                    children: [
                      Container(
                        height: 37,
                        width: 62,
                        color: kColorLight,
                      ),
                      SizedBox(width: 12,),
                      Container(
                        height: 37,
                        width: 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          border: Border.all(color: kColor9)
                        ),
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 9, vertical: 10),
                          child: Image.asset('images/dropdown.png',
                            color: kColorBlue),
                        ),
                      ),
                    ],
                  ),SizedBox(height: 20,),
                  Text(date,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: kColorGrey,
                  ),),
                  SizedBox(height: 6,),
                  Text(time,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: kColorGrey,
                    ),),
                  SizedBox(height: 12,),
                  Text('Total',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: kColorGrey,
                    ),),
                  SizedBox(height: 6,),
                  Text('\$ $total',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: kColorBlue,
                    ),),
                ],
              ),
            ],
          ),
          GestureDetector(
            onTap: showMore,
            child: Container(
              width: double.infinity,
              height: 10,
              child: Image.asset( hidden? 'images/dropdown.png': 'images/dropup.png',
                color:hidden? kColorBlue: kColorGrey,),
            ),
          ),
          SizedBox(height: 20,),
          Visibility(
              visible: !hidden,
              child: Column(
            children: [
              CardHiidenPart(title: 'Operation Type:',
                  value: operationType),
              SizedBox(height: 10,),
              CardHiidenPart(title: 'Document Type:',
              value: documentType),
              SizedBox(height: 10,),
              CardHiidenPart(title: 'Tags:',
                  value: tags),


            ],
          )

          )
        ],
      ),
    );
  }
}

class CardHiidenPart extends StatelessWidget {
  const CardHiidenPart({
    required this.title,
    required this.value,
    Key? key,
  }) : super(key: key);
  final String title;
  final String value;
  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Container(
        width: 160,
        child: Text(title,style: TextStyle(
          color: kColorGrey,
          fontSize: 12,
          fontWeight: FontWeight.w400,
        ),),
      ),

      Text(value,style: TextStyle(
        color: kColorBlue,
        fontSize: 12,
        fontWeight: FontWeight.w400,
      ),),
    ],);
  }
}

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({
   required this.onChange,
    Key? key,
  }) : super(key: key);
    final Function(String) onChange;
  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChange,
      decoration: InputDecoration(
        hintText: 'Search',
        hintStyle: TextStyle(
          color: kColorGrey,
          fontWeight: FontWeight.w400,
          fontSize: 14,
        ),
        filled: true,
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(8))
          ),
          fillColor: kColorWhite,
        prefixIcon: Container(width: 20,
          padding: EdgeInsets.all(10),
          child:  Image.asset('images/search.png'),),
        suffixIcon: Container(width: 20,
            padding: EdgeInsets.all(10),
          child:  Image.asset('images/filter.png'),)
      ),
    );
  }
}


