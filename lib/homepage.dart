
import 'package:electric_invoice/widgets/cardtickets.dart';
import 'package:electric_invoice/widgets/customappbar.dart';
import 'package:electric_invoice/widgets/custominvoicedropdown.dart';
import 'package:electric_invoice/widgets/customtotalsalescard.dart';
import 'package:electric_invoice/widgets/customnavbar.dart';
import 'package:electric_invoice/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:electric_invoice/widgets/cardwithhiddenpart.dart';
import 'package:electric_invoice/widgets/linechartest.dart';
import 'package:electric_invoice/model/chartdatamodel.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> {
  @override
  String? saleCardDropDownSelectedValue;
  String? invoiceDropDownSelectedValue;
  int _navindex=0;

  //Drop Down Lists
  List<ChartData> chartData3 = [
    ChartData(2010, 37),
    ChartData(2011 , 24),
    ChartData(2012, 48),
    ChartData(2013 , 49),
    ChartData(2014 , 70)
  ];
  List<ChartData> chartData2 = [
    ChartData(2010, 27),
    ChartData(2011 , 4),
    ChartData(2012, 28),
    ChartData(2013 , 29),
    ChartData(2014 , 40)
  ];
  List<ChartData> chartData1 = [
    ChartData(2010, 37),
    ChartData(2011 , 14),
    ChartData(2012, 38),
    ChartData(2013 , 29),
    ChartData(2014 , 50)
  ];
  List<ChartData> chartData4 = [
    ChartData(2010, 35),
    ChartData(2011 , 13),
    ChartData(2012, 34),
    ChartData(2013 , 27),
    ChartData(2014 , 40)
  ];
  List<String> totalSalesCardDropDownList=['Last Week','This Month', 'Last Month','+ Custom'];
  List<String> downloadDropDownList=['A4','Ticket', 'XML','CDR'];
  List convertDropDownList=[
    ['images/DropDublicate.png','Duplicate Invoice'],
    ['images/dropTicket.png','Convert to Ticket'],
    ['images/dropsalesnote.png', 'Convert to Sales Note'],
    ['images/dropreferralguide.png','Convert to Referral Guide'],
    ['images/dropcreditnote.png','Create Credit Note'],
    ['images/dropdebitnote.png','Create Debit Note'],
    ['images/dropwhatsapp.png','Send via WhatsApp'],
  ];
  List<String> invoiceDropDownList=['Invoice ','Ticket List','Sales Notes list','Quotation list'];

  bool ishidden=true;
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return  Scaffold(
      backgroundColor: kColorBackground,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric( horizontal: 20,),
            child: ListView(
              children: [
                SizedBox(height: 20,),
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
                    cardDropDown: totalSalesCardDropDownList,
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
                  decoration: BoxDecoration(
                    color: kColorWhite,
                    borderRadius: BorderRadius.circular(20),

                  ),
                  child:Container( color: Colors.transparent,
                    child: Spline_test(
                      chartData1: chartData1,
                      chartData2: chartData2,
                        chartData3: chartData3,
                       chartData4: chartData4,
                      color1: kColor1,
                      color2: kColor4,
                      color3: kColor6,
                      color4: kColor10,
                      labelList: ['Invoice', 'Credit notes',''
                          'Sale notes','Tickets'],

                    ), ),

                ),
                SizedBox(height: 24,),
                CustomInvoiceDropDown(

                    cardDropDown: invoiceDropDownList,
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
                  downloadDropDownlist: downloadDropDownList,
                  downloadDropDownitemicon:'images/savesign.png',
                  downloadDropDownValueChanged: '',
                  convertDropDownValueChanged: '',
                  downloadDropDownValueSelected: (value){},
                  convertDropDownValueSelected: (value){},
                  convertDropDownList: convertDropDownList,

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
                  downloadDropDownlist: downloadDropDownList,
                  downloadDropDownitemicon:'images/savesign.png',
                  downloadDropDownValueChanged: '',
                  convertDropDownValueChanged: '',
                  downloadDropDownValueSelected: (value){},
                  convertDropDownValueSelected: (value){},
                  convertDropDownList: convertDropDownList,

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
                  downloadDropDownlist: downloadDropDownList,
                  downloadDropDownitemicon:'images/savesign.png',
                  downloadDropDownValueChanged: '',
                  convertDropDownValueChanged: '',
                  downloadDropDownValueSelected: (value){},
                  convertDropDownValueSelected: (value){},
                  convertDropDownList: convertDropDownList,

                ),

                SizedBox(height: 30,),
              ],
            ),
          ),
        ),
      bottomNavigationBar: CustomNavbar(
        selecteditem: _navindex,
          onTap: (value){setState(() {
            _navindex=value;
          });},
      ),
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


