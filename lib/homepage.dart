
import 'package:electric_invoice/widgets/cardtickets.dart';
import 'package:electric_invoice/widgets/customappbar.dart';
import 'package:electric_invoice/widgets/custominvoicedropdown.dart';
import 'package:electric_invoice/widgets/customtotalsalescard.dart';
import 'package:electric_invoice/widgets/customnavbar.dart';
import 'package:electric_invoice/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:electric_invoice/widgets/cardwithhiddenpart.dart';
import 'package:electric_invoice/widgets/graphscreen.dart';


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
                  child:GraphScreen(),

                ),
                SizedBox(height: 24,),
                CustomInvoiceDropDown(cardDropDownImage: 'images/dropdown.png',
                    cardDropDown: ['Invoice ','Ticket List','Sales Notes list','Quotation list'],
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
                  dropDown1ValueSelected: (value){setState(() {
                    print(value);

                  });},

                  dropDown1list: ['A4','Ticket', 'XML','CDR'],
                  dropDown1itemicon:'images/savesign.png',
                  dropDown1ValueChanged: '',
                  dropDown2ValueChanged: '',
                  dropDown2ValueSelected: (value){},
                  dropDown2list: [
                    ['images/DropDublicate.png','Duplicate Invoice'],
                  ['images/dropTicket.png','Convert to Ticket'],
                  ['images/dropsalesnote.png', 'Convert to Sales Note'],
                  ['images/dropreferralguide.png','Convert to Referral Guide'],
                  ['images/dropcreditnote.png','Create Credit Note'],
                    ['images/dropdebitnote.png','Create Debit Note'],
                    ['images/dropwhatsapp.png','Send via WhatsApp'],
                  ],

                ),
                SizedBox(height: 50,),
              ],
            ),
          ),
        ),
      bottomNavigationBar: CustomNavbar(),
    );
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


